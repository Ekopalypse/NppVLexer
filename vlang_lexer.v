module plugin_core

import os
import notepadpp
import scintilla as sci
import vlexer
import winapi { message_box }

$if msvc {
	// #flag -lD:\\ProgramData\\Compiler\\gc-8.0.4\\bin\\gc64_dll  // 64bit dll usage
	#flag -lD:\\ProgramData\\Compiler\\gc-8.0.4\\bin\\gc        // static lib usage
}

fn C._vinit(int, voidptr)
fn C._vcleanup()
fn C.GC_INIT()

__global (
	npp_data   NppData
	func_items []FuncItem
)

const (
	plugin_name   = 'VLang'
	language_name = 'VLang'
)

struct NppData {
mut:
	npp_handle              voidptr
	scintilla_main_handle   voidptr
	scintilla_second_handle voidptr
}

struct FuncItem {
mut:
	item_name     [64]u16
	p_func        fn ()
	cmd_id        int
	init_to_check bool
	p_sh_key      voidptr
}

[export: isUnicode]
fn is_unicode() bool {
	return true
}

[export: getName]
fn get_name() &u16 {
	return plugin_core.plugin_name.to_wide()
}

[export: setInfo]
fn set_info(nppData NppData) {
	npp_data = nppData
	npp = notepadpp.Npp{npp_data.npp_handle}
	editor = sci.create_editors(nppData.scintilla_main_handle, nppData.scintilla_second_handle)

	config_dir := npp.get_plugin_config_dir()
	lang_xml := os.join_path(config_dir, plugin_core.language_name + '.xml')
	if !os.exists(lang_xml) {
		if !create_lang_xml(lang_xml) {
			msg := 'Unable to create VLang xml file\n$lang_xml'
			message_box(npp_data.npp_handle, msg, 'Error', u32(C.MB_OK | C.MB_ICONERROR))
		}
	}
}

[export: getFuncsArray]
fn get_funcs_array(mut nb_func &int) &FuncItem {
	menu_functions := {
		'Toggle FoldDebug Margin': toggle_debug_margin
	}

	for k, v in menu_functions {
		mut func_name := [64]u16{init: 0}
		func_name_length := k.len * 2
		unsafe { C.memcpy(&func_name[0], k.to_wide(), if func_name_length < 128 {
			func_name_length
		} else {
			127
		}) }
		func_items << FuncItem{
			item_name: func_name
			p_func: v
			cmd_id: 0
			init_to_check: false
			p_sh_key: voidptr(0)
		}
	}
	unsafe {
		*nb_func = func_items.len
	}
	return func_items.data
}

[export: beNotified]
fn be_notified(notification &sci.SCNotification) {
	match notification.nmhdr.code {
		notepadpp.nppn_ready {}
		notepadpp.nppn_bufferactivated {
			current_view := npp.get_current_view()
			if current_view == 0 {
				editor.current_func = editor.main_func
				editor.current_hwnd = editor.main_hwnd
			} else {
				editor.current_func = editor.second_func
				editor.current_hwnd = editor.second_hwnd
			}
			if editor.get_lexer_language() == plugin_core.language_name && show_debug_margin {
				editor.set_debug_margin(44)
			} else {
				editor.set_debug_margin(0)
			}
		}
		sci.scn_modified {
			if notification.modification_type & sci.sc_mod_insertcheck == sci.sc_mod_insertcheck {
				unsafe {
					if notification.text.vstring() in ['\n', '\r\n'] {
						mod_text := smart_indent(u64(notification.position))
						editor.change_insertion(mod_text)
					}
				}
			}
		}
		else {}
	}
}

[export: messageProc]
fn message_proc(msg u32, wparam usize, lparam isize) isize {
	return 1
}

[inline]
fn smart_indent(pos usize) string {
	current_line := editor.line_from_position(pos)
	current_indent := editor.get_line_indentation(usize(current_line))
	tab_width := editor.get_tab_width()
	eol := match editor.get_eol_mode() {
		0 { '\r\n' }
		1 { '\r' }
		else { '\n' }
	}
	mut add_tabs := '\t'
	if current_indent > 0 {
		add_tabs = '\t'.repeat(int(current_indent / tab_width) + 1)
	}
	if int(editor.get_char_at(pos - 1)) in [`{`, `(`, `[`]
		&& int(editor.get_char_at(pos)) in [`}`, `)`, `]`] {
		return eol + add_tabs + eol
	}
	return eol
}

fn toggle_debug_margin() {
	if editor.get_lexer_language() == plugin_core.language_name {
		show_debug_margin = !show_debug_margin
		editor.set_debug_margin(if show_debug_margin { 44 } else { 0 })
	}
}

