module scintilla

import winapi { send_message }

__global (
	editor Editor
)

struct SciNotifyHeader {
pub mut:
	hwnd_from voidptr
	id_from usize
	code u32
}

pub struct SCNotification {
pub mut:
	nmhdr SciNotifyHeader
	position isize					// SCN_STYLENEEDED, SCN_DOUBLECLICK, SCN_MODIFIED, SCN_MARGINCLICK, 
									// SCN_NEEDSHOWN, SCN_DWELLSTART, SCN_DWELLEND, SCN_CALLTIPCLICK, 
									// SCN_HOTSPOTCLICK, SCN_HOTSPOTDOUBLECLICK, SCN_HOTSPOTRELEASECLICK, 
									// SCN_INDICATORCLICK, SCN_INDICATORRELEASE, 
									// SCN_USERLISTSELECTION, SCN_AUTOCSELECTION
	
	ch int							// SCN_CHARADDED, SCN_KEY, SCN_AUTOCCOMPLETED, SCN_AUTOCSELECTION, 
									// SCN_USERLISTSELECTION
	
	modifiers int					// SCN_KEY, SCN_DOUBLECLICK, SCN_HOTSPOTCLICK, SCN_HOTSPOTDOUBLECLICK, 
									// SCN_HOTSPOTRELEASECLICK, SCN_INDICATORCLICK, SCN_INDICATORRELEASE, 
	
	modification_type int			// SCN_MODIFIED
	
	text &char						// SCN_MODIFIED, SCN_USERLISTSELECTION, 
									// SCN_AUTOCSELECTION, SCN_URIDROPPED
	
	length isize					// SCN_MODIFIED 
	lines_added isize				// SCN_MODIFIED 
	message int						// SCN_MACRORECORD 
	wparam usize					// SCN_MACRORECORD 
	lparam isize					// SCN_MACRORECORD 
	line isize						// SCN_MODIFIED 
	fold_level_now int				// SCN_MODIFIED 
	fold_level_prev int				// SCN_MODIFIED 
	margin int						// SCN_MARGINCLICK 
	list_type int					// SCN_USERLISTSELECTION 
	x int							// SCN_DWELLSTART, SCN_DWELLEND 
	y int							// SCN_DWELLSTART, SCN_DWELLEND 
	token int						// SCN_MODIFIED with SC_MOD_CONTAINER 
	annotation_lines_added isize	// SCN_MODIFIED with SC_MOD_CHANGEANNOTATION 
	updated int						// SCN_UPDATEUI 
	list_completion_method int		// SCN_AUTOCSELECTION, SCN_AUTOCCOMPLETED, SCN_USERLISTSELECTION, 
	character_source int			// SCN_CHARADDED 
}

pub type SCI_FN_DIRECT = fn(hwnd isize, msg int, param usize, lparam isize) isize

pub struct Editor {
pub mut:
	main_func SCI_FN_DIRECT
	main_hwnd voidptr
	second_func SCI_FN_DIRECT
	second_hwnd voidptr
	current_func SCI_FN_DIRECT
	current_hwnd voidptr
}

[inline]
fn (e Editor) call(msg int, wparam usize, lparam isize) isize {
	return e.current_func(e.current_hwnd, msg, wparam, lparam)
}

pub fn create_editors(main_handle voidptr, second_handle voidptr) Editor {
	mut editor := Editor{}
	editor.main_func = SCI_FN_DIRECT(send_message(main_handle, 2184, 0, 0))
	editor.main_hwnd = voidptr(send_message(main_handle, 2185, 0, 0))
	editor.second_func = SCI_FN_DIRECT(send_message(second_handle, 2184, 0, 0))
	editor.second_hwnd = voidptr(send_message(second_handle, 2185, 0, 0))
	editor.current_func = editor.main_func
	editor.current_hwnd = editor.main_hwnd
	return editor
}

pub fn (e Editor) line_from_position(position usize) isize {
	return e.call(sci_linefromposition, position, 0)
}

pub fn (e Editor) get_char_at(position usize) u8 {
	return u8(e.call(sci_getcharat, position, 0))
}

pub fn (e Editor) get_lexer_language() string {
	length := e.call(sci_getlexerlanguage, 0, 0)
	if length == 0 { return 'SCLEX_CONTAINER' }
	mut language_ptr := vcalloc(int(length))
	e.call(sci_getlexerlanguage, 0, isize(language_ptr))
	return unsafe { language_ptr.vstring() }
}

pub fn (e Editor) set_debug_margin(width isize) {
	e.call(sci_setmargins, 4, 0)
	e.call(sci_setmargintypen, 3, sc_margin_text)
	e.call(sci_setmarginwidthn, 3, width)
}

pub fn (e Editor) set_debug_margin_text(line usize, level isize) {
	e.call(sci_marginsettext, line, isize('$level'.str))
}

pub fn (e Editor) change_insertion(mod_text string) {
	e.call(sci_changeinsertion, usize(mod_text.len), isize(mod_text.str))
}

pub fn (e Editor) get_line_indentation(line usize) isize {
	return e.call(sci_getlineindentation, line, 0)
}

pub fn (e Editor) get_tab_width() isize {
	return e.call(sci_gettabwidth, 0, 0)
}

pub fn (e Editor) get_eol_mode() isize {
	return e.call(sci_geteolmode, 0, 0)
}
