" File:       one_monokai.vim
" Maintainer: Ferdinand Ratajczak (fratajczak)
" URL:        https://github.com/fratajczak/one-one_monokai-vim
" License:    MIT
"

" Initialisation
" --------------

if !has("gui_running") && &t_Co < 256
  finish
endif

if ! exists("g:one_monokai_gui_italic")
    let g:one_monokai_gui_italic = 1
endif

if ! exists("g:one_monokai_term_italic")
    let g:one_monokai_term_italic = 0
endif

let g:one_monokai_termcolors = 256 " does not support 16 color term right now.

set background=dark
hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "one_monokai"

function! s:h(group, style)
  let s:ctermformat = "NONE"
  let s:guiformat = "NONE"
  if has_key(a:style, "format")
    let s:ctermformat = a:style.format
    let s:guiformat = a:style.format
  endif
  if g:one_monokai_term_italic == 0
    let s:ctermformat = substitute(s:ctermformat, ",italic", "", "")
    let s:ctermformat = substitute(s:ctermformat, "italic,", "", "")
    let s:ctermformat = substitute(s:ctermformat, "italic", "", "")
  endif
  if g:one_monokai_gui_italic == 0
    let s:guiformat = substitute(s:guiformat, ",italic", "", "")
    let s:guiformat = substitute(s:guiformat, "italic,", "", "")
    let s:guiformat = substitute(s:guiformat, "italic", "", "")
  endif
  if g:one_monokai_termcolors == 16
    let l:ctermfg = (has_key(a:style, "fg") ? a:style.fg.cterm16 : "NONE")
    let l:ctermbg = (has_key(a:style, "bg") ? a:style.bg.cterm16 : "NONE")
  else
    let l:ctermfg = (has_key(a:style, "fg") ? a:style.fg.cterm : "NONE")
    let l:ctermbg = (has_key(a:style, "bg") ? a:style.bg.cterm : "NONE")
  end
  execute "highlight" a:group
    \ "guifg="   (has_key(a:style, "fg")      ? a:style.fg.gui   : "NONE")
    \ "guibg="   (has_key(a:style, "bg")      ? a:style.bg.gui   : "NONE")
    \ "guisp="   (has_key(a:style, "sp")      ? a:style.sp.gui   : "NONE")
    \ "gui="     (!empty(s:guiformat) ? s:guiformat   : "NONE")
    \ "ctermfg=" . l:ctermfg
    \ "ctermbg=" . l:ctermbg
    \ "cterm="   (!empty(s:ctermformat) ? s:ctermformat   : "NONE")
endfunction

" Palettes
" --------


let s:s_white       = { "gui": "#ABB2BF", "cterm": "145" }
let s:s_black       = { "gui": "#282C34", "cterm": "23" }
let s:lightblack  = { "gui": "#2D2E27", "cterm": "235" }
let s:lightblack2 = { "gui": "#383a3e", "cterm": "236" }
let s:darkblack   = { "gui": "#26292F", "cterm": "16" }
let s:darkerblack = { "gui": "#1E2024", "cterm": "16" }
let s:s_grey        = { "gui": "#4B5261", "cterm": "59" }
let s:s_lightgrey   = { "gui": "#9CA3B2", "cterm": "145" }
let s:s_darkgrey    = { "gui": "#64645e", "cterm": "239" }
let s:warmgrey    = { "gui": "#676E7B", "cterm": "60" }

let s:s_pink        = { "gui": "#E06C75", "cterm": "168" }
let s:s_green       = { "gui": "#98C379", "cterm": "114" }
let s:s_aqua        = { "gui": "#54bbc9", "cterm": "73" }
let s:s_blue        = { "gui": "#5da7e3", "cterm": "75" }
let s:s_yellow      = { "gui": "#E5C07B", "cterm": "180" }
let s:s_orange      = { "gui": "#D19A66", "cterm": "173" }
let s:s_purple      = { "gui": "#C678DD", "cterm": "176" }
let s:s_red         = { "gui": "#BE5046", "cterm": "131" }
let s:s_darkred     = { "gui": "#5f0000", "cterm": "52" }

