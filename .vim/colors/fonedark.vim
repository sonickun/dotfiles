" Vim Color File
" Name:       fonedark.vim
" License:    The MIT License (MIT)
" Based On:   https://github.com/joshdick/onedark.vim/

" +----------------+
" | Initialization |
" +----------------+

set background=dark

highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name="fonedark"

" Set to "256" for 256-color terminals, or
" set to "16" to use your terminal emulator's native colors
" (a 16-color palette for this theme is not available yet.)
if !exists("g:onedark_termcolors")
  let g:onedark_termcolors = 256
endif

" Not all terminals support italics properly. If yours does, opt-in.
if !exists("g:onedark_terminal_italics")
  let g:onedark_terminal_italics = 0
endif

" This function was borrowed from FlatColor: https://github.com/MaxSt/FlatColor/
" It was based on one found in hemisu: https://github.com/noahfrederick/vim-hemisu/
function! s:h(group, style)
  if g:onedark_terminal_italics == 0 && has_key(a:style, "cterm") && a:style["cterm"] == "italic"
    unlet a:style.cterm
  endif
  if g:onedark_termcolors == 16
    let l:ctermfg = (has_key(a:style, "fg") ? a:style.fg.cterm16 : "NONE")
    let l:ctermbg = (has_key(a:style, "bg") ? a:style.bg.cterm16 : "NONE")
  else
    let l:ctermfg = (has_key(a:style, "fg") ? a:style.fg.cterm : "NONE")
    let l:ctermbg = (has_key(a:style, "bg") ? a:style.bg.cterm : "NONE")
  end
  execute "highlight" a:group
    \ "guifg="   (has_key(a:style, "fg")    ? a:style.fg.gui   : "NONE")
    \ "guibg="   (has_key(a:style, "bg")    ? a:style.bg.gui   : "NONE")
    \ "guisp="   (has_key(a:style, "sp")    ? a:style.sp.gui   : "NONE")
    \ "gui="     (has_key(a:style, "gui")   ? a:style.gui      : "NONE")
    \ "ctermfg=" . l:ctermfg
    \ "ctermbg=" . l:ctermbg
    \ "cterm="   (has_key(a:style, "cterm") ? a:style.cterm    : "NONE")
endfunction

" +-----------------+
" | Color Variables |
" +-----------------+

let s:red300 = { "gui": "#E57373", "cterm": "204", "cterm16": "1" } " Alternate cterm: 168
let s:red400 = { "gui": "#EF5150", "cterm": "204", "cterm16": "1" } " Alternate cterm: 168
let s:red500 = { "gui": "#F44336", "cterm": "204", "cterm16": "1" } " Alternate cterm: 168
let s:red600 = { "gui": "#E53935", "cterm": "204", "cterm16": "1" } " Alternate cterm: 168
let s:redA400 = { "gui": "#FF1744", "cterm": "204", "cterm16": "1" } " Alternate cterm: 168
let s:redF400 = { "gui": "#D56080", "cterm": "204", "cterm16": "1" } " Alternate cterm: 168

let s:cyan300 = { "gui": "#4DD0E1", "cterm": "38", "cterm16": "6" } " Alternate cterm: 73
let s:cyan400 = { "gui": "#26C6DA", "cterm": "38", "cterm16": "6" } " Alternate cterm: 73

let s:yellow400 = { "gui": "#FFEE58", "cterm": "180", "cterm16": "3" }
let s:yellow500 = { "gui": "#FFEB3B", "cterm": "180", "cterm16": "3" }
let s:yellow600 = { "gui": "#FDD835", "cterm": "180", "cterm16": "3" }

let s:yellowF400 = { "gui": "#E5C07B", "cterm": "180", "cterm16": "3" }
" let s:yellowF400 = { "gui": "#CCBB58", "cterm": "180", "cterm16": "3" }

let s:orange400 = { "gui": "#FFA726", "cterm": "173", "cterm16": "11" }
let s:orange500 = { "gui": "#FF9800", "cterm": "173", "cterm16": "11" }
let s:orangeF400 = { "gui": "#DF7756", "cterm": "173", "cterm16": "11" }

let s:teal400 = { "gui": "#26A69A", "cterm": "114", "cterm16": "2" }

let s:blue400 = { "gui": "#42A5F5", "cterm": "39", "cterm16": "4" } " Alternate cterm: 75

let s:amber400 = { "gui": "#FFB300", "cterm": "180", "cterm16": "3" }

let s:greenF400 = { "gui": "#98C379", "cterm": "114", "cterm16": "2" }
let s:purpleF400 = { "gui": "#8888FF", "cterm": "177", "cterm16" : "7" }

let s:white = { "gui": "#ADB4C1", "cterm": "248", "cterm16" : "7" }

let s:black = { "gui": "#282C34", "cterm": "232", "cterm16": "0" }
let s:visual_black = { "gui": "NONE", "cterm": "NONE", "cterm16": s:black.cterm16 } " Black out selected text in 16-color visual mode

