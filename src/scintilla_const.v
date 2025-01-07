module scintilla

// invalid_position = -1
// sci_start = 2000
// sci_optional_start = 3000
// sci_lexer_start = 4000
// sci_addtext = 2001
// sci_addstyledtext = 2002
// sci_inserttext = 2003
pub const sci_changeinsertion = 2672

// sci_clearall = 2004
// sci_deleterange = 2645
// sci_cleardocumentstyle = 2005
// sci_getlength = 2006
pub const sci_getcharat = 2007

// sci_getcurrentpos = 2008
// sci_getanchor = 2009
// sci_getstyleat = 2010
// sci_redo = 2011
// sci_setundocollection = 2012
// sci_selectall = 2013
// sci_setsavepoint = 2014
// sci_getstyledtext = 2015
// sci_canredo = 2016
// sci_markerlinefromhandle = 2017
// sci_markerdeletehandle = 2018
// sci_getundocollection = 2019
// scws_invisible = 0
// scws_visiblealways = 1
// scws_visibleafterindent = 2
// scws_visibleonlyinindent = 3
// sci_getviewws = 2020
// sci_setviewws = 2021
// sctd_longarrow = 0
// sctd_strikeout = 1
// sci_gettabdrawmode = 2698
// sci_settabdrawmode = 2699
// sci_positionfrompoint = 2022
// sci_positionfrompointclose = 2023
// sci_gotoline = 2024
// sci_gotopos = 2025
// sci_setanchor = 2026
// sci_getcurline = 2027
// sci_getendstyled = 2028
// sc_eol_crlf = 0
// sc_eol_cr = 1
// sc_eol_lf = 2
// sci_converteols = 2029
pub const sci_geteolmode = 2030

// sci_seteolmode = 2031
// sci_startstyling = 2032
// sci_setstyling = 2033
// sci_getbuffereddraw = 2034
// sci_setbuffereddraw = 2035
// sci_settabwidth = 2036
pub const sci_gettabwidth = 2121

// sci_cleartabstops = 2675
// sci_addtabstop = 2676
// sci_getnexttabstop = 2677
// sc_cp_utf8 = 65001
// sci_setcodepage = 2037
// sc_ime_windowed = 0
// sc_ime_inline = 1
// sci_getimeinteraction = 2678
// sci_setimeinteraction = 2679
// marker_max = 31
// sc_mark_circle = 0
// sc_mark_roundrect = 1
// sc_mark_arrow = 2
// sc_mark_smallrect = 3
// sc_mark_shortarrow = 4
// sc_mark_empty = 5
// sc_mark_arrowdown = 6
// sc_mark_minus = 7
// sc_mark_plus = 8
// sc_mark_vline = 9
// sc_mark_lcorner = 10
// sc_mark_tcorner = 11
// sc_mark_boxplus = 12
// sc_mark_boxplusconnected = 13
// sc_mark_boxminus = 14
// sc_mark_boxminusconnected = 15
// sc_mark_lcornercurve = 16
// sc_mark_tcornercurve = 17
// sc_mark_circleplus = 18
// sc_mark_circleplusconnected = 19
// sc_mark_circleminus = 20
// sc_mark_circleminusconnected = 21
// sc_mark_background = 22
// sc_mark_dotdotdot = 23
// sc_mark_arrows = 24
// sc_mark_pixmap = 25
// sc_mark_fullrect = 26
// sc_mark_leftrect = 27
// sc_mark_available = 28
// sc_mark_underline = 29
// sc_mark_rgbaimage = 30
// sc_mark_bookmark = 31
// sc_mark_verticalbookmark = 32
// sc_mark_character = 10000
// sc_marknum_folderend = 25
// sc_marknum_folderopenmid = 26
// sc_marknum_foldermidtail = 27
// sc_marknum_foldertail = 28
// sc_marknum_foldersub = 29
// sc_marknum_folder = 30
// sc_marknum_folderopen = 31
// sc_mask_folders = 0xfe000000
// sci_markerdefine = 2040
// sci_markersetfore = 2041
// sci_markersetback = 2042
// sci_markersetbackselected = 2292
// sci_markerenablehighlight = 2293
// sci_markeradd = 2043
// sci_markerdelete = 2044
// sci_markerdeleteall = 2045
// sci_markerget = 2046
// sci_markernext = 2047
// sci_markerprevious = 2048
// sci_markerdefinepixmap = 2049
// sci_markeraddset = 2466
// sci_markersetalpha = 2476
// sc_max_margin = 4
// sc_margin_symbol = 0
// sc_margin_number = 1
// sc_margin_back = 2
// sc_margin_fore = 3
pub const sc_margin_text = 4

// sc_margin_rtext = 5
// sc_margin_colour = 6
pub const sci_setmargintypen = 2240

// sci_getmargintypen = 2241
pub const sci_setmarginwidthn = 2242

// sci_getmarginwidthn = 2243
// sci_setmarginmaskn = 2244
// sci_getmarginmaskn = 2245
// sci_setmarginsensitiven = 2246
// sci_getmarginsensitiven = 2247
// sci_setmargincursorn = 2248
// sci_getmargincursorn = 2249
// sci_setmarginbackn = 2250
// sci_getmarginbackn = 2251
pub const sci_setmargins = 2252

