module plugin_data


pub const plugin_name = 'VLang'
pub const plugin_name_wide = 'VLang'.to_wide()
pub const lexer_name = plugin_name
pub const lexer_name_wide = plugin_name_wide
pub const lexer_desc = 'V Programming Language'

pub const func_items = &[]FuncItem{}

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

pub const dark_xml = r'<?xml version="1.0" encoding="UTF-8" ?>
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
