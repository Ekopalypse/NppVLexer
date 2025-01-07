module vlexer

import scintilla as sci

#flag -lKernel32

fn C.OutputDebugStringA(output_string &u8)

__global lexer Lexer

pub const lexer_name = 'VLang'
const key_words = &Keywords{}
const lexer_desc = 'V Programming Language'
const vtable = ILexerVtable{}
const ilexer = ILexer{&vtable}
const fold_level_footer_flag = 0x4000

struct ILexer {
	vtable &ILexerVtable
}

struct ILexerVtable {
	// ILexer 4
	vtbl_version                      fn (self &ILexer) int                                                                     = version
	vtbl_release                      fn (self &ILexer)                                                                         = release
	vtbl_property_names               fn (self &ILexer) &char                                                                   = property_names
	vtbl_property_type                fn (self &ILexer, name &char) int                                                         = property_type
	vtbl_describe_property            fn (self &ILexer, name &char) &char                                                       = describe_property
	vtbl_property_set                 fn (self &ILexer, key &char, val &char) isize                                             = property_set
	vtbl_describe_word_list_sets      fn (self &ILexer) &char                                                                   = describe_word_list_sets
	vtbl_word_list_set                fn (self &ILexer, kw_list_index int, key_words &char) isize                               = word_list_set
	vtbl_lex                          fn (self &ILexer, start_pos usize, length_doc isize, init_style int, p_access &IDocument) = lex
	vtbl_fold                         fn (self &ILexer, start_pos usize, length_doc isize, init_style int, p_access &IDocument) = fold
	vtbl_private_call                 fn (self &ILexer, operation int, pointer voidptr) voidptr                                 = private_call
	vtbl_line_end_types_supported     fn (self &ILexer) int                                                                     = line_end_types_supported
	vtbl_allocate_sub_styles          fn (self &ILexer, style_base int, number_styles int) int                                  = allocate_sub_styles
	vtbl_sub_styles_start             fn (self &ILexer, style_base int) int                                                     = sub_styles_start
	vtbl_sub_styles_length            fn (self &ILexer, style_base int) int                                                     = sub_styles_length
	vtbl_style_from_sub_style         fn (self &ILexer, sub_style int) int                                                      = style_from_sub_style
	vtbl_primary_style_from_style     fn (self &ILexer, style int) int                                                          = primary_style_from_style
	vtbl_free_sub_styles              fn (self &ILexer)                                                                         = free_sub_styles
	vtbl_set_identifiers              fn (self &ILexer, style int, identifiers &char)                                           = set_identifiers
	vtbl_distance_to_secondary_styles fn (self &ILexer) int                                                                     = distance_to_secondary_styles
	vtbl_get_sub_style_bases          fn (self &ILexer) &char                                                                   = get_sub_style_bases
	vtbl_named_styles                 fn (self &ILexer) int                                                                     = named_styles
	vtbl_name_of_style                fn (self &ILexer, style int) &char                                                        = name_of_style
	vtbl_tags_of_style                fn (self &ILexer, style int) &char                                                        = tags_of_style
	vtbl_description_of_style         fn (self &ILexer, style int) &char                                                        = description_of_style
	// ILexer 5
	vtbl_get_name       fn (self &ILexer) &char                                                                                 = get_name
	vtbl_get_identifier fn (self &ILexer) int                                                                                   = get_identifier
	vtbl_get_property   fn (self &ILexer, key &char) &char                                                                      = get_property
}

// IDocument interface
struct IDocument {
	vtable &IDocumentVtable
}