// sci_getmargins = 2253
// style_default = 32
// style_linenumber = 33
// style_bracelight = 34
// style_bracebad = 35
// style_controlchar = 36
// style_indentguide = 37
// style_calltip = 38
// style_folddisplaytext = 39
// style_lastpredefined = 39
// style_max = 255
// sc_charset_ansi = 0
// sc_charset_default = 1
// sc_charset_baltic = 186
// sc_charset_chinesebig5 = 136
// sc_charset_easteurope = 238
// sc_charset_gb2312 = 134
// sc_charset_greek = 161
// sc_charset_hangul = 129
// sc_charset_mac = 77
// sc_charset_oem = 255
// sc_charset_russian = 204
// sc_charset_oem866 = 866
// sc_charset_cyrillic = 1251
// sc_charset_shiftjis = 128
// sc_charset_symbol = 2
// sc_charset_turkish = 162
// sc_charset_johab = 130
// sc_charset_hebrew = 177
// sc_charset_arabic = 178
// sc_charset_vietnamese = 163
// sc_charset_thai = 222
// sc_charset_8859_15 = 1000
// sci_styleclearall = 2050
// sci_stylesetfore = 2051
// sci_stylesetback = 2052
// sci_stylesetbold = 2053
// sci_stylesetitalic = 2054
// sci_stylesetsize = 2055
// sci_stylesetfont = 2056
// sci_styleseteolfilled = 2057
// sci_styleresetdefault = 2058
// sci_stylesetunderline = 2059
// sc_case_mixed = 0
// sc_case_upper = 1
// sc_case_lower = 2
// sc_case_camel = 3
// sci_stylegetfore = 2481
// sci_stylegetback = 2482
// sci_stylegetbold = 2483
// sci_stylegetitalic = 2484
// sci_stylegetsize = 2485
// sci_stylegetfont = 2486
// sci_stylegeteolfilled = 2487
// sci_stylegetunderline = 2488
// sci_stylegetcase = 2489
// sci_stylegetcharacterset = 2490
// sci_stylegetvisible = 2491
// sci_stylegetchangeable = 2492
// sci_stylegethotspot = 2493
// sci_stylesetcase = 2060
// sc_font_size_multiplier = 100
// sci_stylesetsizefractional = 2061
// sci_stylegetsizefractional = 2062
// sc_weight_normal = 400
// sc_weight_semibold = 600
// sc_weight_bold = 700
// sci_stylesetweight = 2063
// sci_stylegetweight = 2064
// sci_stylesetcharacterset = 2066
// sci_stylesethotspot = 2409
// sci_setselfore = 2067
// sci_setselback = 2068
// sci_getselalpha = 2477
// sci_setselalpha = 2478
// sci_getseleolfilled = 2479
// sci_setseleolfilled = 2480
// sci_setcaretfore = 2069
// sci_assigncmdkey = 2070
// sci_clearcmdkey = 2071
// sci_clearallcmdkeys = 2072
// sci_setstylingex = 2073
// sci_stylesetvisible = 2074
// sci_getcaretperiod = 2075
// sci_setcaretperiod = 2076
// sci_setwordchars = 2077
// sci_getwordchars = 2646
// sci_setcharactercategoryoptimization = 2720
// sci_getcharactercategoryoptimization = 2721
// sci_beginundoaction = 2078
// sci_endundoaction = 2079
// indic_plain = 0
// indic_squiggle = 1
// indic_tt = 2
// indic_diagonal = 3
// indic_strike = 4
// indic_hidden = 5
// indic_box = 6
// indic_roundbox = 7
// indic_straightbox = 8
// indic_dash = 9
// indic_dots = 10
// indic_squigglelow = 11
// indic_dotbox = 12
// indic_squigglepixmap = 13
// indic_compositionthick = 14
// indic_compositionthin = 15
// indic_fullbox = 16
// indic_textfore = 17
// indic_point = 18
// indic_pointcharacter = 19
// indic_gradient = 20
// indic_gradientcentre = 21
// indic_explorerlink = 22
// indic_container = 8
// indic_ime = 32
// indic_ime_max = 35
// indic_max = 35
// indicator_container = 8
// indicator_ime = 32
// indicator_ime_max = 35
// indicator_max = 35
// sci_indicsetstyle = 2080
// sci_indicgetstyle = 2081
// sci_indicsetfore = 2082
// sci_indicgetfore = 2083
// sci_indicsetunder = 2510
// sci_indicgetunder = 2511
// sci_indicsethoverstyle = 2680
// sci_indicgethoverstyle = 2681
// sci_indicsethoverfore = 2682
// sci_indicgethoverfore = 2683
// sc_indicvaluebit = 0x1000000
// sc_indicvaluemask = 0xffffff
// sc_indicflag_valuefore = 1
// sci_indicsetflags = 2684
// sci_indicgetflags = 2685
// sci_setwhitespacefore = 2084
// sci_setwhitespaceback = 2085
// sci_setwhitespacesize = 2086
// sci_getwhitespacesize = 2087
// sci_setlinestate = 2092
// sci_getlinestate = 2093
// sci_getmaxlinestate = 2094
// sci_getcaretlinevisible = 2095
// sci_setcaretlinevisible = 2096
// sci_getcaretlineback = 2097
// sci_setcaretlineback = 2098
// sci_getcaretlineframe = 2704
// sci_setcaretlineframe = 2705
// sci_stylesetchangeable = 2099
// sci_autocshow = 2100
// sci_autoccancel = 2101
// sci_autocactive = 2102
// sci_autocposstart = 2103
// sci_autoccomplete = 2104
// sci_autocstops = 2105
// sci_autocsetseparator = 2106
// sci_autocgetseparator = 2107
// sci_autocselect = 2108
// sci_autocsetcancelatstart = 2110
// sci_autocgetcancelatstart = 2111
// sci_autocsetfillups = 2112
// sci_autocsetchoosesingle = 2113
// sci_autocgetchoosesingle = 2114
// sci_autocsetignorecase = 2115
// sci_autocgetignorecase = 2116
// sci_userlistshow = 2117
// sci_autocsetautohide = 2118
// sci_autocgetautohide = 2119
// sci_autocsetdroprestofword = 2270
// sci_autocgetdroprestofword = 2271
// sci_registerimage = 2405
// sci_clearregisteredimages = 2408
// sci_autocgettypeseparator = 2285
// sci_autocsettypeseparator = 2286
// sci_autocsetmaxwidth = 2208
// sci_autocgetmaxwidth = 2209
// sci_autocsetmaxheight = 2210
// sci_autocgetmaxheight = 2211
// sci_setindent = 2122
// sci_getindent = 2123
// sci_setusetabs = 2124
// sci_getusetabs = 2125
// sci_setlineindentation = 2126
pub const sci_getlineindentation = 2127