let s:comment_grey = { "gui": "#5C6670", "cterm": "59", "cterm16": "15" }
let s:gutter_fg_grey = { "gui": "#636D83", "cterm": "238", "cterm16": "15" }
let s:gutter_bg_grey = { "gui": "#2C313A", "cterm": "NONE", "cterm16": "NONE" }
let s:cursor_grey =  { "gui": "#2C323B", "cterm": "236", "cterm16": "8" }
let s:visual_grey = { "gui": "#3E4451", "cterm": "237", "cterm16": "15" }
let s:special_grey = { "gui": "#484C55", "cterm": "238", "cterm16": "15" }
let s:vertsplit = { "gui": "#181A1F", "cterm": "59", "cterm16": "15" }

" +---------------------------------------------------------+
" | Syntax Groups (descriptions and ordering from `:h w18`) |
" +---------------------------------------------------------+

call s:h("Comment", { "fg": s:comment_grey, "gui": "italic", "cterm": "italic" }) " any comment
call s:h("Constant", { "fg": s:cyan300 }) " any constant
call s:h("String", { "fg": s:greenF400 }) " a string constant: "this is a string"
call s:h("Character", { "fg": s:greenF400 }) " a character constant: 'c', '\n'
call s:h("Number", { "fg": s:cyan300 }) " a number constant: 234, 0xff
call s:h("Boolean", { "fg": s:cyan300 }) " a boolean constant: TRUE, false
call s:h("Float", { "fg": s:cyan300 }) " a floating point constant: 2.3e10
call s:h("Identifier", { "fg": s:redF400 }) " any variable name
call s:h("Function", { "fg": s:cyan300 }) " function name (also: methods for classes)
call s:h("Method", { "fg": s:yellowF400 }) " function name (also: methods for classes)
call s:h("Statement", { "fg": s:cyan300 }) " any statement
call s:h("Conditional", { "fg": s:yellowF400 }) " if, then, else, endif, switch, etc.
call s:h("Repeat", { "fg": s:yellowF400 }) " for, do, while, etc.
call s:h("Label", { "fg": s:cyan300 }) " case, default, etc.
call s:h("Operator", { "fg": s:redF400}) " sizeof", "+", "*", etc.
call s:h("Keyword", { "fg": s:redF400 }) " any other keyword
call s:h("Exception", { "fg": s:yellowF400 }) " try, catch, throw
call s:h("PreProc", { "fg": s:yellowF400 }) " generic Preprocessor
call s:h("Include", { "fg": s:yellowF400 }) " preprocessor #include
call s:h("Define", { "fg": s:redF400 }) " preprocessor #define
call s:h("Macro", { "fg": s:cyan300 }) " same as Define
call s:h("PreCondit", { "fg": s:yellowF400 }) " preprocessor #if, #else, #endif, etc.
call s:h("Type", { "fg": s:cyan300 }) " int, long, char, etc.
call s:h("StorageClass", { "fg": s:cyan300 }) " static, register, volatile, etc.
call s:h("Structure", { "fg": s:cyan300 }) " struct, union, enum, etc.
call s:h("Typedef", { "fg": s:cyan300 }) " A typedef
call s:h("Special", { "fg": s:orange400 }) " any special symbol
call s:h("Special2", { "fg": s:purpleF400 }) " any special symbol
call s:h("SpecialChar", {}) " special character in a constant
call s:h("Tag", {}) " you can use CTRL-] on this
call s:h("Delimiter", {}) " character that needs attention
call s:h("SpecialComment", {}) " special things inside a comment
call s:h("Debug", {}) " debugging statements
call s:h("Underlined", {}) " text that stands out, HTML links
call s:h("Ignore", {}) " left blank, hidden
call s:h("Error", { "fg": s:redF400, "bg": s:gutter_bg_grey }) " any erroneous construct
call s:h("Todo", { "fg": s:cyan300 }) " anything that needs extra attention; mostly the keywords TODO FIXME and XXX

" +----------------------------------------------------------------------+
" | Highlighting Groups (descriptions and ordering from `:h hitest.vim`) |
" +----------------------------------------------------------------------+