struct IDocumentVtable {
	version                          fn (self &IDocument) int                                                  = voidptr(0)
	set_error_status                 fn (self &IDocument, status int)                                          = voidptr(0)
	length                           fn (self &IDocument) isize                                                = voidptr(0)
	get_char_range                   fn (self &IDocument, buffer &char, position isize, length_retrieve isize) = voidptr(0)
	style_at                         fn (self &IDocument, position isize) char                                 = voidptr(0)
	line_from_position               fn (self &IDocument, position isize) isize                                = voidptr(0)
	line_start                       fn (self &IDocument, line isize) isize                                    = voidptr(0)
	get_level                        fn (self &IDocument, line isize) int                                      = voidptr(0)
	set_level                        fn (self &IDocument, line isize, level int) int                           = voidptr(0)
	get_line_state                   fn (self &IDocument, line isize) int                                      = voidptr(0)
	set_line_state                   fn (self &IDocument, line isize, state int) int                           = voidptr(0)
	start_styling                    fn (self &IDocument, position isize)                                      = voidptr(0)
	set_style_for                    fn (self &IDocument, length isize, style char) bool                       = voidptr(0)
	set_styles                       fn (self &IDocument, length isize, styles &char) bool                     = voidptr(0)
	decoration_set_current_indicator fn (self &IDocument, indicator int)                                       = voidptr(0)
	decoration_fill_range            fn (self &IDocument, position isize, value int, fill_length isize)        = voidptr(0)
	change_lexer_state               fn (self &IDocument, start isize, end isize)                              = voidptr(0)
	code_page                        fn (self &IDocument) int                                                  = voidptr(0)
	is_dbcs_lead_byte                fn (self &IDocument, ch char) bool                                        = voidptr(0)
	buffer_pointer                   fn (self &IDocument) &char                                                = voidptr(0)
	get_line_indentation             fn (self &IDocument, line isize) int                                      = voidptr(0)
	line_end                         fn (self &IDocument, line isize) isize                                    = voidptr(0)
	get_relative_position            fn (self &IDocument, position_start isize, character_offset isize) isize  = voidptr(0)
	get_character_and_width          fn (self &IDocument, position isize, p_width &isize) int                  = voidptr(0)
}

enum LexState {
	notset               = -1
	default              = 0
	comment_line         = 1
	comment_block        = 2
	number               = 3
	operator             = 4
	strings              = 5
	kw_list1             = 6
	kw_list2             = 7
	kw_list3             = 8
	kw_list4             = 9
	kw_list5             = 10
	kw_list6             = 11
	kw_list7             = 12
	kw_list8             = 13
	functions            = 14
	data_structures      = 15
	c_functions          = 16
	string_interpolation = 17
}

struct Keywords {
mut:
	kw1 []string
	kw2 []string
	kw3 []string
	kw4 []string
	kw5 []string
	kw6 []string
	kw7 []string
	kw8 []string
}

pub struct Lexer {
pub mut:
	show_debug_margin    bool
mut:
	buffer               string
	length               usize
	position             usize
	end_pos              usize
	state                LexState
	next_state           LexState
	before_previous_char u8
	previous_char        u8
	next_char            u8
	nested_comment_block int
	string_starts_with   u8
	current_word         string
	is_keyword_or_number bool
	is_raw_string        bool
}

fn (mut l Lexer) init(pos usize, length isize, buffer_ptr &char, doc_length isize) {
	l.buffer = unsafe { buffer_ptr.vstring_literal_with_len(int(doc_length))[int(pos)..int(pos) + int(length)] }
	l.length = usize(length)
	l.position = pos
	l.end_pos = pos + l.length
	l.state = LexState.default
	l.next_state = LexState.notset
	l.before_previous_char = ` `
	l.previous_char = ` `
	l.next_char = ` `
	l.current_word = ''
	l.is_keyword_or_number = false
	// The following elements should not be initialized, because the old state is needed
	// l.nested_comment_block = 0
	// l.string_starts_with = ` `
	// l.is_raw_string
}

// lexer helper functions
@[inline]
fn is_word_char(ch u8) bool {
	return (ch >= `0` && ch <= `9`) || (ch >= `a` && ch <= `z`)
		|| (ch >= `A` && ch <= `Z`) || ch == `_`
}

