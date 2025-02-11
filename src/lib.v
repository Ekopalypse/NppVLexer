module npp_plugin

import os
import notepadpp
import scintilla as sci
import vlexer { Lexer }
import winapi { message_box, output_debug_string }
import plugin_data

fn C._vinit(int, voidptr)
fn C._vcleanup()
fn C.GC_INIT()

@[export: isUnicode]
fn is_unicode() bool {
	return true
}

@[export: getName]
fn get_name() &u16 {
	return plugin_data.plugin_name_wide
}

@[export: setInfo]
fn set_info(nppData plugin_data.NppData) {
	notepadpp.create(nppData.npp_handle)
	sci.create_editors(nppData.scintilla_main_handle, nppData.scintilla_second_handle)

	lang_xml_path := os.join_path(notepadpp.npp.plugin_config_dir, plugin_data.lexer_name + '.xml')
	if !os.exists(lang_xml_path) {
		mut is_dark_mode_enabled := false
		if notepadpp.npp.get_notepad_version() >= 0x8019a {
			is_dark_mode_enabled = notepadpp.npp.is_darkmode_enabled()
		}
		os.write_file(lang_xml_path, if is_dark_mode_enabled { plugin_data.dark_xml } else {plugin_data.light_xml}) or {
			msg := 'Unable to create VLang xml file\n${lang_xml_path}'
			message_box(notepadpp.npp.hwnd, msg, 'Error', u32(C.MB_OK | C.MB_ICONERROR))
		}
	}
}

@[export: getFuncsArray]
fn get_funcs_array(mut nb_func &int) &plugin_data.FuncItem {
	menu_functions := {
		'Toggle FoldDebug Margin': toggle_debug_margin
	}

	for k, v in menu_functions {
		mut func_name := [64]u16{init: 0}
		func_name_length := k.len * 2
		unsafe {
			C.memcpy(&func_name[0], k.to_wide(), if func_name_length < 127 { func_name_length } else { 126 })
		}
		mut func_items_ := unsafe { plugin_data.func_items }
		func_items_ << plugin_data.FuncItem{
			item_name: func_name
			p_func: v
			cmd_id: 0
			init_to_check: false
			p_sh_key: voidptr(0)
		}
	}

	unsafe { *nb_func = plugin_data.func_items.len }
	return plugin_data.func_items.data
}

@[export: beNotified]
fn be_notified(notification &sci.SCNotification) {
	match notification.nmhdr.code {
		notepadpp.nppn_ready {}
		notepadpp.nppn_bufferactivated {
			sci.set_current_editor(notepadpp.npp.get_current_view())
			if sci.editor.get_lexer_language() == plugin_data.lexer_name && lexer.show_debug_margin {
				sci.editor.set_debug_margin(44)
			} else {
				sci.editor.set_debug_margin(0)
			}
		}
		notepadpp.nppn_externallexerbuffer {
			output_debug_string('nppn_externallexerbuffer')
			notepadpp.npp.set_external_lexer_auto_indent_mode()
		}
		else {}
	}
}

@[export: messageProc]
fn message_proc(msg u32, wparam usize, lparam isize) isize {
	return 1
}

fn toggle_debug_margin() {
	if sci.editor.get_lexer_language() == plugin_data.lexer_name {
		lexer.show_debug_margin = !lexer.show_debug_margin
		sci.editor.set_debug_margin(if lexer.show_debug_margin { 44 } else { 0 })
	}
}

@[callconv: stdcall]
@[export: DllMain]
fn main(hinst voidptr, fdw_reason int, lp_reserved voidptr) bool {
	match fdw_reason {
		C.DLL_PROCESS_ATTACH {
			$if static_boehm ? {
				C.GC_INIT()
			}
			C._vinit(0, 0)
			lexer = Lexer{}
		}
		C.DLL_THREAD_ATTACH {}
		C.DLL_THREAD_DETACH {}
		C.DLL_PROCESS_DETACH {}
		else {
			return false
		}
	}
	return true
}