// sci_getlineindentposition = 2128
// sci_getcolumn = 2129
// sci_countcharacters = 2633
// sci_countcodeunits = 2715
// sci_sethscrollbar = 2130
// sci_gethscrollbar = 2131
// sc_iv_none = 0
// sc_iv_real = 1
// sc_iv_lookforward = 2
// sc_iv_lookboth = 3
// sci_setindentationguides = 2132
// sci_getindentationguides = 2133
// sci_sethighlightguide = 2134
// sci_gethighlightguide = 2135
// sci_getlineendposition = 2136
// sci_getcodepage = 2137
// sci_getcaretfore = 2138
// sci_getreadonly = 2140
// sci_setcurrentpos = 2141
// sci_setselectionstart = 2142
// sci_getselectionstart = 2143
// sci_setselectionend = 2144
// sci_getselectionend = 2145
// sci_setemptyselection = 2556
// sci_setprintmagnification = 2146
// sci_getprintmagnification = 2147
// sc_print_normal = 0
// sc_print_invertlight = 1
// sc_print_blackonwhite = 2
// sc_print_colouronwhite = 3
// sc_print_colouronwhitedefaultbg = 4
// sc_print_screencolours = 5
// sci_setprintcolourmode = 2148
// sci_getprintcolourmode = 2149
// scfind_none = 0x0
// scfind_wholeword = 0x2
// scfind_matchcase = 0x4
// scfind_wordstart = 0x00100000
// scfind_regexp = 0x00200000
// scfind_posix = 0x00400000
// scfind_cxx11regex = 0x00800000
// sci_findtext = 2150
// sci_formatrange = 2151
// sci_getfirstvisibleline = 2152
// sci_getline = 2153
// sci_getlinecount = 2154
// sci_setmarginleft = 2155
// sci_getmarginleft = 2156
// sci_setmarginright = 2157
// sci_getmarginright = 2158
// sci_getmodify = 2159
// sci_setsel = 2160
// sci_getseltext = 2161
// sci_gettextrange = 2162
// sci_hideselection = 2163
// sci_pointxfromposition = 2164
// sci_pointyfromposition = 2165
pub const sci_linefromposition = 2166

// sci_positionfromline = 2167
// sci_linescroll = 2168
// sci_scrollcaret = 2169
// sci_scrollrange = 2569
// sci_replacesel = 2170
// sci_setreadonly = 2171
// sci_null = 2172
// sci_canpaste = 2173
// sci_canundo = 2174
// sci_emptyundobuffer = 2175
// sci_undo = 2176
// sci_cut = 2177
// sci_copy = 2178
// sci_paste = 2179
// sci_clear = 2180
// sci_settext = 2181
// sci_gettext = 2182
// sci_gettextlength = 2183
// sci_getdirectfunction = 2184
// sci_getdirectpointer = 2185
// sci_setovertype = 2186
// sci_getovertype = 2187
// sci_setcaretwidth = 2188
// sci_getcaretwidth = 2189
// sci_settargetstart = 2190
// sci_gettargetstart = 2191
// sci_settargetend = 2192
// sci_gettargetend = 2193
// sci_settargetrange = 2686
// sci_gettargettext = 2687
// sci_targetfromselection = 2287
// sci_targetwholedocument = 2690
// sci_replacetarget = 2194
// sci_replacetargetre = 2195
// sci_searchintarget = 2197
// sci_setsearchflags = 2198
// sci_getsearchflags = 2199
// sci_calltipshow = 2200
// sci_calltipcancel = 2201
// sci_calltipactive = 2202
// sci_calltipposstart = 2203
// sci_calltipsetposstart = 2214
// sci_calltipsethlt = 2204
// sci_calltipsetback = 2205
// sci_calltipsetfore = 2206
// sci_calltipsetforehlt = 2207
// sci_calltipusestyle = 2212
// sci_calltipsetposition = 2213
// sci_visiblefromdocline = 2220
// sci_doclinefromvisible = 2221
// sci_wrapcount = 2235
pub const sc_foldlevelbase = 0x400