@[inline]
fn is_word_start(ch u8) bool {
	return (ch >= `a` && ch <= `z`) || (ch >= `A` && ch <= `Z`) || ch == `_`
}

@[inline]
fn is_number_char(ch u8) bool {
	return (ch >= `0` && ch <= `9`) || (ch >= `a` && ch <= `f`) || ch == `o`
		|| ch == `x` || (ch >= `A` && ch <= `F`) || ch == `O` || ch == `X`
		|| ch == `_`
}

// typedef int (EXT_LEXER_DECL *GetLexerCountFn)();
@[export: GetLexerCount]
@[callconv: stdcall]
fn get_lexer_count() int {
	return 1
}

// typedef void (EXT_LEXER_DECL *GetLexerNameFn)(unsigned int Index, char *name, int buflength);
@[export: GetLexerName]
@[callconv: stdcall]
fn get_lexer_name(index u32, name &char, buf_length int) {
	mut src := lexer_name
	if src.len >= buf_length {
		src = src[..buf_length - 1]
	}
	unsafe { C.memcpy(name, src.str, sizeof(src) + 1) }
}

// typedef void (EXT_LEXER_DECL *GetLexerStatusTextFn)(unsigned int Index, TCHAR *desc, int buflength);
@[export: GetLexerStatusText]
@[callconv: stdcall]
fn get_lexer_status_text(index u32, desc &char, buf_length int) {
	mut src := lexer_desc
	if src.len > buf_length {
		src = src[..buf_length]
	}
	unsafe { C.memcpy(desc, src.to_wide(), (src.len + 1) * 2) }
}

// scintilla with ILexer5 start
@[export: CreateLexer]
@[callconv: stdcall]
fn create_lexer(name charptr) &ILexer {
	return &ilexer
}

@[export: GetNameSpace]
@[callconv: stdcall]
fn get_namespace() charptr {
	return 'vlang.VLang'.str
}

// void SetLibraryProperty(const char *key, const char *value)
@[export: SetLibraryProperty]
@[callconv: stdcall]
fn set_library_property(key charptr, value charptr) {
	// ignore for now
}

@[export: GetLibraryPropertyNames]
@[callconv: stdcall]
fn get_library_property_names() charptr {
	return ''.str
}

// scintilla with ILexer5 end

// scintilla with ILexer4 start
@[export: CreateLexerFactory]
@[callconv: stdcall]
fn get_lexer_factory(index int) fn () voidptr {
	return ilexer_implementation
}

@[callconv: stdcall]
fn ilexer_implementation() voidptr {
	return voidptr(&ilexer)
}

// scintilla with ILexer4 end

// virtual int SCI_METHOD Version() const = 0
@[callconv: stdcall]
fn version(self &ILexer) int {
	return 2
}

// virtual void SCI_METHOD Release() = 0
@[callconv: stdcall]
fn release(self &ILexer) {
}

// virtual const char * SCI_METHOD PropertyNames() = 0
@[callconv: stdcall]
fn property_names(self &ILexer) &char {
	return &char(''.str)
}

// virtual int SCI_METHOD PropertyType(const char *name) = 0
@[callconv: stdcall]
fn property_type(self &ILexer, name &char) int {
	return 0
}

// virtual const char * SCI_METHOD DescribeProperty(const char *name) = 0
@[callconv: stdcall]
fn describe_property(self &ILexer, name &char) &char {
	return unsafe { name }
}

// virtual i64 SCI_METHOD PropertySet(const char *key, const char *val) = 0
@[callconv: stdcall]
fn property_set(self &ILexer, key &char, val &char) isize {
	return -1
}

// virtual const char * SCI_METHOD DescribeWordListSets() = 0
@[callconv: stdcall]
fn describe_word_list_sets(self &ILexer) &char {
	return unsafe { &char('kw1\nkw2\nkw3\nkw4\nkw5\nkw6\nkw7\nkw8'.str) }
}

