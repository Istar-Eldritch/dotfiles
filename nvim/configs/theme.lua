--
-- Built with,
--
--        ,gggg,
--       d8" "8I                         ,dPYb,
--       88  ,dP                         IP'`Yb
--    8888888P"                          I8  8I
--       88                              I8  8'
--       88        gg      gg    ,g,     I8 dPgg,
--  ,aa,_88        I8      8I   ,8'8,    I8dP" "8I
-- dP" "88P        I8,    ,8I  ,8'  Yb   I8P    I8
-- Yb,_,d88b,,_   ,d8b,  ,d8b,,8'_   8) ,d8     I8,
--  "Y8P"  "Y888888P'"Y88P"`Y8P' "YY8P8P88P     `Y8
--

local lush = require('lush')
local hsl = lush.hsl

local light = {
	hsl(50,100,95),
	hsl(45,100,90),
	hsl(40,100,85),
	hsl(35,100,80),
	hsl(30,100,75),
	hsl(25,100,70),
	hsl(20,100,65),
	hsl(15, 100,60),
}

local base = {
	hsl(36,75,50),
	hsl(32,75,50),
	hsl(29,75,50),
	hsl(25,75,50),
	hsl(20,75,50),
	hsl(15,75,50),
	hsl(10,75,50),
	hsl(05,75,50)
}

local dark = {
	hsl(32,70,45),
	hsl(28,70,40),
	hsl(25,70,35),
	hsl(20,70,30),
	hsl(15,70,25),
	hsl(10,70,20),
	hsl(05,70,10),
	hsl(00,70,5)
}

-- LSP/Linters mistakenly show `undefined global` errors in the spec, they may
-- support an annotation like the following. Consult your server documentation.
---@diagnostic disable: undefined-global
local theme = lush(function(injected_functions)
  local sym = injected_functions.sym
  return {
    --
    -- See :h highlight-groups
    --
    -- ColorColumn  {  }, -- Columns set with 'colorcolumn'
    Conceal      { fg=dark[5] }, -- Placeholder characters substituted for concealed text (see 'conceallevel')
    -- Cursor       { }, -- Character under the cursor
    -- lCursor      { }, -- Character under the cursor when |language-mapping| is used (see 'guicursor')
    -- CursorIM     { }, -- Like Cursor, but used when in IME mode |CursorIM|
    CursorColumn { bg=dark[7] }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
    CursorLine   { bg=dark[7] }, -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
    Directory    { fg=base[4] }, -- Directory names (and other special names in listings)
    DiffAdd      { fg=base[1] }, -- Diff mode: Added line |diff.txt|
    DiffChange   { fg=base[4] }, -- Diff mode: Changed line |diff.txt|
    DiffDelete   { fg=base[8] }, -- Diff mode: Deleted line |diff.txt|
    DiffText     { bg=dark[6], fg=base[4] }, -- Diff mode: Changed text within a changed line |diff.txt|
    EndOfBuffer  { fg=dark[5] }, -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
    -- TermCursor   { }, -- Cursor in a focused terminal
    -- TermCursorNC { }, -- Cursor in an unfocused terminal
    ErrorMsg     { fg=light[1], bg=base[8]}, -- Error messages on the command line
       VertSplit    { bg=nil }, -- Column separating vertically split windows
    Folded       { fg=dark[3] }, -- Line used for closed folds
    FoldColumn   { }, -- 'foldcolumn'
    SignColumn   { bg=nil }, -- Column where |signs| are displayed
    IncSearch    { fg=light[5], bg=base[5] }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    Substitute   { fg=light[5], bg=base[5] }, -- |:substitute| replacement text highlighting
    LineNr       { fg=dark[3] }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    CursorLineNr { fg=base[3] }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    MatchParen   { fg=base[3] }, -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    ModeMsg      { fg=base[3] }, -- 'showmode' message (e.g., "-- INSERT -- ")
    MsgArea      { fg=light[5]}, -- Area for messages and cmdline
    MsgSeparator { fg=base[3] }, -- Separator for scrolled messages, `msgsep` flag of 'display'
    MoreMsg      { fg=base[3] }, -- |more-prompt|
    NonText      { fg=dark[5] }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    Normal       { fg=light[5], bg=nil }, -- Normal text
    NormalFloat  { fg=light[5] }, -- Normal text in floating windows.
    NormalNC     { fg=light[5] }, -- normal text in non-current windows
    Pmenu        { fg=dark[3] }, -- Popup menu: Normal item.
    PmenuSel     { fg=light[7] }, -- Popup menu: Selected item.
    PmenuSbar    { fg=dark[5] }, -- Popup menu: Scrollbar.
    PmenuThumb   { fg=dark[3] }, -- Popup menu: Thumb of the scrollbar.
    Question     { fg=base[5] }, -- |hit-enter| prompt and yes/no questions
    QuickFixLine { fg=base[1] }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    Search       { fg=light[6], bg=base[5] }, -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
    SpecialKey   { fg=base[6] }, -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
    SpellBad     { fg=base[5], gui="underline", bg=dark[5]}, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    SpellCap     { SpellBad }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    SpellLocal   { fg=base[5], gui="underline", bg=nil}, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    SpellRare    { SpellLocal }, -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
    StatusLine   { fg=base[3], bg=dark[6]}, -- Status line of current window
    StatusLineNC { fg=dark[5], bg=dark[7]}, -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    TabLine      { }, -- Tab pages line, not active tab page label
    TabLineFill  { }, -- Tab pages line, where there are no labels
    TabLineSel   { }, -- Tab pages line, active tab page label
    Title        { fg=base[3] }, -- Titles for output from ":set all", ":autocmd" etc.
    Visual       { bg=dark[5], fg=light[7]}, -- Visual mode selection
    VisualNOS    { bg=dark[5], fg=light[8]}, -- Visual mode selection when vim is "Not Owning the Selection".
    WarningMsg   { fg=base[6] }, -- Warning messages
    Whitespace   { fg=dark[6] }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
    Winseparator { fg=nil, bg=nil }, -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
    WildMenu     { bg=dark[5], fg=light[7]}, -- Current match in 'wildmenu' completion

    -- Common vim syntax groups used for all kinds of code and markup.
    -- Commented-out groups should chain up to their preferred (*) group
    -- by default.
    --
    -- See :h group-name
    --
    -- Uncomment and edit if you want more specific syntax highlighting.

    Comment        { fg=dark[4]}, -- Any comment

    Constant       { fg=light[5] }, -- (*) Any constant
    String         { fg=base[6] }, --   A string constant: "this is a string"
    Character      { fg=base[6] }, --   A character constant: 'c', '\n'
    Number         { fg=base[6] }, --   A number constant: 234, 0xff
    Boolean        { fg=base[6] }, --   A boolean constant: TRUE, false
    Float          { fg=base[6] }, --   A floating point constant: 2.3e10

    Identifier     { fg=base[5], gui="bold" }, -- (*) Any variable name
    Function       { Identifier }, --   Function name (also: methods for classes)

    Statement      { fg=base[4] }, -- (*) Any statement
    -- Conditional    { }, --   if, then, else, endif, switch, etc.
    -- Repeat         { }, --   for, do, while, etc.
    -- Label          { }, --   case, default, etc.
    Operator       { fg=base[3] }, --   "sizeof", "+", "*", etc.
    Keyword        { fg=base[4] }, --   any other keyword
    -- Exception      { }, --   try, catch, throw

    PreProc        { fg=dark[2] }, -- (*) Generic Preprocessor
    -- Include        { }, --   Preprocessor #include
    -- Define         { }, --   Preprocessor #define
    Macro          { Function }, --   Same as Define
    -- PreCondit      { }, --   Preprocessor #if, #else, #endif, etc.

    Type           { fg=base[3], gui="bold" }, -- (*) int, long, char, etc.
    -- StorageClass   { }, --   static, register, volatile, etc.
    -- Structure      { }, --   struct, union, enum, etc.
    -- Typedef        { }, --   A typedef

    Special        { fg=light[7] }, -- (*) Any special symbol
    -- SpecialChar    { }, --   Special character in a constant
    -- Tag            { }, --   You can use CTRL-] on this
    -- Delimiter      { }, --   Character that needs attention
    -- SpecialComment { }, --   Special things inside a comment (e.g. '\n')
    -- Debug          { }, --   Debugging statements

    Underlined     { gui = "underline,bold" }, -- Text that stands out, HTML links
    Ignore         { fg=base[6] }, -- Left blank, hidden |hl-Ignore| (NOTE: May be invisible here in template)
    Error          { fg=light[6], bg=base[8], gui="bold"}, -- Any erroneous construct
    Todo           { fg=dark[4], bg=dark[6], gui="undeerline, bold"}, -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX

    -- These groups are for the native LSP client and diagnostic system. Some
    -- other LSP clients may use these groups, or use their own. Consult your
    -- LSP client's documentation.

    -- See :h lsp-highlight, some groups may not be listed, submit a PR fix to lush-template!
    --
    -- LspReferenceText            { } , -- Used for highlighting "text" references
    -- LspReferenceRead            { } , -- Used for highlighting "read" references
    -- LspReferenceWrite           { } , -- Used for highlighting "write" references
    -- LspCodeLens                 { } , -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
    -- LspCodeLensSeparator        { } , -- Used to color the seperator between two or more code lens.
    -- LspSignatureActiveParameter { } , -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.

    -- See :h diagnostic-highlights, some groups may not be listed, submit a PR fix to lush-template!
    --
    DiagnosticError            { fg=base[8] }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticWarn             { fg=base[6] } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticInfo             { fg=light[8] } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticHint             { fg=base[1] } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    -- DiagnosticVirtualTextError { } , -- Used for "Error" diagnostic virtual text.
    -- DiagnosticVirtualTextWarn  { } , -- Used for "Warn" diagnostic virtual text.
    -- DiagnosticVirtualTextInfo  { } , -- Used for "Info" diagnostic virtual text.
    -- DiagnosticVirtualTextHint  { } , -- Used for "Hint" diagnostic virtual text.
    -- DiagnosticUnderlineError   { } , -- Used to underline "Error" diagnostics.
    -- DiagnosticUnderlineWarn    { } , -- Used to underline "Warn" diagnostics.
    -- DiagnosticUnderlineInfo    { } , -- Used to underline "Info" diagnostics.
    -- DiagnosticUnderlineHint    { } , -- Used to underline "Hint" diagnostics.
    -- DiagnosticFloatingError    { } , -- Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
    -- DiagnosticFloatingWarn     { } , -- Used to color "Warn" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingInfo     { } , -- Used to color "Info" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingHint     { } , -- Used to color "Hint" diagnostic messages in diagnostics float.
    -- DiagnosticSignError        { } , -- Used for "Error" signs in sign column.
    -- DiagnosticSignWarn         { } , -- Used for "Warn" signs in sign column.
    -- DiagnosticSignInfo         { } , -- Used for "Info" signs in sign column.
    -- DiagnosticSignHint         { } , -- Used for "Hint" signs in sign column.

    -- Tree-Sitter syntax groups.
    --
    -- See :h treesitter-highlight-groups, some groups may not be listed,
    -- submit a PR fix to lush-template!
    --
    -- Tree-Sitter groups are defined with an "@" symbol, which must be
    -- specially handled to be valid lua code, we do this via the special
    -- sym function. The following are all valid ways to call the sym function,
    -- for more details see https://www.lua.org/pil/5.html
    --
    -- sym("@text.literal")
    -- sym('@text.literal')
    -- sym"@text.literal"
    -- sym'@text.literal'
    --
    -- For more information see https://github.com/rktjmp/lush.nvim/issues/109

    sym"@text.literal"      { }, -- Comment
    sym"@text.reference"    { }, -- Identifier
    sym"@text.title"        { }, -- Title
    sym"@text.uri"          { }, -- Underlined
    sym"@text.underline"    { }, -- Underlined
    sym"@text.todo"         { }, -- Todo
    sym"@comment"           { }, -- Comment
    sym"@punctuation"       { }, -- Delimiter
    sym"@constant"          { }, -- Constant
    sym"@constant.builtin"  { }, -- Special
    sym"@constant.macro"    { }, -- Define
    sym"@define"            { }, -- Define
    sym"@macro"             { }, -- Macro
    sym"@string"            { }, -- String
    sym"@string.escape"     { }, -- SpecialChar
    sym"@string.special"    { }, -- SpecialChar
    sym"@character"         { }, -- Character
    sym"@character.special" { }, -- SpecialChar
    sym"@number"            { }, -- Number
    sym"@boolean"           { }, -- Boolean
    sym"@float"             { }, -- Float
    sym"@function"          { }, -- Function
    sym"@function.builtin"  { }, -- Special
    sym"@function.macro"    { }, -- Macro
    sym"@parameter"         { }, -- Identifier
    sym"@method"            { }, -- Function
    sym"@field"             { }, -- Identifier
    sym"@property"          { }, -- Identifier
    sym"@constructor"       { }, -- Special
    sym"@conditional"       { }, -- Conditional
    sym"@repeat"            { }, -- Repeat
    sym"@label"             { }, -- Label
    sym"@operator"          { }, -- Operator
    sym"@keyword"           { Keyword }, -- Keyword
    sym"@exception"         { }, -- Exception
    sym"@variable"          { }, -- Identifier
    sym"@type"              { }, -- Type
    sym"@type.definition"   { }, -- Typedef
    sym"@storageclass"      { }, -- StorageClass
    sym"@structure"         { }, -- Structure
    sym"@namespace"         { }, -- Identifier
    sym"@include"           { }, -- Include
    sym"@preproc"           { }, -- PreProc
    sym"@debug"             { }, -- Debug
    sym"@tag"               { }, -- Tag

    GitGutterAdd { fg = base[1] },
    GitGutterChange { fg = base[3] },
    GitGutterDelete { fg = base[8] },
    GitGutterChangeDelete { fg = base[6] }

    -- GitGutter
}
end)

-- Return our parsed theme for extension or use elsewhere.
return theme

-- vi:nowrap