// sc_foldlevelwhiteflag = 0x1000
pub const sc_foldlevelheaderflag = 0x2000
pub const sc_foldlevelnumbermask = 0x0fff

// sci_setfoldlevel = 2222
// sci_getfoldlevel = 2223
// sci_getlastchild = 2224
// sci_getfoldparent = 2225
// sci_showlines = 2226
// sci_hidelines = 2227
// sci_getlinevisible = 2228
// sci_getalllinesvisible = 2236
// sci_setfoldexpanded = 2229
// sci_getfoldexpanded = 2230
// sci_togglefold = 2231
// sci_togglefoldshowtext = 2700
// sc_folddisplaytext_hidden = 0
// sc_folddisplaytext_standard = 1
// sc_folddisplaytext_boxed = 2
// sci_folddisplaytextsetstyle = 2701
// sci_folddisplaytextgetstyle = 2707
// sci_setdefaultfolddisplaytext = 2722
// sci_getdefaultfolddisplaytext = 2723
// sc_foldaction_contract = 0
// sc_foldaction_expand = 1
// sc_foldaction_toggle = 2
// sci_foldline = 2237
// sci_foldchildren = 2238
// sci_expandchildren = 2239
// sci_foldall = 2662
// sci_ensurevisible = 2232
// sc_automaticfold_show = 0x0001
// sc_automaticfold_click = 0x0002
// sc_automaticfold_change = 0x0004
// sci_setautomaticfold = 2663
// sci_getautomaticfold = 2664
// sc_foldflag_linebefore_expanded = 0x0002
// sc_foldflag_linebefore_contracted = 0x0004
// sc_foldflag_lineafter_expanded = 0x0008
// sc_foldflag_lineafter_contracted = 0x0010
// sc_foldflag_levelnumbers = 0x0040
// sc_foldflag_linestate = 0x0080
// sci_setfoldflags = 2233
// sci_ensurevisibleenforcepolicy = 2234
// sci_settabindents = 2260
// sci_gettabindents = 2261
// sci_setbackspaceunindents = 2262
// sci_getbackspaceunindents = 2263
// sc_time_forever = 10000000
// sci_setmousedwelltime = 2264
// sci_getmousedwelltime = 2265
// sci_wordstartposition = 2266
// sci_wordendposition = 2267
// sci_israngeword = 2691
// sc_idlestyling_none = 0
// sc_idlestyling_tovisible = 1
// sc_idlestyling_aftervisible = 2
// sc_idlestyling_all = 3
// sci_setidlestyling = 2692
// sci_getidlestyling = 2693
// sc_wrap_none = 0
// sc_wrap_word = 1
// sc_wrap_char = 2
// sc_wrap_whitespace = 3
// sci_setwrapmode = 2268
// sci_getwrapmode = 2269
// sc_wrapvisualflag_none = 0x0000
// sc_wrapvisualflag_end = 0x0001
// sc_wrapvisualflag_start = 0x0002
// sc_wrapvisualflag_margin = 0x0004
// sci_setwrapvisualflags = 2460
// sci_getwrapvisualflags = 2461
// sc_wrapvisualflagloc_default = 0x0000
// sc_wrapvisualflagloc_end_by_text = 0x0001
// sc_wrapvisualflagloc_start_by_text = 0x0002
// sci_setwrapvisualflagslocation = 2462
// sci_getwrapvisualflagslocation = 2463
// sci_setwrapstartindent = 2464
// sci_getwrapstartindent = 2465
// sc_wrapindent_fixed = 0
// sc_wrapindent_same = 1
// sc_wrapindent_indent = 2
// sc_wrapindent_deepindent = 3
// sci_setwrapindentmode = 2472
// sci_getwrapindentmode = 2473
// sc_cache_none = 0
// sc_cache_caret = 1
// sc_cache_page = 2
// sc_cache_document = 3
// sci_setlayoutcache = 2272
// sci_getlayoutcache = 2273
// sci_setscrollwidth = 2274
// sci_getscrollwidth = 2275
// sci_setscrollwidthtracking = 2516
// sci_getscrollwidthtracking = 2517
// sci_textwidth = 2276
// sci_setendatlastline = 2277
// sci_getendatlastline = 2278
// sci_textheight = 2279
// sci_setvscrollbar = 2280
// sci_getvscrollbar = 2281
// sci_appendtext = 2282
// sc_phases_one = 0
// sc_phases_two = 1
// sc_phases_multiple = 2
// sci_getphasesdraw = 2673
// sci_setphasesdraw = 2674
// sc_eff_quality_mask = 0xf
// sc_eff_quality_default = 0
// sc_eff_quality_non_antialiased = 1
// sc_eff_quality_antialiased = 2
// sc_eff_quality_lcd_optimized = 3
// sci_setfontquality = 2611
// sci_getfontquality = 2612
// sci_setfirstvisibleline = 2613
// sc_multipaste_once = 0
// sc_multipaste_each = 1
// sci_setmultipaste = 2614
// sci_getmultipaste = 2615
// sci_gettag = 2616
// sci_linesjoin = 2288
// sci_linessplit = 2289
// sci_setfoldmargincolour = 2290
// sci_setfoldmarginhicolour = 2291
// sc_accessibility_disabled = 0
// sc_accessibility_enabled = 1
// sci_setaccessibility = 2702
// sci_getaccessibility = 2703
// sci_linedown = 2300
// sci_linedownextend = 2301
// sci_lineup = 2302
// sci_lineupextend = 2303
// sci_charleft = 2304
// sci_charleftextend = 2305
// sci_charright = 2306
// sci_charrightextend = 2307
// sci_wordleft = 2308
// sci_wordleftextend = 2309
// sci_wordright = 2310
// sci_wordrightextend = 2311
// sci_home = 2312
// sci_homeextend = 2313
// sci_lineend = 2314
// sci_lineendextend = 2315
// sci_documentstart = 2316
// sci_documentstartextend = 2317
// sci_documentend = 2318
// sci_documentendextend = 2319
// sci_pageup = 2320
// sci_pageupextend = 2321
// sci_pagedown = 2322
// sci_pagedownextend = 2323
// sci_edittoggleovertype = 2324
// sci_cancel = 2325
// sci_deleteback = 2326
// sci_tab = 2327
// sci_backtab = 2328
// sci_newline = 2329
// sci_formfeed = 2330
// sci_vchome = 2331
// sci_vchomeextend = 2332
// sci_zoomin = 2333
// sci_zoomout = 2334
// sci_delwordleft = 2335
// sci_delwordright = 2336
// sci_delwordrightend = 2518
// sci_linecut = 2337
// sci_linedelete = 2338
// sci_linetranspose = 2339
// sci_linereverse = 2354
// sci_lineduplicate = 2404
// sci_lowercase = 2340
// sci_uppercase = 2341
// sci_linescrolldown = 2342
// sci_linescrollup = 2343
// sci_deletebacknotline = 2344
// sci_homedisplay = 2345
// sci_homedisplayextend = 2346
// sci_lineenddisplay = 2347
// sci_lineenddisplayextend = 2348
// sci_homewrap = 2349
// sci_homewrapextend = 2450
// sci_lineendwrap = 2451
// sci_lineendwrapextend = 2452
// sci_vchomewrap = 2453
// sci_vchomewrapextend = 2454
// sci_linecopy = 2455
// sci_movecaretinsideview = 2401
// sci_linelength = 2350
// sci_bracehighlight = 2351
// sci_bracehighlightindicator = 2498
// sci_bracebadlight = 2352
// sci_bracebadlightindicator = 2499
// sci_bracematch = 2353
// sci_getvieweol = 2355
// sci_setvieweol = 2356
// sci_getdocpointer = 2357
// sci_setdocpointer = 2358
// sci_setmodeventmask = 2359
// edge_none = 0
// edge_line = 1
// edge_background = 2
// edge_multiline = 3
// sci_getedgecolumn = 2360
// sci_setedgecolumn = 2361
// sci_getedgemode = 2362
// sci_setedgemode = 2363
// sci_getedgecolour = 2364
// sci_setedgecolour = 2365
// sci_multiedgeaddline = 2694
// sci_multiedgeclearall = 2695
// sci_searchanchor = 2366
// sci_searchnext = 2367
// sci_searchprev = 2368
// sci_linesonscreen = 2370
// sc_popup_never = 0
// sc_popup_all = 1
// sc_popup_text = 2
// sci_usepopup = 2371
// sci_selectionisrectangle = 2372
// sci_setzoom = 2373
// sci_getzoom = 2374
// sc_documentoption_default = 0
// sc_documentoption_styles_none = 0x1
// sc_documentoption_text_large = 0x100
// sci_createdocument = 2375
// sci_addrefdocument = 2376
// sci_releasedocument = 2377
// sci_getdocumentoptions = 2379
// sci_getmodeventmask = 2378
// sci_setcommandevents = 2717
// sci_getcommandevents = 2718
// sci_setfocus = 2380
// sci_getfocus = 2381
// sc_status_ok = 0
// sc_status_failure = 1
// sc_status_badalloc = 2
// sc_status_warn_start = 1000
// sc_status_warn_regex = 1001
// sci_setstatus = 2382
// sci_getstatus = 2383
// sci_setmousedowncaptures = 2384
// sci_getmousedowncaptures = 2385
// sci_setmousewheelcaptures = 2696
// sci_getmousewheelcaptures = 2697
// sc_cursornormal = -1
// sc_cursorarrow = 2
// sc_cursorwait = 4
// sc_cursorreversearrow = 7
// sci_setcursor = 2386
// sci_getcursor = 2387
// sci_setcontrolcharsymbol = 2388
// sci_getcontrolcharsymbol = 2389
// sci_wordpartleft = 2390
// sci_wordpartleftextend = 2391
// sci_wordpartright = 2392
// sci_wordpartrightextend = 2393
// visible_slop = 0x01
// visible_strict = 0x04
// sci_setvisiblepolicy = 2394
// sci_dellineleft = 2395
// sci_dellineright = 2396
// sci_setxoffset = 2397
// sci_getxoffset = 2398
// sci_choosecaretx = 2399
// sci_grabfocus = 2400
// caret_slop = 0x01
// caret_strict = 0x04
// caret_jumps = 0x10
// caret_even = 0x08
// sci_setxcaretpolicy = 2402
// sci_setycaretpolicy = 2403
// sci_setprintwrapmode = 2406
// sci_getprintwrapmode = 2407
// sci_sethotspotactivefore = 2410
// sci_gethotspotactivefore = 2494
// sci_sethotspotactiveback = 2411
// sci_gethotspotactiveback = 2495
// sci_sethotspotactiveunderline = 2412
// sci_gethotspotactiveunderline = 2496
// sci_sethotspotsingleline = 2421
// sci_gethotspotsingleline = 2497
// sci_paradown = 2413
// sci_paradownextend = 2414
// sci_paraup = 2415
// sci_paraupextend = 2416
// sci_positionbefore = 2417
// sci_positionafter = 2418
// sci_positionrelative = 2670
// sci_positionrelativecodeunits = 2716
// sci_copyrange = 2419
// sci_copytext = 2420
// sc_sel_stream = 0
// sc_sel_rectangle = 1
// sc_sel_lines = 2
// sc_sel_thin = 3
// sci_setselectionmode = 2422
// sci_getselectionmode = 2423
// sci_getmoveextendsselection = 2706
// sci_getlineselstartposition = 2424
// sci_getlineselendposition = 2425
// sci_linedownrectextend = 2426
// sci_lineuprectextend = 2427
// sci_charleftrectextend = 2428
// sci_charrightrectextend = 2429
// sci_homerectextend = 2430
// sci_vchomerectextend = 2431
// sci_lineendrectextend = 2432
// sci_pageuprectextend = 2433
// sci_pagedownrectextend = 2434
// sci_stutteredpageup = 2435
// sci_stutteredpageupextend = 2436
// sci_stutteredpagedown = 2437
// sci_stutteredpagedownextend = 2438
// sci_wordleftend = 2439
// sci_wordleftendextend = 2440
// sci_wordrightend = 2441
// sci_wordrightendextend = 2442
// sci_setwhitespacechars = 2443
// sci_getwhitespacechars = 2647
// sci_setpunctuationchars = 2648
// sci_getpunctuationchars = 2649
// sci_setcharsdefault = 2444
// sci_autocgetcurrent = 2445
// sci_autocgetcurrenttext = 2610
// sc_caseinsensitivebehaviour_respectcase = 0
// sc_caseinsensitivebehaviour_ignorecase = 1
// sci_autocsetcaseinsensitivebehaviour = 2634
// sci_autocgetcaseinsensitivebehaviour = 2635
// sc_multiautoc_once = 0
// sc_multiautoc_each = 1
// sci_autocsetmulti = 2636
// sci_autocgetmulti = 2637
// sc_order_presorted = 0
// sc_order_performsort = 1
// sc_order_custom = 2
// sci_autocsetorder = 2660
// sci_autocgetorder = 2661
// sci_allocate = 2446
// sci_targetasutf8 = 2447
// sci_setlengthforencode = 2448
// sci_encodedfromutf8 = 2449
// sci_findcolumn = 2456
// sci_getcaretsticky = 2457
// sci_setcaretsticky = 2458
// sc_caretsticky_off = 0
// sc_caretsticky_on = 1
// sc_caretsticky_whitespace = 2
// sci_togglecaretsticky = 2459
// sci_setpasteconvertendings = 2467
// sci_getpasteconvertendings = 2468
// sci_selectionduplicate = 2469
// sc_alpha_transparent = 0
// sc_alpha_opaque = 255
// sc_alpha_noalpha = 256
// sci_setcaretlinebackalpha = 2470
// sci_getcaretlinebackalpha = 2471
// caretstyle_invisible = 0
// caretstyle_line = 1
// caretstyle_block = 2
// caretstyle_overstrike_bar = 0
// caretstyle_overstrike_block = 0x10
// caretstyle_ins_mask = 0xf
// caretstyle_block_after = 0x100
// sci_setcaretstyle = 2512
// sci_getcaretstyle = 2513
// sci_setindicatorcurrent = 2500
// sci_getindicatorcurrent = 2501
// sci_setindicatorvalue = 2502
// sci_getindicatorvalue = 2503
// sci_indicatorfillrange = 2504
// sci_indicatorclearrange = 2505
// sci_indicatorallonfor = 2506
// sci_indicatorvalueat = 2507
// sci_indicatorstart = 2508
// sci_indicatorend = 2509
// sci_setpositioncache = 2514
// sci_getpositioncache = 2515
// sci_copyallowline = 2519
// sci_getcharacterpointer = 2520
// sci_getrangepointer = 2643
// sci_getgapposition = 2644
// sci_indicsetalpha = 2523
// sci_indicgetalpha = 2524
// sci_indicsetoutlinealpha = 2558
// sci_indicgetoutlinealpha = 2559
// sci_setextraascent = 2525
// sci_getextraascent = 2526
// sci_setextradescent = 2527
// sci_getextradescent = 2528
// sci_markersymboldefined = 2529
pub const sci_marginsettext = 2530