// virtual i64 SCI_METHOD WordListSet(int n, const char *wl) = 0
@[callconv: stdcall]
fn word_list_set(self &ILexer, kw_list_index int, key_word_list &char) isize {
	updated_keywords := unsafe { cstring_to_vstring(key_word_list).split(' ') }
	mut key_words_ := unsafe {key_words}
	match kw_list_index {
		0 { key_words_.kw1 = updated_keywords }
		1 { key_words_.kw2 = updated_keywords }
		2 { key_words_.kw3 = updated_keywords }
		3 { key_words_.kw4 = updated_keywords }
		4 { key_words_.kw5 = updated_keywords }
		5 { key_words_.kw6 = updated_keywords }
		6 { key_words_.kw7 = updated_keywords }
		7 { key_words_.kw8 = updated_keywords }
		else {}
	}
	return kw_list_index
}

// virtual void SCI_METHOD Lex(Sci_PositionU startPos, i64 lengthDoc, int initStyle, IDocument *pAccess) = 0;
@[callconv: stdcall]
fn lex(self &ILexer, start_pos usize, length_doc isize, init_style int, p_access voidptr) {
	idoc := unsafe { &IDocument(p_access) }
	real_doc_length := idoc.vtable.length(p_access)
	buffer_ptr := idoc.vtable.buffer_pointer(p_access)
	if buffer_ptr == 0 {
		return
	}
	C.OutputDebugStringA('start_pos:${start_pos} length_doc:${length_doc} init_style: ${init_style} state: ${lexer.state} next_state: ${lexer.next_state}'.str)
	lexer.init(start_pos, length_doc, buffer_ptr, real_doc_length)
	match init_style {
		// not needed to check LexState.comment_line as scintilla starts lexing from start of line always
		2 {
			lexer.state = LexState.comment_block
			lexer.nested_comment_block = 0
			// go back and find out how many levels are availble
			for i := usize(start_pos - 1); i >= 0; i-- {
				style := idoc.vtable.style_at(p_access, isize(i))
				if style != char(LexState.comment_block) {
					break
				}
				if i > 0 {
					mut current := char(0)
					mut before_current := char(0)
					idoc.vtable.get_char_range(p_access, &current, isize(i), 1)
					idoc.vtable.get_char_range(p_access, &before_current, isize(i - 1),
						1)
					if current == `*` && before_current == `/` {
						lexer.nested_comment_block++
					} else if current == `/` && before_current == `*` {
						lexer.nested_comment_block--
					}
				}
			}
		}
		5 {
			/*
				 ISSUE !!
				 if there is an interpolation within the string the char
				 following the } is identified as the string identifier
			*/

			// go back and find out which char started the string
			for i := start_pos - 1; i >= 0; i-- {
				style := idoc.vtable.style_at(p_access, isize(i))
				if style != char(LexState.strings) && style != char(LexState.string_interpolation) {
					idoc.vtable.get_char_range(p_access, &lexer.string_starts_with, isize(i + 1),
						1)
					break
				}
			}
			lexer.state = LexState.strings
		}
		else {
			lexer.state = LexState.default
			lexer.is_raw_string = false
			lexer.string_starts_with = ` `
			lexer.nested_comment_block = 0
		}
	}

	if lexer.next_state != LexState.notset {
		lexer.state = lexer.next_state
	}
	C.OutputDebugStringA('lexer_state: ${lexer.state}'.str)
	for i := 0; i < length_doc; i++ {
		ch := lexer.buffer[i]

		if i < length_doc - 1 {
			lexer.next_char = lexer.buffer[i + 1]
		} else {
			lexer.next_char = ` `
		}

		match lexer.state {
			.default {
				if is_word_start(ch) {
					if ch == `r` && (lexer.next_char == `"` || lexer.next_char == `'`
						|| lexer.next_char == `\``) {
						lexer.state = LexState.strings
						lexer.is_raw_string = true
						lexer.string_starts_with = lexer.next_char
						i++
					} else {
						word_start := i
						i++
						for i < length_doc {
							if !is_word_char(lexer.buffer[i]) {
								break
							}
							i++
						}
						if i < length_doc {
							lexer.next_char = lexer.buffer[i]
						} else {
							lexer.next_char = ` `
						} // assigning something which isn't significant to the language
						lexer.current_word = lexer.buffer[word_start..i]
						lexer.state = match true {
							lexer.current_word in key_words.kw1 { LexState.kw_list1 }
							lexer.current_word in key_words.kw2 { LexState.kw_list2 }
							lexer.current_word in key_words.kw3 { LexState.kw_list3 }
							lexer.current_word in key_words.kw4 { LexState.kw_list4 }
							lexer.current_word in key_words.kw5 { LexState.kw_list5 }
							lexer.current_word in key_words.kw6 { LexState.kw_list6 }
							lexer.current_word in key_words.kw7 { LexState.kw_list7 }
							lexer.current_word in key_words.kw8 { LexState.kw_list8 }
							lexer.current_word.starts_with('C') && lexer.next_char == `.` { LexState.c_functions }
							lexer.next_char == `(` { LexState.functions }
							else { LexState.default }
						}
						lexer.is_keyword_or_number = true
						lexer.next_state = LexState.default
					}
				} else if ch == `/` && lexer.next_char == `/` {
					lexer.state = LexState.comment_line
				} else if ch == `/` && lexer.next_char == `*` {
					lexer.state = LexState.comment_block
					lexer.nested_comment_block++
				} else if ch == `"` || ch == `'` || ch == `\`` {
					lexer.state = LexState.strings
					lexer.string_starts_with = ch
				} else if ch in [`*`, `/`, `%`, `<`, `>`, `&`, `+`, `-`, `|`, `^`, `!`, `=`, `:`,
					`(`, `)`, `{`, `}`, `[`, `]`] {
					lexer.state = LexState.operator
					lexer.next_state = LexState.default
				} else if ch >= `0` && ch <= `9` {
					number_start := i
					i++
					for i < length_doc {
						if !is_number_char(lexer.buffer[i]) {
							break
						}
						i++
					}
					lexer.current_word = lexer.buffer[number_start..i]
					lexer.state = LexState.number
					lexer.next_state = LexState.default
					lexer.is_keyword_or_number = true
				}
			}
			.comment_line {
				if ch == `\n` {
					lexer.next_state = LexState.default
				}
			}
			.comment_block {
				// TODO: nested comment blocks
				if ch == `/` && lexer.next_char == `*` {
					lexer.nested_comment_block++
				} else if ch == `/` && lexer.previous_char == `*` {
					lexer.nested_comment_block--
					if lexer.nested_comment_block == 0 {
						lexer.next_state = LexState.default
					}
				}
			}
			.number {}
			.operator {}
			.strings {
				// check if string interpolation starts
				if ch == `$` && lexer.next_char == `{` {
					lexer.state = LexState.string_interpolation
					C.OutputDebugStringA('string_interpolation set'.str)
				}
				// like '\'' and '\\' and r'\'
				else if (ch == lexer.string_starts_with && lexer.previous_char == `\\`
					&& lexer.before_previous_char == `\\`)
					|| (ch == lexer.string_starts_with && lexer.previous_char != `\\`)
					|| (ch == lexer.string_starts_with && lexer.next_char != ch
					&& lexer.is_raw_string) {
					lexer.next_state = LexState.default
					lexer.is_raw_string = false
				}
			}
			.string_interpolation {
				if ch == `}` {
					C.OutputDebugStringA('string_interpolation reset'.str)
					lexer.next_state = LexState.strings
				}
			}
			else {}
		}
		lexer.before_previous_char = lexer.previous_char
		if lexer.is_keyword_or_number {
			word_length := lexer.current_word.len

			idoc.vtable.start_styling(p_access, isize(start_pos) + i - word_length)
			idoc.vtable.set_style_for(p_access, word_length, char(lexer.state))

			i--
			lexer.previous_char = lexer.buffer[i]
			lexer.state = lexer.next_state
			lexer.next_state = LexState.notset
			lexer.current_word = ''
			lexer.is_keyword_or_number = false
		} else {
			idoc.vtable.start_styling(p_access, isize(start_pos) + i)
			idoc.vtable.set_style_for(p_access, 1, char(lexer.state))
			lexer.previous_char = ch
			if lexer.next_state != LexState.notset {
				lexer.state = lexer.next_state
				lexer.next_state = LexState.notset
			}
		}
	}
}