call s:h("ColorColumn", { "bg": s:cursor_grey }) " used for the columns set with 'colorcolumn'
call s:h("Conceal", {}) " placeholder characters substituted for concealed text (see 'conceallevel')
call s:h("Cursor", { "fg": s:black, "bg": s:blue400 }) " the character under the cursor
call s:h("CursorIM", {}) " like Cursor, but used when in IME mode
call s:h("CursorColumn", { "bg": s:cursor_grey }) " the screen column that the cursor is in when 'cursorcolumn' is set
call s:h("CursorLine", { "bg": s:cursor_grey }) " the screen line that the cursor is in when 'cursorline' is set
call s:h("Directory", {}) " directory names (and other special names in listings)
call s:h("DiffAdd", { "fg": s:greenF400 }) " diff mode: Added line
call s:h("DiffChange", { "fg": s:orangeF400 }) " diff mode: Changed line
call s:h("DiffDelete", { "fg": s:redF400 }) " diff mode: Deleted line
call s:h("DiffText", { "fg": s:blue400 }) " diff mode: Changed text within a changed line
call s:h("ErrorMsg", {}) " error messages on the command line
call s:h("VertSplit", { "fg": s:vertsplit }) " the column separating vertically split windows
call s:h("Folded", {}) " line used for closed folds
call s:h("FoldColumn", {}) " 'foldcolumn'
call s:h("SignColumn", {}) " column where signs are displayed
call s:h("IncSearch", { "fg": s:visual_black, "bg": s:visual_grey }) " 'incsearch' highlighting; also used for the text replaced with ":s///c"
call s:h("LineNr", { "fg": s:gutter_fg_grey }) " Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
call s:h("CursorLineNr", {}) " Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
call s:h("MatchParen", { "fg": s:blue400, "gui": "underline" }) " The character under the cursor or just before it, if it is a paired bracket, and its match.
call s:h("ModeMsg", {}) " 'showmode' message (e.g., "-- INSERT --")
call s:h("MoreMsg", {}) " more-prompt
call s:h("NonText", { "fg": s:special_grey }) " '~' and '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line).
call s:h("Normal", { "fg": s:white, "bg": s:black }) " normal text
call s:h("Pmenu", {}) " Popup menu: normal item.
call s:h("PmenuSel", { "bg": s:visual_grey }) " Popup menu: selected item.
call s:h("PmenuSbar", { "bg": s:visual_grey }) " Popup menu: scrollbar.
call s:h("PmenuThumb", { "bg": s:white }) " Popup menu: Thumb of the scrollbar.
call s:h("Question", { "fg": s:cyan300 }) " hit-enter prompt and yes/no questions
call s:h("Search", { "bg": s:visual_grey }) " Last search pattern highlighting (see 'hlsearch'). Also used for highlighting the current line in the quickfix window and similar items that need to stand out.
call s:h("SpecialKey", { "fg": s:special_grey }) " Meta and special keys listed with ":map", also for text used to show unprintable characters in the text, 'listchars'. Generally: text that is displayed differently from what it really is.
call s:h("SpellBad", { "fg": s:redF400 }) " Word that is not recognized by the spellchecker. This will be combined with the highlighting used otherwise.
call s:h("SpellCap", { "fg": s:orangeF400 }) " Word that should start with a capital. This will be combined with the highlighting used otherwise.
call s:h("SpellLocal", { "fg": s:orangeF400 }) " Word that is recognized by the spellchecker as one that is used in another region. This will be combined with the highlighting used otherwise.
call s:h("SpellRare", { "fg": s:orangeF400 }) " Word that is recognized by the spellchecker as one that is hardly ever used. spell This will be combined with the highlighting used otherwise.
call s:h("StatusLine", { "fg": s:white, "bg": s:cursor_grey }) " status line of current window
call s:h("StatusLineNC", { "fg": s:comment_grey }) " status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
call s:h("TabLine", {}) " tab pages line, not active tab page label
call s:h("TabLineFill", {}) " tab pages line, where there are no labels
call s:h("TabLineSel", {}) " tab pages line, active tab page label
call s:h("Title", { "fg": s:greenF400 }) " titles for output from ":set all", ":autocmd" etc.
call s:h("Visual", { "fg": s:visual_black, "bg": s:visual_grey }) " Visual mode selection
call s:h("VisualNOS", { "bg": s:visual_grey }) " Visual mode selection when vim is "Not Owning the Selection". Only X11 Gui's gui-x11 and xterm-clipboard supports this.
call s:h("WarningMsg", { "fg": s:redF400 }) " warning messages
call s:h("WildMenu", {}) " current match in 'wildmenu' completion

" +--------------------------------+
" | Language-Specific Highlighting |
" +--------------------------------+

call s:h("javaScriptBraces", { "fg": s:white })
call s:h("javaScriptIdentifier", { "fg": s:cyan300 })
call s:h("javaScriptNull", { "fg": s:orangeF400 })
call s:h("javaScriptNumber", { "fg": s:orangeF400 })
call s:h("rubyBlockParameterList", { "fg": s:redF400 })
call s:h("rubyInterpolation", { "fg": s:greenF400 })
call s:h("rubyInterpolationDelimiter", { "fg": s:redF400 })

" +---------------------+
" | Plugin Highlighting |
" +---------------------+

" Signify, git-gutter
hi link SignifySignAdd              LineNr
hi link SignifySignDelete           LineNr
hi link SignifySignChange           LineNr
call s:h("GitGutterAdd", { "fg": s:greenF400, "bg": s:gutter_bg_grey })
call s:h("GitGutterDelete", { "fg": s:redF400, "bg": s:gutter_bg_grey })
call s:h("GitGutterChange", { "fg": s:yellowF400, "bg": s:gutter_bg_grey })
call s:h("GitGutterChangeDelete", { "fg": s:redF400, "bg": s:gutter_bg_grey })

call s:h("pythonStatement", { "fg": s:redF400 })
call s:h("pythonStatement", { "fg": s:redF400 })
hi link  pythonSpecial Special2