// sci_margingettext = 2531
// sci_marginsetstyle = 2532
// sci_margingetstyle = 2533
// sci_marginsetstyles = 2534
// sci_margingetstyles = 2535
// sci_margintextclearall = 2536
// sci_marginsetstyleoffset = 2537
// sci_margingetstyleoffset = 2538
// sc_marginoption_none = 0
// sc_marginoption_sublineselect = 1
// sci_setmarginoptions = 2539
// sci_getmarginoptions = 2557
pub const sci_annotationsettext = 2540
// sci_annotationgettext = 2541
pub const sci_annotationsetstyle = 2542
// sci_annotationgetstyle = 2543
pub const sci_annotationsetstyles = 2544
// sci_annotationgetstyles = 2545
// sci_annotationgetlines = 2546
pub const sci_annotationclearall = 2547
pub const annotation_hidden = 0
pub const annotation_standard = 1
pub const annotation_boxed = 2
pub const annotation_indented = 3
pub const sci_annotationsetvisible = 2548
// sci_annotationgetvisible = 2549
// sci_annotationsetstyleoffset = 2550
// sci_annotationgetstyleoffset = 2551
// sci_releaseallextendedstyles = 2552
// sci_allocateextendedstyles = 2553
// undo_none = 0
// undo_may_coalesce = 1
// sci_addundoaction = 2560
// sci_charpositionfrompoint = 2561
// sci_charpositionfrompointclose = 2562
// sci_setmouseselectionrectangularswitch = 2668
// sci_getmouseselectionrectangularswitch = 2669
// sci_setmultipleselection = 2563
// sci_getmultipleselection = 2564
// sci_setadditionalselectiontyping = 2565
// sci_getadditionalselectiontyping = 2566
// sci_setadditionalcaretsblink = 2567
// sci_getadditionalcaretsblink = 2568
// sci_setadditionalcaretsvisible = 2608
// sci_getadditionalcaretsvisible = 2609
// sci_getselections = 2570
// sci_getselectionempty = 2650
// sci_clearselections = 2571
// sci_setselection = 2572
// sci_addselection = 2573
// sci_dropselectionn = 2671
// sci_setmainselection = 2574
// sci_getmainselection = 2575
// sci_setselectionncaret = 2576
// sci_getselectionncaret = 2577
// sci_setselectionnanchor = 2578
// sci_getselectionnanchor = 2579
// sci_setselectionncaretvirtualspace = 2580
// sci_getselectionncaretvirtualspace = 2581
// sci_setselectionnanchorvirtualspace = 2582
// sci_getselectionnanchorvirtualspace = 2583
// sci_setselectionnstart = 2584
// sci_getselectionnstart = 2585
// sci_setselectionnend = 2586
// sci_getselectionnend = 2587
// sci_setrectangularselectioncaret = 2588
// sci_getrectangularselectioncaret = 2589
// sci_setrectangularselectionanchor = 2590
// sci_getrectangularselectionanchor = 2591
// sci_setrectangularselectioncaretvirtualspace = 2592
// sci_getrectangularselectioncaretvirtualspace = 2593
// sci_setrectangularselectionanchorvirtualspace = 2594
// sci_getrectangularselectionanchorvirtualspace = 2595
// scvs_none = 0
// scvs_rectangularselection = 1
// scvs_useraccessible = 2
// scvs_nowraplinestart = 4
// sci_setvirtualspaceoptions = 2596
// sci_getvirtualspaceoptions = 2597
// sci_setrectangularselectionmodifier = 2598
// sci_getrectangularselectionmodifier = 2599
// sci_setadditionalselfore = 2600
// sci_setadditionalselback = 2601
// sci_setadditionalselalpha = 2602
// sci_getadditionalselalpha = 2603
// sci_setadditionalcaretfore = 2604
// sci_getadditionalcaretfore = 2605
// sci_rotateselection = 2606
// sci_swapmainanchorcaret = 2607
// sci_multipleselectaddnext = 2688
// sci_multipleselectaddeach = 2689
// sci_changelexerstate = 2617
// sci_contractedfoldnext = 2618
// sci_verticalcentrecaret = 2619
// sci_moveselectedlinesup = 2620
// sci_moveselectedlinesdown = 2621
// sci_setidentifier = 2622
// sci_getidentifier = 2623
// sci_rgbaimagesetwidth = 2624
// sci_rgbaimagesetheight = 2625
// sci_rgbaimagesetscale = 2651
// sci_markerdefinergbaimage = 2626
// sci_registerrgbaimage = 2627
// sci_scrolltostart = 2628
// sci_scrolltoend = 2629
// sc_technology_default = 0
// sc_technology_directwrite = 1
// sc_technology_directwriteretain = 2
// sc_technology_directwritedc = 3
// sci_settechnology = 2630
// sci_gettechnology = 2631
// sci_createloader = 2632
// sci_findindicatorshow = 2640
// sci_findindicatorflash = 2641
// sci_findindicatorhide = 2642
// sci_vchomedisplay = 2652
// sci_vchomedisplayextend = 2653
// sci_getcaretlinevisiblealways = 2654
// sci_setcaretlinevisiblealways = 2655
// sc_line_end_type_default = 0
// sc_line_end_type_unicode = 1
// sci_setlineendtypesallowed = 2656
// sci_getlineendtypesallowed = 2657
// sci_getlineendtypesactive = 2658
// sci_setrepresentation = 2665
// sci_getrepresentation = 2666
// sci_clearrepresentation = 2667
// sci_startrecord = 3001
// sci_stoprecord = 3002
// sci_setlexer = 4001
// sci_getlexer = 4002
// sci_colourise = 4003
// sci_setproperty = 4004
// // keywordset_max 8
// keywordset_max = 30
// sci_setkeywords = 4005
// sci_setlexerlanguage = 4006
// sci_loadlexerlibrary = 4007
// sci_getproperty = 4008
// sci_getpropertyexpanded = 4009
// sci_getpropertyint = 4010
pub const sci_getlexerlanguage = 4012