// virtual void SCI_METHOD Fold(Sci_PositionU startPos, usize lengthDoc, isize initStyle, IDocument *pAccess) = 0;
@[callconv: stdcall]
fn fold(self &ILexer, start_pos usize, length_doc isize, init_style int, p_access voidptr) {
	/*
	Logic:
		- every line start with a base value of sc_foldlevelbase which is 1024
		- a line with a { does get sc_foldlevelheaderflag = 8192 added
			and next line base value will be increased by 1
		- a line with } decreases the next line base value by 1
	*/
	idoc := unsafe { &IDocument(p_access) }

	mut cur_level := sci.sc_foldlevelbase
	mut cur_line := idoc.vtable.line_from_position(p_access, isize(start_pos))
	if cur_line > 0 {
		prev_level := idoc.vtable.get_level(p_access, cur_line - 1)
		header_flag_set := prev_level & sci.sc_foldlevelheaderflag == sci.sc_foldlevelheaderflag
		footer_flag_set := prev_level & vlexer.fold_level_footer_flag == vlexer.fold_level_footer_flag
		cur_level = match true {
			footer_flag_set && !header_flag_set { (prev_level & sci.sc_foldlevelnumbermask) - 1 }
			header_flag_set && !footer_flag_set { (prev_level & sci.sc_foldlevelnumbermask) + 1 }
			else { prev_level & sci.sc_foldlevelnumbermask }
		}
	}

	end_pos := isize(start_pos) + length_doc
	mut next_level := cur_level

	mut chr := char(0)
	for i := isize(start_pos); i < end_pos; i++ {
		idoc.vtable.get_char_range(p_access, &chr, i, 1)
		current_char := unsafe { chr.vstring_literal_with_len(1) }

		style := idoc.vtable.style_at(p_access, i)
		match true {
			current_char == '{' && style == char(LexState.operator) {
				next_level++
				cur_level |= sci.sc_foldlevelheaderflag
			}
			current_char == '}' && style == char(LexState.operator) {
				next_level--
				cur_level |= vlexer.fold_level_footer_flag
			}
			(current_char == '\n' || i == end_pos - 1) {
				idoc.vtable.set_level(p_access, cur_line, cur_level)
				sci.editor.set_debug_margin_text(usize(cur_line), cur_level & sci.sc_foldlevelnumbermask)
				if current_char == '\n' {
					cur_line++
				}
				cur_level = if next_level & sci.sc_foldlevelnumbermask >= sci.sc_foldlevelbase {
					next_level
				} else {
					sci.sc_foldlevelbase
				}
			}
			else {}
		}
	}
}