let s:addfg       = { "gui": "#d7ffaf", "cterm": "193" }
let s:addbg       = { "gui": "#5f875f", "cterm": "65" }
let s:delbg       = { "gui": "#f75f5f", "cterm": "167" }
let s:changefg    = { "gui": "#d7d7ff", "cterm": "189" }
let s:changebg    = { "gui": "#5f5f87", "cterm": "60" }

" Highlighting 
" ------------

" editor
call s:h("Normal",        { "fg": s:s_white,      "bg": s:s_black })
call s:h("ColorColumn",   {                     "bg": s:darkblack})
call s:h("Cursor",        { "fg": s:s_black,      "bg": s:s_white })
call s:h("CursorColumn",  {                     "bg": s:lightblack2 })
call s:h("CursorLine",    {                     "bg": s:lightblack2})
call s:h("NonText",       { "fg": s:s_grey })
call s:h("StatusLine",    { "fg": s:s_lightgrey,   "bg": s:darkerblack})
call s:h("StatusLineNC",  { "fg": s:s_lightgrey,   "bg": s:darkblack})
call s:h("TabLine",       { "fg": s:s_white,      "bg": s:darkblack,    "format": "reverse" })
call s:h("Visual",        {                     "bg": s:s_grey})
call s:h("Search",        { "fg": s:s_black,      "bg": s:s_yellow })
call s:h("MatchParen",    { "fg": s:s_white,                           "format": "underline,bold" })
call s:h("Question",      { "fg": s:s_yellow })
call s:h("ModeMsg",       { "fg": s:s_yellow })
call s:h("MoreMsg",       { "fg": s:s_yellow })
call s:h("ErrorMsg",      { "fg": s:s_black,      "bg": s:s_red,          "format": "standout" })
call s:h("WarningMsg",    { "fg": s:s_red })
call s:h("VertSplit",     { "fg": s:darkerblack,   "bg": s:s_black})
call s:h("LineNr",        { "fg": s:s_grey,       "bg": s:s_black})
call s:h("CursorLineNr",  { "fg": s:s_white,     "bg": s:s_black})
call s:h("SignColumn",    {                     "bg": s:s_black})

" misc
call s:h("SpecialKey",    { "fg": s:s_white })
call s:h("Title",         { "fg": s:s_yellow })
call s:h("Directory",     { "fg": s:s_white })

" diff
call s:h("DiffAdd",       { "fg": s:addfg,      "bg": s:addbg })
call s:h("DiffDelete",    { "fg": s:s_black,      "bg": s:delbg })
call s:h("DiffChange",    { "fg": s:changefg,   "bg": s:changebg })
call s:h("DiffText",      { "fg": s:s_black,      "bg": s:s_aqua })

" fold
call s:h("Folded",        { "fg": s:warmgrey,   "bg": s:darkblack })
call s:h("FoldColumn",    {                     "bg": s:darkblack })
"        Incsearch"

" popup menu
call s:h("Pmenu",         { "fg": s:s_white, "bg": s:darkblack})
call s:h("PmenuSel",      { "fg": s:s_white, "bg": s:s_black,        "format": "bold" })
call s:h("PmenuThumb",    { "fg": s:lightblack, "bg": s:s_grey })
"        PmenuSbar"

" Generic Syntax Highlighting
" ---------------------------

call s:h("Constant",      { "fg": s:s_purple })
call s:h("Number",        { "fg": s:s_purple })
call s:h("Float",         { "fg": s:s_purple })
call s:h("Boolean",       { "fg": s:s_aqua })
call s:h("Character",     { "fg": s:s_yellow })
call s:h("String",        { "fg": s:s_yellow })

call s:h("Type",          { "fg": s:s_blue })
call s:h("Structure",     { "fg": s:s_blue })
call s:h("StorageClass",  { "fg": s:s_blue })
call s:h("Typedef",       { "fg": s:s_blue })
    
call s:h("Identifier",    { "fg": s:s_green })
call s:h("Function",      { "fg": s:s_green })
                         
call s:h("Statement",     { "fg": s:s_pink }) " if, else, while, default
call s:h("Operator",      { "fg": s:s_pink }) " +, -, *
call s:h("Label",         { "fg": s:s_pink }) " div, p, h1
call s:h("Keyword",       { "fg": s:s_aqua }) " const, let, var, return
"        Conditional"
"        Repeat"
"        Exception"