// sci_privatelexercall = 4013
// sci_propertynames = 4014
// sc_type_boolean = 0
// sc_type_integer = 1
// sc_type_string = 2
// sci_propertytype = 4015
// sci_describeproperty = 4016
// sci_describekeywordsets = 4017
// sci_getlineendtypessupported = 4018
// sci_allocatesubstyles = 4020
// sci_getsubstylesstart = 4021
// sci_getsubstyleslength = 4022
// sci_getstylefromsubstyle = 4027
// sci_getprimarystylefromstyle = 4028
// sci_freesubstyles = 4023
// sci_setidentifiers = 4024
// sci_distancetosecondarystyles = 4025
// sci_getsubstylebases = 4026
// sci_getnamedstyles = 4029
// sci_nameofstyle = 4030
// sci_tagsofstyle = 4031
// sci_descriptionofstyle = 4032
// sc_mod_none = 0x0
// sc_mod_inserttext = 0x1
// sc_mod_deletetext = 0x2
// sc_mod_changestyle = 0x4
// sc_mod_changefold = 0x8
// sc_performed_user = 0x10
// sc_performed_undo = 0x20
// sc_performed_redo = 0x40
// sc_multistepundoredo = 0x80
// sc_laststepinundoredo = 0x100
// sc_mod_changemarker = 0x200
// sc_mod_beforeinsert = 0x400
// sc_mod_beforedelete = 0x800
// sc_multilineundoredo = 0x1000
// sc_startaction = 0x2000
// sc_mod_changeindicator = 0x4000
// sc_mod_changelinestate = 0x8000
// sc_mod_changemargin = 0x10000
// sc_mod_changeannotation = 0x20000
// sc_mod_container = 0x40000
// sc_mod_lexerstate = 0x80000
pub const sc_mod_insertcheck = 0x100000