fn create_lang_xml(path string) bool {
	text := r'<?xml version="1.0" encoding="UTF-8" ?>
<NotepadPlus>
    <Languages>
        <Language name="VLang" ext="v" commentLine="//" commentStart="/*" commentEnd="*/">
            <Keywords name="instre1">as asm assert atomic break continue defer else false for go goto if in is isreftype lock match mut none or pub return rlock select shared sizeof static true type typeof volatile print println while</Keywords>
            <Keywords name="instre2">i8 i16 i32 i64 u8 u16 u32 u64 f32 f64 int string any char byte bool isize usize size_t rune</Keywords>
            <Keywords name="type1">void voidptr charptr byteptr</Keywords>
            <Keywords name="type2">__global __offsetof</Keywords>
            <Keywords name="type3">fn array map chan struct enum interface union import module unsafe const</Keywords>
            <Keywords name="type4">attrtwo debuglivetest deprecated direct_array_access export inline manualfree testing trusted unsafe callconv stdcall</Keywords>
            <Keywords name="type5" />
            <Keywords name="type6" />
        </Language>
    </Languages>
    <LexerStyles>
        <LexerType name="VLang" desc="VLang" ext="vv" excluded="no">
            <WordsStyle styleID="0"  name="Default"             fgColor="ABB2BF" bgColor="292C34" colorStyle="0" fontStyle="0" />
            <WordsStyle styleID="1"  name="LineComments"        fgColor="5C636F" bgColor="292C34" colorStyle="1" fontStyle="0" />
            <WordsStyle styleID="2"  name="BlockComments"       fgColor="5C636F" bgColor="292C34" colorStyle="1" fontStyle="0" />
            <WordsStyle styleID="3"  name="Numbers"             fgColor="D8A776" bgColor="292C34" colorStyle="1" fontStyle="0" />
            <WordsStyle styleID="4"  name="Operators"           fgColor="56B6C2" bgColor="292C34" colorStyle="1" fontStyle="0" />
            <WordsStyle styleID="5"  name="Strings"             fgColor="99C37B" bgColor="292C34" colorStyle="1" fontStyle="0" />
            <WordsStyle styleID="6"  name="Keywords1"           fgColor="B67DCC" bgColor="292C34" colorStyle="1" fontStyle="0" keywordClass="instre1" />
            <WordsStyle styleID="7"  name="Keywords2"           fgColor="FFE064" bgColor="292C34" colorStyle="1" fontStyle="0" keywordClass="instre2" />
            <WordsStyle styleID="8"  name="Keywords3"           fgColor="FFFFB2" bgColor="292C34" colorStyle="1" fontStyle="0" keywordClass="type1"   />
            <WordsStyle styleID="9"  name="Keywords4"           fgColor="E06C75" bgColor="292C34" colorStyle="1" fontStyle="0" keywordClass="type2"   />
            <WordsStyle styleID="10" name="Keywords5"           fgColor="BD66D8" bgColor="292C34" colorStyle="1" fontStyle="0" keywordClass="type3"   />
            <WordsStyle styleID="11" name="Keywords6"           fgColor="56B6C2" bgColor="292C34" colorStyle="1" fontStyle="0" keywordClass="type4"   />
            <WordsStyle styleID="12" name="Keywords7"           fgColor="BD66D8" bgColor="292C34" colorStyle="1" fontStyle="0" keywordClass="type5"   />
            <WordsStyle styleID="13" name="Keywords8"           fgColor="E5C07B" bgColor="292C34" colorStyle="1" fontStyle="0" keywordClass="type6"   />
            <WordsStyle styleID="14" name="Functions"           fgColor="59ACFF" bgColor="292C34" colorStyle="1" fontStyle="0" />
            <WordsStyle styleID="15" name="DataStructures"      fgColor="59ACFF" bgColor="292C34" colorStyle="1" fontStyle="0" />
            <WordsStyle styleID="16" name="CFunctions"          fgColor="59ACFF" bgColor="292C34" colorStyle="1" fontStyle="0" />
            <WordsStyle styleID="17" name="StringInterpolation" fgColor="FEA57A" bgColor="292C34" colorStyle="1" fontStyle="0" />
            <WordsStyle styleID="20" name="Warnings"            fgColor="FFFF00" bgColor="292C34" colorStyle="1" fontStyle="0" />
            <WordsStyle styleID="21" name="Errors"              fgColor="FF0000" bgColor="292C34" colorStyle="1" fontStyle="0" />
        </LexerType>
    </LexerStyles>
</NotepadPlus>
'
	os.write_file(path, text) or { return false }
	return true
}

[callconv: stdcall]
[export: DllMain]
fn main(hinst voidptr, fdw_reason int, lp_reserved voidptr) bool {
	match fdw_reason {
		C.DLL_PROCESS_ATTACH {
			$if static_boehm ? {
				C.GC_INIT()
			}
			C._vinit(0, 0)
			lexer = vlexer.Lexer{}
			show_debug_margin = false
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
