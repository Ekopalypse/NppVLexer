module winapi

fn C.MessageBoxW(voidptr, &u16, &u16, u32) int
pub fn message_box(hwnd voidptr, text string, title string, flags u32) int {
	return C.MessageBoxW(hwnd, text.to_wide(), title.to_wide(), flags)
}

fn C.SendMessageW(hwnd voidptr, msg u32, wparam usize, lparam isize) isize
pub fn send_message(hwnd voidptr, msg u32, wparam usize, lparam isize) isize {
	return C.SendMessageW(hwnd, msg, wparam, lparam)
}

fn C.OutputDebugStringA(output_string &u8)
pub fn output_debug_string(output string) {
	C.OutputDebugStringA(output.str)
}
