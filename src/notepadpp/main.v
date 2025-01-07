module notepadpp

import winapi { send_message }

pub const npp = &Npp{}

pub struct Npp {
mut:
	hwnd voidptr
pub mut:
	plugin_config_dir string
}

pub fn create(hwnd voidptr) {
	mut npp_ := unsafe { npp }
	npp_.hwnd = hwnd
	npp_.plugin_config_dir = npp_.get_plugin_config_dir()
}

@[inline]
fn (n Npp) call(msg int, wparam usize, lparam isize) isize {
	return send_message(n.hwnd, u32(msg), wparam, lparam)
}

pub fn (n Npp) get_current_view() isize {
	return n.call(nppm_getcurrentview, 0, 0)
}

pub fn (n Npp) get_plugin_config_dir() string {
	buffer_size := int(n.call(nppm_getpluginsconfigdir, 0, 0)) + 1
	mut buffer := vcalloc(buffer_size * 2)

	n.call(nppm_getpluginsconfigdir, usize(buffer_size), isize(buffer))
	return unsafe { string_from_wide(buffer) }
}