call s:h("PreProc",       { "fg": s:s_green })
call s:h("Include",       { "fg": s:s_pink })
call s:h("Define",        { "fg": s:s_pink })
call s:h("Macro",         { "fg": s:s_green })
call s:h("PreCondit",     { "fg": s:s_green })
                           
call s:h("Special",       { "fg": s:s_blue })
call s:h("SpecialChar",   { "fg": s:s_white })
call s:h("Delimiter",     { "fg": s:s_white })
call s:h("SpecialComment",{ "fg": s:s_white })
call s:h("Tag",           { "fg": s:s_white })
"        Debug"

call s:h("Todo",          { "fg": s:s_orange,   "format": "bold,italic" })
call s:h("Comment",       { "fg": s:warmgrey, "format": "italic" })
                         
call s:h("Underlined",    { "fg": s:s_green })
call s:h("Ignore",        {})
call s:h("Error",         { "fg": s:s_red, "bg": s:s_darkred })

" NerdTree
" --------

call s:h("NERDTreeOpenable",        { "fg": s:s_yellow })
call s:h("NERDTreeClosable",        { "fg": s:s_yellow })
call s:h("NERDTreeHelp",            { "fg": s:s_yellow })
call s:h("NERDTreeBookmarksHeader", { "fg": s:s_pink })
call s:h("NERDTreeBookmarksLeader", { "fg": s:s_black })
call s:h("NERDTreeBookmarkName",    { "fg": s:s_yellow })
call s:h("NERDTreeCWD",             { "fg": s:s_pink })
call s:h("NERDTreeUp",              { "fg": s:s_white })
call s:h("NERDTreeDirSlash",        { "fg": s:s_white})
call s:h("NERDTreeDir",             { "fg": s:s_white})

" Syntastic
" ---------

hi! link SyntasticErrorSign Error
call s:h("SyntasticWarningSign",    { "fg": s:lightblack, "bg": s:s_orange })

" Language highlight
" ------------------

" Java properties
call s:h("jpropertiesIdentifier",   { "fg": s:s_pink })

" Vim command
call s:h("vimCommand",              { "fg": s:s_pink })

" Javascript
call s:h("jsFuncName",          { "fg": s:s_green })
call s:h("jsThis",              { "fg": s:s_pink })
call s:h("jsFunctionKey",       { "fg": s:s_green })
call s:h("jsPrototype",         { "fg": s:s_blue })
call s:h("jsExceptions",        { "fg": s:s_blue })
call s:h("jsFutureKeys",        { "fg": s:s_blue })
call s:h("jsBuiltins",          { "fg": s:s_blue })
call s:h("jsArgsObj",           { "fg": s:s_blue })
call s:h("jsStatic",            { "fg": s:s_blue })
call s:h("jsSuper",             { "fg": s:s_blue })
call s:h("jsFuncArgRest",       { "fg": s:s_purple, "format": "italic" })                                 
call s:h("jsFuncArgs",          { "fg": s:s_orange, "format": "italic" })
call s:h("jsStorageClass",      { "fg": s:s_blue })
call s:h("jsDocTags",           { "fg": s:s_blue,   "format": "italic" })

" Typescript
call s:h("typescriptArrowFuncArg",        { "fg": s:s_orange, "format": "italic" })
call s:h("typescriptFuncType",            { "fg": s:s_orange, "format": "italic" })
call s:h("typescriptCall",                { "fg": s:s_orange, "format": "italic" })
call s:h("typescriptVariable",            { "fg": s:s_aqua })
call s:h("typescriptModule",              { "fg": s:s_aqua })
call s:h("typescriptPredefinedType",      { "fg": s:s_aqua })
call s:h("typescriptFuncTypeArrow",       { "fg": s:s_aqua })
call s:h("typescriptImport",              { "fg": s:s_pink })
call s:h("typescriptExport",              { "fg": s:s_pink })
call s:h("typescriptCastKeyword",         { "fg": s:s_pink })
call s:h("typescriptOperator",            { "fg": s:s_pink })
call s:h("typescriptEndColons",           { "fg": s:s_white })
call s:h("typescriptObjectLabel",         { "fg": s:s_green })
call s:h("typescriptAmbientDeclaration",  { "fg": s:s_pink })
                                 