// sc_mod_changetabstops = 0x200000
// sc_modeventmaskall = 0x3fffff
// sc_searchresult_linebuffermaxlength = 1024
// sc_update_content = 0x1
// sc_update_selection = 0x2
// sc_update_v_scroll = 0x4
// sc_update_h_scroll = 0x8
// scen_change = 768
// scen_setfocus = 512
// scen_killfocus = 256
// sck_down = 300
// sck_up = 301
// sck_left = 302
// sck_right = 303
// sck_home = 304
// sck_end = 305
// sck_prior = 306
// sck_next = 307
// sck_delete = 308
// sck_insert = 309
// sck_escape = 7
// sck_back = 8
// sck_tab = 9
// sck_return = 13
// sck_add = 310
// sck_subtract = 311
// sck_divide = 312
// sck_win = 313
// sck_rwin = 314
// sck_menu = 315
// scmod_norm = 0
// scmod_shift = 1
// scmod_ctrl = 2
// scmod_alt = 4
// scmod_super = 8
// scmod_meta = 16
// sc_ac_fillup = 1
// sc_ac_doubleclick = 2
// sc_ac_tab = 3
// sc_ac_newline = 4
// sc_ac_command = 5
// sc_charactersource_direct_input = 0
// sc_charactersource_tentative_input = 1
// sc_charactersource_ime_result = 2
// scn_styleneeded = 2000
// scn_charadded = 2001
// scn_savepointreached = 2002
// scn_savepointleft = 2003
// scn_modifyattemptro = 2004
// scn_key = 2005
// scn_doubleclick = 2006
// scn_updateui = 2007
pub const scn_modified = 2008 // scn_macrorecord = 2009
// scn_marginclick = 2010
// scn_needshown = 2011
// scn_painted = 2013
// scn_userlistselection = 2014
// scn_uridropped = 2015
// scn_dwellstart = 2016
// scn_dwellend = 2017
// scn_zoom = 2018
// scn_hotspotclick = 2019
// scn_hotspotdoubleclick = 2020
// scn_calltipclick = 2021
// scn_autocselection = 2022
// scn_indicatorclick = 2023
// scn_indicatorrelease = 2024
// scn_autoccancelled = 2025
// scn_autocchardeleted = 2026
// scn_hotspotreleaseclick = 2027
// scn_focusin = 2028
// scn_focusout = 2029
// scn_autoccompleted = 2030
// scn_marginrightclick = 2031
// scn_autocselectionchange = 2032
// // provisional
// sc_bidirectional_disabled = 0
// sc_bidirectional_l2r = 1
// sc_bidirectional_r2l = 2
// sci_getbidirectional = 2708
// sci_setbidirectional = 2709
// sc_linecharacterindex_none = 0
// sc_linecharacterindex_utf32 = 1
// sc_linecharacterindex_utf16 = 2
// sci_getlinecharacterindex = 2710
// sci_allocatelinecharacterindex = 2711
// sci_releaselinecharacterindex = 2712
// sci_linefromindexposition = 2713
// sci_indexpositionfromline = 2714
// scn_scrolled = 2080
// scn_foldingstatechanged = 2081