// virtual void * SCI_METHOD PrivateCall(int operation, void *pointer) = 0;
@[callconv: stdcall]
fn private_call(self &ILexer, operation int, pointer voidptr) voidptr {
	// not needed/supported by this lexer
	return unsafe { nil }
}

// virtual int SCI_METHOD LineEndTypesSupported() = 0;
@[callconv: stdcall]
fn line_end_types_supported(self &ILexer) int {
	return 0
}

// virtual int SCI_METHOD AllocateSubStyles(int styleBase, int numberStyles) = 0;
@[callconv: stdcall]
fn allocate_sub_styles(self &ILexer, style_base int, number_styles int) int {
	// used for sub styles - not needed/supported by this lexer
	return -1
}

// virtual int SCI_METHOD SubStylesStart(int styleBase) = 0;
@[callconv: stdcall]
fn sub_styles_start(self &ILexer, style_base int) int {
	// used for sub styles - not needed/supported by this lexer
	return -1
}

// virtual int SCI_METHOD SubStylesLength(int styleBase) = 0;
@[callconv: stdcall]
fn sub_styles_length(self &ILexer, style_base int) int {
	// used for sub styles - not needed/supported by this lexer
	return 0
}

// virtual int SCI_METHOD StyleFromSubStyle(int subStyle) = 0;
@[callconv: stdcall]
fn style_from_sub_style(self &ILexer, sub_style int) int {
	// used for sub styles - not needed/supported by this lexer
	return sub_style
}