" Html
call s:h("htmlTag",             { "fg": s:s_white })
call s:h("htmlEndTag",          { "fg": s:s_white })
call s:h("htmlTagName",         { "fg": s:s_pink })
call s:h("htmlArg",             { "fg": s:s_green })
call s:h("htmlSpecialChar",     { "fg": s:s_white })

" Xml
call s:h("xmlTag",              { "fg": s:s_pink })
call s:h("xmlEndTag",           { "fg": s:s_pink })
call s:h("xmlTagName",          { "fg": s:s_orange })
call s:h("xmlAttrib",           { "fg": s:s_green })

" CSS
call s:h("cssProp",             { "fg": s:s_yellow })
call s:h("cssUIAttr",           { "fg": s:s_yellow })
call s:h("cssFunctionName",     { "fg": s:s_aqua })
call s:h("cssColor",            { "fg": s:s_purple })
call s:h("cssPseudoClassId",    { "fg": s:s_purple })
call s:h("cssClassName",        { "fg": s:s_green })
call s:h("cssValueLength",      { "fg": s:s_purple })
call s:h("cssCommonAttr",       { "fg": s:s_pink })
call s:h("cssBraces" ,          { "fg": s:s_white })
call s:h("cssClassNameDot",     { "fg": s:s_pink })
call s:h("cssURL",              { "fg": s:s_orange, "format": "underline,italic" })

"Operator Highlighting (from https://github.com/Valloric/vim-operator-highlight)
"-------------------

if exists( 'g:loaded_operator_highlight' )
  finish
else
  let g:loaded_operator_highlight = 1
endif

if !exists( 'g:ophigh_color_gui' )
  let g:ophigh_color_gui = "#E06C75"
endif

if !exists( 'g:ophigh_highlight_link_group' )
  let g:ophigh_highlight_link_group = ""
endif


if !exists( 'g:ophigh_color' )
  let g:ophigh_color = "168"
endif

if !exists( 'g:ophigh_filetypes_to_ignore' )
  let g:ophigh_filetypes_to_ignore = {}
endif

fun! s:IgnoreFiletypeIfNotSet( file_type )
  if get( g:ophigh_filetypes_to_ignore, a:file_type, 1 )
    let g:ophigh_filetypes_to_ignore[ a:file_type ] = 1
  endif
endfunction

call s:IgnoreFiletypeIfNotSet('help')
call s:IgnoreFiletypeIfNotSet('markdown')
call s:IgnoreFiletypeIfNotSet('qf') " This is for the quickfix window
call s:IgnoreFiletypeIfNotSet('conque_term')
call s:IgnoreFiletypeIfNotSet('diff')
call s:IgnoreFiletypeIfNotSet('html')
call s:IgnoreFiletypeIfNotSet('css')
call s:IgnoreFiletypeIfNotSet('less')
call s:IgnoreFiletypeIfNotSet('xml')
call s:IgnoreFiletypeIfNotSet('sh')
call s:IgnoreFiletypeIfNotSet('bash')
call s:IgnoreFiletypeIfNotSet('notes')
call s:IgnoreFiletypeIfNotSet('jinja')

fun! s:HighlightOperators()
  if get( g:ophigh_filetypes_to_ignore, &filetype, 0 )
    return
  endif

  " for the last element of the regex, see :h /\@!
  " basically, searching for "/" is more complex since we want to avoid
  " matching against "//" or "/*" which would break C++ comment highlighting
  syntax match OperatorChars "?\|+\|-\|\*\|:\|<\|>\|&\||\|\^\|!\|\~\|%\|=\|/\(/\|*\)\@!"



  if g:ophigh_highlight_link_group != "" 
    exec "hi link OperatorChars " . g:ophigh_highlight_link_group
  else
    exec "hi OperatorChars guifg=" . g:ophigh_color_gui . " gui=NONE"
    exec "hi OperatorChars ctermfg=" . g:ophigh_color . " cterm=NONE"
  endif

endfunction

au Syntax * call s:HighlightOperators()
au ColorScheme * call s:HighlightOperators()
