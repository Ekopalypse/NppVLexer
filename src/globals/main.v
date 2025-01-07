module globals

__global (
	npp_data   NppData
	func_items []FuncItem
)

pub const plugin_name = 'VLang'
pub const plugin_name_wide = 'VLang'.to_wide()
// pub const lexer_name = plugin_name

pub struct NppData {
pub mut:
	npp_handle              voidptr
	scintilla_main_handle   voidptr
	scintilla_second_handle voidptr
}

pub struct FuncItem {
pub mut:
	item_name     [64]u16
	p_func        fn () = unsafe { nil }
	cmd_id        int
	init_to_check bool
	p_sh_key      voidptr
}