// virtual int SCI_METHOD PrimaryStyleFromStyle(int style) = 0;
@[callconv: stdcall]
fn primary_style_from_style(self &ILexer, style int) int {
	// used for sub styles - not needed/supported by this lexer
	return style
}

// virtual void SCI_METHOD FreeSubStyles() = 0;
@[callconv: stdcall]
fn free_sub_styles(self &ILexer) {
	// used for sub styles - not needed/supported by this lexer
}

// virtual void SCI_METHOD SetIdentifiers(int style, const char *identifiers) = 0;
@[callconv: stdcall]
fn set_identifiers(self &ILexer, style int, identifiers &char) {
	// used for sub styles - not needed/supported by this lexer
}

// virtual int SCI_METHOD DistanceToSecondaryStyles() = 0;
@[callconv: stdcall]
fn distance_to_secondary_styles(self &ILexer) int {
	// used for sub styles - not needed/supported by this lexer
	return 0
}

// virtual const char * SCI_METHOD GetSubStyleBases() = 0;
@[callconv: stdcall]
fn get_sub_style_bases(self &ILexer) &char {
	// used for sub styles - not needed/supported by this lexer
	return &char(''.str)
}

// virtual int SCI_METHOD NamedStyles() = 0;
@[callconv: stdcall]
fn named_styles(self &ILexer) int {
	return 15
}

// virtual const char * SCI_METHOD NameOfStyle(int style) = 0;
@[callconv: stdcall]
fn name_of_style(self &ILexer, style int) &char {
	style_name := match style {
		0 { 'Default'.str }
		1 { 'Line Comments'.str }
		2 { 'Block Comments'.str }
		3 { 'Numbers'.str }
		4 { 'Operators'.str }
		5 { 'Strings'.str }
		6 { 'Keyword List 1'.str }
		7 { 'Keyword List 2'.str }
		8 { 'Keyword List 3'.str }
		9 { 'Keyword List 4'.str }
		10 { 'Keyword List 5'.str }
		11 { 'Keyword List 6'.str }
		12 { 'Keyword List 7'.str }
		13 { 'Keyword List 8'.str }
		14 { 'C Functions'.str }
		else { ''.str }
	}
	return &char(style_name)
}

// virtual const char * SCI_METHOD TagsOfStyle(int style) = 0;
@[callconv: stdcall]
fn tags_of_style(self &ILexer, style int) &char {
	return name_of_style(self, style)
}

// virtual const char * SCI_METHOD DescriptionOfStyle(int style) = 0;
@[callconv: stdcall]
fn description_of_style(self &ILexer, style int) &char {
	return name_of_style(self, style)
}

// ILexer 5 functions
@[callconv: stdcall]
fn get_name(self &ILexer) &char {
	return unsafe { &char(lexer_name.str) }
}

@[callconv: stdcall]
fn get_identifier(self &ILexer) int {
	return 1
}

@[callconv: stdcall]
fn get_property(self &ILexer, key &char) &char {
	return unsafe { ''.str }
}
