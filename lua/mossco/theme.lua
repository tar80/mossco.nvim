local theme = {}

function theme.highlights(colors, config)
  local function remove_background(group)
    group["bg"] = colors.none
  end

  local function load_syntax()
    -- Syntax highlight groups
    local syntax = {
      -- int, long, char, etc.
      Type = { fg = colors.olive },
      -- static, register, volatile, etc.
      StorageClass = { fg = colors.purple },
      -- struct, union, enum, etc.
      Structure = { fg = colors.purple },
      -- any constant
      Constant = { fg = colors.olive },
      -- any character constant: 'c', '\n'
      Character = { fg = colors.green },
      -- a number constant: 5
      Number = { fg = colors.orange },
      -- a boolean constant: TRUE, false
      Boolean = { fg = colors.orange },
      -- a floating point constant: 2.3e10
      Float = { fg = colors.orange },
      -- any statement
      Statement = { fg = colors.blue },
      -- case, default, etc.
      Label = { fg = colors.gray },
      -- sizeof", "+", "*", etc.
      Operator = { fg = colors.pink },
      -- try, catch, throw
      Exception = { fg = colors.purple },
      -- generic Preprocessor
      PreProc = { fg = colors.purple },
      -- preprocessor #include
      Include = { fg = colors.dark_cyan },
      -- preprocessor #define
      Define = { fg = colors.dark_cyan },
      -- same as Define
      Macro = { fg = colors.dark_cyan },
      -- A typedef
      Typedef = { fg = colors.purple },
      -- preprocessor #if, #else, #endif, etc.
      PreCondit = { fg = colors.purple },
      -- any special symbol
      Special = { fg = colors.dark_olive },
      -- special character in a constant
      SpecialChar = { fg = colors.light_green },
      -- you can use CTRL-] on this
      Tag = { fg = colors.green },
      -- character that needs attention like , or .
      Delimiter = { fg = colors.dark_olive },
      -- special things inside a comment
      SpecialComment = { fg = colors.dark_gray },
      -- debugging statements
      Debug = { fg = colors.olive },
      -- text that stands out, HTML links
      Underlined = { fg = colors.green, style = "underline" },
      -- left blank, hidden
      Ignore = { fg = colors.gray, bg = colors.bg, style = "bold" },
      -- any erroneous construct
      Error = { fg = colors.error, bg = colors.none, style = "bold,underline" },
      -- anything that needs extra attention; mostly the keywords TODO FIXME and XXX
      Todo = { fg = colors.olive, bg = colors.none, style = "bold" },
      Comment = { fg = colors.dark_gray, style = config.styles.comments }, -- normal comments
      -- normal if, then, else, endif, switch, etc.
      Conditional = { fg = colors.purple, style = config.styles.keywords },
      -- normal for, do, while, etc.
      Keyword = { fg = colors.blue, style = config.styles.keywords },
      -- normal any other keyword
      Repeat = { fg = colors.purple, style = config.styles.keywords },
      -- normal function names
      Function = { fg = colors.yellow, style = config.styles.functions },
      -- any variable name
      Identifier = { fg = colors.fg, style = config.styles.variables },
      -- any string
      String = { fg = colors.green, bg = colors.bg, config.styles.strings },
      -- diff
      diffAdded = { fg = colors.diff_add },
      diffRemoved = { fg = colors.diff_remove },
      diffChanged = { fg = colors.diff_change },
      diffOldFile = { fg = colors.yellow },
      diffNewFile = { fg = colors.orange },
      diffFile = { fg = colors.blue },
      diffLine = { fg = colors.light_gray },
      diffIndexLine = { fg = colors.purple },
    }

    return syntax
  end

  local function load_editor()
    -- Editor highlight groups
    local editor = {
      -- normal text and background color for floating windows
      NormalFloat = { fg = colors.fg, bg = colors.active },
      -- floating window border
      FloatBorder = { fg = colors.blue, bg = colors.active },
      -- used for the columns set with 'colorcolumn'
      ColorColumn = { fg = colors.none, bg = colors.float },
      -- placeholder characters substituted for concealed text (see 'conceallevel')
      Conceal = { bg = colors.bg },
      -- the character under the cursor
      Cursor = { fg = colors.fg, bg = colors.none, style = "reverse" },
      -- like Cursor, but used when in IME mode
      CursorIM = { fg = colors.fg, bg = colors.none, style = "reverse" },
      -- directory names (and other special names in listings)
      Directory = { fg = colors.blue, bg = colors.none },
      -- diff mode: Added line
      DiffAdd = { fg = colors.gray, bg = colors.diff_add_bg },
      -- diff mode: Changed line
      DiffChange = { fg = colors.gray, bg = colors.diff_change_bg },
      -- diff mode: Deleted line
      DiffDelete = { fg = colors.diff_remove_bg, bg = colors.diff_remove_bg },
      -- diff mode: Changed text within a changed line
      DiffText = { fg = colors.none, bg = colors.diff_text_bg },
      -- error messages
      ErrorMsg = { fg = colors.error },
      -- line used for closed folds
      Folded = { fg = colors.dark_blue, bg = colors.none, style = "italic" },
      -- 'foldcolumn'
      FoldColumn = { fg = colors.dark_gray },
      -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
      IncSearch = { fg = colors.bg, bg = colors.olive },
      -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
      LineNr = { fg = colors.dark_cyan },
      LineNrAbove = { fg = colors.dark_gray },
      LineNrBelow = { fg = colors.dark_gray },
      -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
      CursorLineNr = { fg = colors.dark_cyan },
      -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
      MatchParen = { fg = colors.olive, bg = colors.none, style = "bold" },
      -- 'showmode' message (e.g., "-- INSERT -- ")
      ModeMsg = { fg = colors.blue, style = "bold" },
      -- |more-prompt|
      MoreMsg = { fg = colors.blue, style = "bold" },
      -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist
      -- in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line).
      -- See also |hl-EndOfBuffer|.
      NonText = { fg = colors.dark_pink },
      -- normal item |hl-Pmenu|
      Pmenu = { fg = colors.fg, bg = colors.float },
      -- selected item |hl-PmenuSel|
      PmenuSel = { bg = colors.selection },
      -- scrollbar |hl-PmenuSbar|
      PmenuSbar = { bg = colors.float },
      -- thumb of the scrollbar  |hl-PmenuThumb|
      PmenuThumb = { bg = colors.fg },
      -- |hit-enter| prompt and yes/no questions
      Question = { fg = colors.green },
      -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
      QuickFixLine = { bg = colors.float, style = "bold" },
      -- Line numbers for quickfix lists
      qfLineNr = { fg = colors.purple },
      -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
      Search = { fg = colors.olive, bg = colors.selection, style = "bold" },
      -- Unprintable characters: text displayed differently from what it really is.
      -- But not 'listchars' whitespace. |hl-Whitespace|
      SpecialKey = { fg = colors.dark_blue },
      -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
      SpellBad = { fg = colors.red, bg = colors.none, style = "italic,underline", sp = colors.red },
      -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
      SpellCap = { fg = colors.olive, bg = colors.none, style = "italic,underline", sp = colors.olive },
      -- Word that is recognized by the spellchecker as one that is used in another region.
      -- |spell| Combined with the highlighting used otherwise.
      SpellLocal = { fg = colors.cyan, bg = colors.none, style = "italic,underline", sp = colors.cyan },
      -- Word that is recognized by the spellchecker as one that is hardly ever used.
      -- |spell| Combined with the highlighting used otherwise.
      SpellRare = { fg = colors.purple, bg = colors.none, style = "italic,underline", sp = colors.purple },
      -- status line of current window
      StatusLine = { fg = colors.fg, bg = colors.border },
      -- status lines of not-current windows Note: if this is equal to "StatusLine"
      -- Vim will use "^^^" in the status line of the current window.
      StatusLineNC = { fg = colors.dark_gray, bg = colors.border },
      -- status line of current terminal window
      StatusLineTerm = { fg = colors.fg, bg = colors.border },
      -- status lines of not-current terminal windows Note: if this is equal to "StatusLine"
      -- Vim will use "^^^" in the status line of the current window.
      StatusLineTermNC = { fg = colors.dark_gray, bg = colors.border },
      -- tab pages line, where there are no labels
      TabLineFill = { fg = colors.dark_gray, bg = colors.border },
      -- tab pages line, active tab page label
      TablineSel = { fg = colors.cyan, bg = colors.bg },
      Tabline = { fg = colors.dark_purple, bg = colors.border },
      -- titles for output from ":set all", ":autocmd" etc.
      Title = { fg = colors.green, bg = colors.none, style = "bold" },
      -- Visual mode selection
      Visual = { fg = colors.none, bg = colors.selection },
      -- Visual mode selection when vim is "Not Owning the Selection".
      VisualNOS = { fg = colors.none, bg = colors.selection },
      -- warning messages
      WarningMsg = { fg = colors.warn },
      -- "nbsp", "space", "tab" and "trail" in 'listchars'
      Whitespace = { fg = colors.dark_gray, bg = colors.border },
      -- current match in 'wildmenu' completion
      WildMenu = { fg = colors.olive, bg = colors.none, style = "bold" },
      -- window bar of current window
      WinBar = { fg = colors.fg, bg = colors.bg },
      -- window bar of not-current windows
      WinBarNC = { fg = colors.dark_gray, bg = colors.bg },
      -- Screen-column at the cursor, when 'cursorcolumn' is set.
      CursorColumn = { fg = colors.none, bg = colors.float },
      -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
      CursorLine = { fg = colors.none, bg = colors.active },
      -- Normal mode message in the cmdline
      NormalMode = { fg = colors.cyan, bg = colors.none, style = "reverse" },
      -- Insert mode message in the cmdline
      InsertMode = { fg = colors.dark_green, bg = colors.none, style = "reverse" },
      -- Replace mode message in the cmdline
      ReplacelMode = { fg = colors.dark_blue, bg = colors.none, style = "reverse" },
      -- Visual mode message in the cmdline
      VisualMode = { fg = colors.dark_purple, bg = colors.none, style = "reverse" },
      -- Command mode message in the cmdline
      CommandMode = { fg = colors.dark_olive, bg = colors.none, style = "reverse" },
      Warnings = { fg = colors.warn },
      healthError = { fg = colors.error },
      healthSuccess = { fg = colors.green },
      healthWarning = { fg = colors.warn },
      -- normal text and background color
      Normal = { fg = colors.fg, bg = colors.bg },
      NormalNC = { bg = colors.bg },
      SignColumn = { fg = colors.fg, bg = colors.none },
      -- the column separating vertically split windows
      VertSplit = { fg = colors.border },
      EndOfBuffer = { fg = colors.gray },
    }

    -- Options:
    if config.fade_no_bg then
      vim.g.fade_no_bg = true
      config.fade_nc = true
    end

    -- Set non-current background
    if config.fade_nc then
      editor.NormalNC["bg"] = colors.bg_light
      editor.NormalFloat["bg"] = colors.highlight
      editor.FloatBorder["bg"] = colors.highlight
    end

    -- Set transparent background
    if config.disable.background then
      remove_background(editor.Normal)
      remove_background(editor.NormalNC)
      remove_background(editor.SignColumn)
    end

    -- Set transparent cursorline
    if config.disable.cursorline then
      remove_background(editor.CursorLine)
    end

    -- Set transparent eob lines
    if config.disable.eob_lines then
      editor.EndOfBuffer["fg"] = colors.bg
    end

    -- Add window split borders
    if config.borders then
      editor.VertSplit["fg"] = colors.border
    end

    return editor
  end

  local function load_treesitter()
    local ex = {}

    if config.plugins.treesitter and vim.fn.has("nvim-0.8") then
      -- TreeSitter highlight groups
      ex = {
        -- Annotations that can be attached to the code to denote some kind of meta information. e.g. C++/Dart attributes.
        ["@attribute"] = { fg = colors.gray },
        -- Boolean literals: `True` and `False` in Python.
        ["@boolean"] = { fg = colors.orange },
        -- Character literals: `'a'` in C.
        ["@character"] = { fg = colors.green },
        -- Line comments and block comments.
        ["@comment"] = { fg = colors.dark_gray, style = config.styles.comments },
        -- Keywords related to conditionals: `if`, `when`, `cond`, etc.
        ["@conditional"] = { fg = colors.purple, style = config.styles.keywords },
        -- Constants identifiers. These might not be semantically constant. E.g. uppercase variables in Python.
        ["@constant"] = { fg = colors.olive },
        -- Built-in constant values: `nil` in Lua.
        ["@constant.builtin"] = { fg = colors.orange },
        -- Constants defined by macros: `NULL` in C.
        ["@constant.macro"] = { fg = colors.red },
        -- Constructor calls and definitions: `{}` in Lua, and Java constructors.
        ["@constructor"] = { fg = colors.olive },
        -- Syntax/parser errors. This might highlight large sections of code while the user is typing
        -- still incomplete code, use a sensible highlight.
        ["@error"] = { fg = colors.error },
        -- Exception related keywords: `try`, `except`, `finally` in Python.
        ["@exception"] = { fg = colors.purple },
        -- Object and struct fields.
        ["@field"] = { fg = colors.fg },
        -- Floating-point number literals.
        ["@float"] = { fg = colors.orange },
        -- Function calls and definitions.
        ["@function"] = { fg = colors.cyan, style = config.styles.functions },
        -- Built-in functions: `print` in Lua.
        ["@function.builtin"] = { fg = colors.cyan, style = config.styles.functions },
        -- Macro defined functions (calls and definitions): each `macro_rules` in Rust.
        ["@function.macro"] = { fg = colors.dark_cyan },
        -- File or module inclusion keywords: `#include` in C, `use` or `extern crate` in Rust.
        ["@include"] = { fg = colors.dark_cyan },
        -- Keywords that don't fit into other categories.
        ["@keyword"] = { fg = colors.gray, style = config.styles.keywords },
        -- Keywords used to define a function: `function` in Lua, `def` and `lambda` in Python.
        ["@keyword.function"] = { fg = colors.olive, style = config.styles.keywords },
        -- Unary and binary operators that are English words: `and`, `or` in Python; `sizeof` in C.
        ["@keyword.operator"] = { fg = colors.pink },
        -- Keywords like `return` and `yield`.
        ["@keyword.return"] = { fg = colors.olive },
        -- GOTO labels: `label:` in C, and `::label::` in Lua.
        ["@label"] = { fg = colors.cyan },
        -- Method calls and definitions.
        ["@method"] = { fg = colors.dark_cyan, style = config.styles.functions },
        -- Identifiers referring to modules and namespaces.
        ["@namespace"] = { fg = colors.olive },
        -- Numeric literals that don't fit into other categories.
        ["@number"] = { fg = colors.orange },
        -- Binary or unary operators: `+`, and also `->` and `*` in C.
        ["@operator"] = { fg = colors.pink },
        -- Parameters of a function.
        ["@parameter"] = { fg = colors.blue },
        -- References to parameters of a function.
        ["@parameter.reference"] = { fg = colors.red },
        -- Same as `TSField`.
        ["@property"] = { fg = colors.fg },
        -- Punctuation delimiters: Periods, commas, semicolons, etc.
        ["@punctuation.delimiter"] = { fg = colors.dark_olive },
        -- Brackets, braces, parentheses, etc.
        ["@punctuation.bracket"] = { fg = colors.dark_olive },
        -- Special punctuation that doesn't fit into the previous categories.
        ["@punctuation.special"] = { fg = colors.dark_olive },
        -- Keywords related to loops: `for`, `while`, etc.
        ["@repeat"] = { fg = colors.purple, style = config.styles.keywords },
        -- String literals.
        ["@string"] = { fg = colors.green, style = config.styles.strings },
        -- Regular expression literals.
        ["@string.regex"] = { fg = colors.orange },
        -- Escape characters within a string: `\n`, `\t`, etc.
        ["@string.escape"] = { fg = colors.orange },
        -- Identifiers referring to symbols or atoms.
        ["@symbol"] = { fg = colors.cyan },
        -- Tags like HTML tag names.
        ["@tag"] = { fg = colors.olive },
        -- HTML tag attributes.
        ["@tag.attribute"] = { fg = colors.dark_cyan },
        -- Tag delimiters like `<` `>` `/`.
        ["@tag.delimiter"] = { fg = colors.dark_olive },
        -- Non-structured text. Like text in a markup language.
        ["@text"] = { fg = colors.fg },
        -- Text to be represented in bold.
        ["@text.strong"] = { fg = colors.dark_cyan, style = "bold" },
        -- Text to be represented with emphasis.
        ["@text.emphasis"] = { fg = colors.olive, style = "italic" },
        -- Text to be represented with an underline.
        ["@text.underline"] = { style = "underline" },
        -- Text that is part of a title.
        ["@text.title"] = { fg = colors.blue, style = "bold" },
        -- Literal or verbatim text.
        ["@text.literal"] = { fg = colors.green },
        -- URIs like hyperlinks or email addresses.
        ["@text.uri"] = { fg = colors.cyan, style = "underline" },
        -- Math environments like LaTeX's `$ ... $`
        ["@text.math"] = { fg = colors.fg },
        -- Footnotes, text references, citations, etc.
        ["@text.reference"] = { fg = colors.gray },
        -- Text environments of markup languages.
        ["@text.environment"] = { fg = colors.fg },
        -- Text/string indicating the type of text environment. Like the name of a `\begin` block in LaTeX.
        ["@text.environment.name"] = { fg = colors.fg },
        -- Text representation of an informational note.
        ["@note"] = { fg = colors.info, style = "bold" },
        -- Text representation of a warning note.
        ["@warning"] = { fg = colors.warn, style = "bold" },
        -- Text representation of a danger note.
        ["@danger"] = { fg = colors.error, style = "bold" },
        -- Type (and class) definitions and annotations.
        ["@type"] = { fg = colors.olive },
        -- Built-in types: `i32` in Rust.
        ["@type.builtin"] = { fg = colors.orange },
        -- Variable names that don't fit into other categories.
        ["@variable"] = { fg = colors.fg, style = config.styles.variables },
        -- Variable names defined by the language: `this` or `self` in Javascript.
        ["@variable.builtin"] = { fg = colors.red, style = config.styles.variables },
      }
    else
      -- Standard filetype highlight groups
      ex = {
        htmlLink = { fg = colors.green, style = "underline" },
        htmlArg = { fg = colors.blue },
        htmlTag = { fg = colors.blue },
        htmlEndTag = { fg = colors.blue },
        htmlTagN = { fg = colors.olive },
        htmlTagName = { fg = colors.olive },
        htmlSpecialTagName = { fg = colors.olive },
        htmlH1 = { fg = colors.cyan, style = "bold" },
        htmlH2 = { fg = colors.red, style = "bold" },
        htmlH3 = { fg = colors.green, style = "bold" },
        htmlH4 = { fg = colors.olive, style = "bold" },
        htmlH5 = { fg = colors.purple, style = "bold" },
        cssAttributeSelector = { fg = colors.blue },
        cssSelectorOp = { fg = colors.dark_blue },
        cssTagName = { fg = colors.olive },
        markdownBlockquote = { fg = colors.dark_gray },
        markdownBold = { fg = colors.purple, style = "bold" },
        markdownCode = { fg = colors.green },
        markdownCodeBlock = { fg = colors.green },
        markdownCodeDelimiter = { fg = colors.green },
        markdownH1 = { fg = colors.dark_blue, style = "bold" },
        markdownH2 = { fg = colors.blue, style = "bold" },
        markdownH3 = { fg = colors.cyan, style = "bold" },
        markdownH4 = { fg = colors.light_green },
        markdownH5 = { fg = colors.light_green },
        markdownH6 = { fg = colors.light_green },
        markdownH1Delimiter = { fg = colors.dark_blue },
        markdownH2Delimiter = { fg = colors.blue },
        markdownH3Delimiter = { fg = colors.cyan },
        markdownH4Delimiter = { fg = colors.light_green },
        markdownH5Delimiter = { fg = colors.light_green },
        markdownH6Delimiter = { fg = colors.light_green },
        markdownId = { fg = colors.olive },
        markdownIdDeclaration = { fg = colors.purple },
        markdownIdDelimiter = { fg = colors.dark_gray },
        markdownLinkDelimiter = { fg = colors.dark_gray },
        markdownItalic = { fg = colors.olive, style = "italic" },
        markdownLinkText = { fg = colors.purple },
        markdownListMarker = { fg = colors.red },
        markdownOrderedListMarker = { fg = colors.red },
        markdownRule = { fg = colors.purple },
        markdownUrl = { fg = colors.cyan, style = "underline" },
      }
    end

    return ex
  end

  local function load_lsp()
    -- Lsp highlight groups
    local lsp = {}

    if config.plugins.lsp then
      lsp = {
        -- used for "Error" diagnostic virtual text
        LspDiagnosticsDefaultError = { fg = colors.error },
        -- used for "Error" diagnostic signs in sign column
        LspDiagnosticsSignError = { fg = colors.error },
        -- used for "Error" diagnostic messages in the diagnostics float
        LspDiagnosticsFloatingError = { fg = colors.error },
        -- Virtual text "Error"
        LspDiagnosticsVirtualTextError = { fg = colors.dark_pink },
        -- used to underline "Error" diagnostics.
        LspDiagnosticsUnderlineError = { style = config.styles.diagnostics, sp = colors.error },
        -- used for "Warning" diagnostic signs in sign column
        LspDiagnosticsDefaultWarning = { fg = colors.warn },
        -- used for "Warning" diagnostic signs in sign column
        LspDiagnosticsSignWarning = { fg = colors.warn },
        -- used for "Warning" diagnostic messages in the diagnostics float
        LspDiagnosticsFloatingWarning = { fg = colors.warn },
        -- Virtual text "Warning"
        LspDiagnosticsVirtualTextWarning = { fg = colors.dark_olive },
        -- used to underline "Warning" diagnostics.
        LspDiagnosticsUnderlineWarning = { style = config.styles.diagnostics, sp = colors.warn },
        -- used for "Information" diagnostic virtual text
        LspDiagnosticsDefaultInformation = { fg = colors.info },
        -- used for "Information" diagnostic signs in sign column
        LspDiagnosticsSignInformation = { fg = colors.info },
        -- used for "Information" diagnostic messages in the diagnostics float
        LspDiagnosticsFloatingInformation = { fg = colors.info },
        -- Virtual text "Information"
        LspDiagnosticsVirtualTextInformation = { fg = colors.dark_blue },
        -- used to underline "Information" diagnostics.
        LspDiagnosticsUnderlineInformation = { style = config.styles.diagnostics, sp = colors.info },
        -- used for "Hint" diagnostic virtual text
        LspDiagnosticsDefaultHint = { fg = colors.hint },
        -- used for "Hint" diagnostic signs in sign column
        LspDiagnosticsSignHint = { fg = colors.hint },
        -- used for "Hint" diagnostic messages in the diagnostics float
        LspDiagnosticsFloatingHint = { fg = colors.hint },
        -- Virtual text "Hint"
        LspDiagnosticsVirtualTextHint = { fg = colors.dark_purple },
        -- used to underline "Hint" diagnostics.
        LspDiagnosticsUnderlineHint = { style = config.styles.diagnostics, sp = colors.hint },
        -- used for highlighting "text" references
        LspReferenceText = { bg = colors.border, style = config.styles.references },
        -- used for highlighting "read" references
        LspReferenceRead = { bg = colors.border, style = config.styles.references },
        -- used for highlighting "write" references
        LspReferenceWrite = { bg = colors.border, style = config.styles.references },
        LspSignatureActiveParameter = { fg = colors.none, bg = colors.highlight, style = "bold" },
        LspCodeLens = { fg = colors.dark_gray },
        DiagnosticError = { link = "LspDiagnosticsDefaultError" },
        DiagnosticWarn = { link = "LspDiagnosticsDefaultWarning" },
        DiagnosticInfo = { link = "LspDiagnosticsDefaultInformation" },
        DiagnosticHint = { link = "LspDiagnosticsDefaultHint" },
        DiagnosticVirtualTextWarn = { link = "LspDiagnosticsVirtualTextWarning" },
        DiagnosticUnderlineWarn = { link = "LspDiagnosticsUnderlineWarning" },
        DiagnosticFloatingWarn = { link = "LspDiagnosticsFloatingWarning" },
        DiagnosticSignWarn = { link = "LspDiagnosticsSignWarning" },
        DiagnosticVirtualTextError = { link = "LspDiagnosticsVirtualTextError" },
        DiagnosticUnderlineError = { link = "LspDiagnosticsUnderlineError" },
        DiagnosticFloatingError = { link = "LspDiagnosticsFloatingError" },
        DiagnosticSignError = { link = "LspDiagnosticsSignError" },
        DiagnosticVirtualTextInfo = { link = "LspDiagnosticsVirtualTextInformation" },
        DiagnosticUnderlineInfo = { link = "LspDiagnosticsUnderlineInformation" },
        DiagnosticFloatingInfo = { link = "LspDiagnosticsFloatingInformation" },
        DiagnosticSignInfo = { link = "LspDiagnosticsSignInformation" },
        DiagnosticVirtualTextHint = { link = "LspDiagnosticsVirtualTextHint" },
        DiagnosticUnderlineHint = { link = "LspDiagnosticsUnderlineHint" },
        DiagnosticFloatingHint = { link = "LspDiagnosticsFloatingHint" },
        DiagnosticSignHint = { link = "LspDiagnosticsSignHint" },
      }
    end

    return lsp
  end

  local function load_plugins()
    -- Plugins highlight groups
    local p = {}

    if config.plugins.agit then
      p["agitTree"] = { fg = colors.gray }
      p["agitRef"] = { fg = colors.dark_cyan }
      p["agitRemote"] = { fg = colors.dark_cyan }
      p["agitHash"] = { fg = colors.blue }
      p["agitHead"] = { fg = colors.pink }
      p["agitDate"] = { fg = colors.purple }
      p["agitDateMark"] = { fg = colors.fg }
      p["agitLog"] = { fg = colors.fg }
      p["agitStatAdded"] = { fg = colors.diff_change }
      p["agitStatRemoved"] = { fg = colors.diff_remove }
      p["agitStatMessage"] = { fg = colors.fg }
      p["agitDiffAdd"] = { fg = colors.diff_change, bg = colors.diff_change_bg }
      p["agitDiffRemove"] = { fg = colors.diff_remove, bg = colors.diff_remove_bg }
    end
    if config.plugins.conflict_marker then
      vim.g.conflict_marker_highlight_group = ""
      p["ConflictMarkerBegin"] = { fg = colors.fg_light, bg = colors.dark_green }
      p["ConflictMarkerOurs"] = { fg = colors.green, bg = colors.diff_change_bg }
      p["ConflictMarkerTheirs"] = { fg = colors.blue, bg = colors.diff_add_bg }
      p["ConflictMarkerEnd"] = { fg = colors.fg_light, bg = colors.dark_blue }
      p["ConflictMarkerSeparator"] = { fg = colors.fg_light, bg = colors.dark_pink }
      p["ConflictMarkerCommonAncestors"] = { fg = colors.fg_light, bg = colors.dark_pink }
      p["ConflictMarkerCommonAncestorsHunk"] = { fg = colors.dark_pink, bg = colors.diff_remove_bg }
    end
    if config.plugins.eft then
      p["EftChar"] = { fg = colors.orange, style = "underline" }
      p["EftSubChar"] = { fg = colors.dark_orange, style = "underline" }
    end
    if config.plugins.gina then
      p["GinaActionMarkSelected"] = { fg = colors.green }
    end
    if config.plugins.fuzzy_motion then
      p["FuzzyMotionShade"] = { fg = colors.dark_gray }
      p["FuzzyMotionChar"] = { fg = colors.bg, bg = colors.pink }
      p["FuzzyMotionSubChar"] = { fg = colors.pink }
      p["FuzzyMotionMatch"] = { fg = colors.olive }
    end
    if config.plugins.cmp then
      p["CmpItemAbbr"] = { fg = colors.fg }
      p["CmpItemAbbrDeprecated"] = { fg = colors.fg }
      p["CmpItemAbbrMatch"] = { fg = colors.pink, style = "bold" }
      p["CmpItemAbbrMatchFuzzy"] = { fg = colors.pink, style = "underline" }
      p["CmpItemMenu"] = { fg = colors.dark_gray }
      p["CmpItemKind"] = { fg = colors.olive }
      p["CmpItemKindText"] = { fg = colors.cyan }
      p["CmpItemKindMethod"] = { fg = colors.olive }
      p["CmpItemKindFunction"] = { fg = colors.blue }
      p["CmpItemKindConstructor"] = { fg = colors.olive }
      p["CmpItemKindField"] = { fg = colors.blue }
      p["CmpItemKindClass"] = { fg = colors.olive }
      p["CmpItemKindInterface"] = { fg = colors.olive }
      p["CmpItemKindModule"] = { fg = colors.blue }
      p["CmpItemKindProperty"] = { fg = colors.blue }
      p["CmpItemKindValue"] = { fg = colors.orange }
      p["CmpItemKindEnum"] = { fg = colors.olive }
      p["CmpItemKindKeyword"] = { fg = colors.purple }
      p["CmpItemKindSnippet"] = { fg = colors.green }
      p["CmpItemKindFile"] = { fg = colors.blue }
      p["CmpItemKindEnumMember"] = { fg = colors.cyan }
      p["CmpItemKindConstant"] = { fg = colors.purple }
      p["CmpItemKindStruct"] = { fg = colors.olive }
      p["CmpItemKindTypeParameter"] = { fg = colors.olive }
    end
    if config.plugins.dashboard then
      p["DashboardShortCut"] = { fg = colors.cyan }
      p["DashboardHeader"] = { fg = colors.blue }
      p["DashboardCenter"] = { fg = colors.purple }
      p["DashboardFooter"] = { fg = colors.green, style = "italic" }
    end
    if config.plugins.notify then
      p["NotifyBackground"] = { bg = "#000000" }
      p["NotifyERRORBorder"] = { fg = colors.error }
      p["NotifyWARNBorder"] = { fg = colors.warn }
      p["NotifyINFOBorder"] = { fg = colors.info }
      p["NotifyDEBUGBorder"] = { fg = colors.light_gray }
      p["NotifyTRACEBorder"] = { fg = colors.hint }
      p["NotifyERRORIcon"] = { fg = colors.error }
      p["NotifyWARNIcon"] = { fg = colors.warn }
      p["NotifyINFOIcon"] = { fg = colors.info }
      p["NotifyDEBUGIcon"] = { fg = colors.light_gray }
      p["NotifyTRACEIcon"] = { fg = colors.hint }
      p["NotifyERRORTitle"] = { fg = colors.error }
      p["NotifyWARNTitle"] = { fg = colors.warn }
      p["NotifyINFOTitle"] = { fg = colors.info }
      p["NotifyDEBUGTitle"] = { fg = colors.light_gray }
      p["NotifyTRACETitle"] = { fg = colors.hint }
    end
    if config.plugins.trouble then
      p["TroubleCount"] = { fg = colors.purple }
      p["TroubleNormal"] = { fg = colors.fg }
      p["TroubleText"] = { fg = colors.fg }
    end
    if config.plugins.neogit then
      p["NeogitBranch"] = { fg = colors.purple }
      p["NeogitRemote"] = { fg = colors.orange }
      p["NeogitHunkHeader"] = { fg = colors.fg, bg = colors.highlight }
      p["NeogitHunkHeaderHighlight"] = { fg = colors.yellow, bg = colors.highlight }
      p["NeogitDiffContextHighlight"] = { bg = colors.active }
      p["NeogitDiffDeleteHighlight"] = { fg = colors.diff_remove, bg = colors.diff_remove_bg }
      p["NeogitDiffAddHighlight"] = { fg = colors.diff_add, bg = colors.diff_add_bg }
      p["NeogitNotificationInfo"] = { fg = colors.info }
      p["NeogitNotificationWarning"] = { fg = colors.warn }
      p["NeogitNotificationError"] = { fg = colors.error }
    end
    if config.plugins.gitgutter then
      p["GitGutterAdd"] = { fg = colors.diff_add } -- diff mode: Added line |diff.txt|
      p["GitGutterChange"] = { fg = colors.diff_change } -- diff mode: Changed line |diff.txt|
      p["GitGutterDelete"] = { fg = colors.diff_remove } -- diff mode: Deleted line |diff.txt|
    end
    if config.plugins.gitsigns then
      p["GitSignsAdd"] = { fg = colors.diff_add } -- diff mode: Added line |diff.txt|
      p["GitSignsAddNr"] = { fg = colors.diff_add } -- diff mode: Added line |diff.txt|
      p["GitSignsAddLn"] = { fg = colors.diff_add } -- diff mode: Added line |diff.txt|
      p["GitSignsChange"] = { fg = colors.diff_change } -- diff mode: Changed line |diff.txt|
      p["GitSignsChangeNr"] = { fg = colors.diff_change } -- diff mode: Changed line |diff.txt|
      p["GitSignsChangeLn"] = { fg = colors.diff_change } -- diff mode: Changed line |diff.txt|
      p["GitSignsDelete"] = { fg = colors.diff_remove } -- diff mode: Deleted line |diff.txt|
      p["GitSignsDeleteNr"] = { fg = colors.diff_remove } -- diff mode: Deleted line |diff.txt|
      p["GitSignsDeleteLn"] = { fg = colors.diff_remove } -- diff mode: Deleted line |diff.txt|
    end
    if config.plugins.telescope then
      p["TelescopeNormal"] = { fg = colors.fg, bg = colors.bg }
      p["TelescopePromptPrefix"] = { fg = colors.light_green }
      p["TelescopePromptCounter"] = { fg = colors.dark_gray }
      p["TelescopePromptBorder"] = { fg = colors.gray, bg = colors.bg }
      p["TelescopeResultsBorder"] = { fg = colors.gray, bg = colors.bg }
      p["TelescopePreviewBorder"] = { fg = colors.gray, bg = colors.bg }
      p["TelescopeSelectionCaret"] = { fg = colors.cyan, bg = colors.selection }
      p["TelescopeSelection"] = { bg = colors.selection }
      p["TelescopeMultiIcon"] = { fg = colors.green }
      p["TelescopeMatching"] = { fg = colors.pink }
    end
    if config.plugins.nvimtree then
      p["NvimTreeSymlink"] = { fg = colors.cyan, style = "bold" }
      p["NvimTreeRootFolder"] = { fg = colors.green, style = "bold" }
      p["NvimTreeFolderName"] = { fg = colors.blue }
      p["NvimTreeFolderIcon"] = { fg = colors.dark_blue }
      p["NvimTreeEmptyFolderName"] = { fg = colors.light_gray }
      p["NvimTreeOpenedFolderName"] = { fg = colors.yellow, style = "italic" }
      p["NvimTreeIndentMarker"] = { fg = colors.blue }
      p["NvimTreeGitDirty"] = { fg = colors.yellow }
      p["NvimTreeGitNew"] = { fg = colors.diff_add }
      p["NvimTreeGitStaged"] = { fg = colors.purple }
      p["NvimTreeGitDeleted"] = { fg = colors.diff_remove }
      p["NvimTreeExecFile"] = { fg = colors.green, style = "bold" }
      p["NvimTreeOpenedFile"] = { fg = colors.none }
      p["NvimTreeSpecialFile"] = { fg = colors.orange, style = "underline" }
      p["NvimTreeImageFile"] = { fg = colors.purple, style = "bold" }
      p["NvimTreeNormal"] = { fg = colors.fg, bg = colors.active }
      p["NvimTreeCursorLine"] = { bg = colors.float }
      p["NvimTreeVertSplit"] = { fg = colors.active, bg = colors.active }
      p["LspDiagnosticsError"] = { fg = colors.error }
      p["LspDiagnosticsWarning"] = { fg = colors.warn }
      p["LspDiagnosticsInformation"] = { fg = colors.info }
      p["LspDiagnosticsHint"] = { fg = colors.hint }
    end
    if config.plugins.whichkey then
      p["WhichKey"] = { fg = colors.purple, style = "bold" }
      p["WhichKeyGroup"] = { fg = colors.cyan }
      p["WhichKeyDesc"] = { fg = colors.blue, style = "italic" }
      p["WhichKeySeperator"] = { fg = colors.green }
      p["WhichKeyFloat"] = { bg = colors.active }
    end
    if config.plugins.lspsaga then
      p["LspFloatWinNormal"] = { fg = colors.fg, bg = colors.bg }
      p["LspFloatWinBorder"] = { fg = colors.purple }
      p["DiagnosticError"] = { fg = colors.error }
      p["DiagnosticWarning"] = { fg = colors.warn }
      p["DiagnosticInformation"] = { fg = colors.info }
      p["DiagnosticHint"] = { fg = colors.hint }
      p["LspSagaDiagnosticBorder"] = { fg = colors.gray }
      p["LspSagaDiagnosticHeader"] = { fg = colors.blue }
      p["LspSagaDiagnosticTruncateLine"] = { fg = colors.highlight }
      p["ProviderTruncateLine"] = { fg = colors.highlight }
      p["LspSagaShTruncateLine"] = { fg = colors.highlight }
      p["LspSagaDocTruncateLine"] = { fg = colors.highlight }
      p["LineDiagTruncateLine"] = { fg = colors.highlight }
      p["LspSagaBorderTitle"] = { fg = colors.cyan }
      p["LspSagaHoverBorder"] = { fg = colors.blue }
      p["LspSagaRenameBorder"] = { fg = colors.green }
      p["LspSagaDefPreviewBorder"] = { fg = colors.green }
      p["LspSagaCodeActionTitle"] = { fg = colors.blue }
      p["LspSagaCodeActionContent"] = { fg = colors.purple }
      p["LspSagaCodeActionBorder"] = { fg = colors.blue }
      p["LspSagaCodeActionTruncateLine"] = { fg = colors.highlight }
      p["LspSagaSignatureHelpBorder"] = { fg = colors.light_red }
      p["LspSagaFinderSelection"] = { fg = colors.green }
      p["LspSagaAutoPreview"] = { fg = colors.red }
      p["ReferencesCount"] = { fg = colors.purple }
      p["DefinitionCount"] = { fg = colors.purple }
      p["DefinitionPreviewTitle"] = { fg = colors.green }
      p["DefinitionIcon"] = { fg = colors.blue }
      p["ReferencesIcon"] = { fg = colors.blue }
      p["TargetWord"] = { fg = colors.cyan }
    end
    if config.plugins.bufferline then
      p["BufferLineIndicatorSelected"] = { fg = colors.yellow }
      p["BufferLineFill"] = { bg = colors.bg }
    end
    if config.plugins.treesitter_context then
      p["TreesitterContext"] = { fg = colors.none, bg = colors.active }
    end
    if config.plugins.barbar then
      p["BufferCurrent"] = { fg = colors.fg, bg = colors.bg }
      p["BufferCurrentIndex"] = { fg = colors.fg, bg = colors.bg }
      p["BufferCurrentMod"] = { fg = colors.yellow, bg = colors.bg, style = "bold" }
      p["BufferCurrentSign"] = { fg = colors.cyan, bg = colors.bg }
      p["BufferCurrentTarget"] = { fg = colors.red, bg = colors.bg, style = "bold" }
      p["BufferVisible"] = { fg = colors.fg, bg = colors.bg }
      p["BufferVisibleIndex"] = { fg = colors.fg, bg = colors.bg }
      p["BufferVisibleMod"] = { fg = colors.yellow, bg = colors.bg, style = "bold" }
      p["BufferVisibleSign"] = { fg = colors.light_gray, bg = colors.bg }
      p["BufferVisibleTarget"] = { fg = colors.red, bg = colors.bg, style = "bold" }
      p["BufferInactive"] = { fg = colors.light_gray, bg = colors.active }
      p["BufferInactiveIndex"] = { fg = colors.light_gray, bg = colors.active }
      p["BufferInactiveMod"] = { fg = colors.yellow, bg = colors.active }
      p["BufferInactiveSign"] = { fg = colors.light_gray, bg = colors.active }
      p["BufferInactiveTarget"] = { fg = colors.red, bg = colors.active, style = "bold" }
    end
    if config.plugins.sneak then
      p["Sneak"] = { fg = colors.bg, bg = colors.fg }
      p["SneakScope"] = { bg = colors.selection }
    end
    if config.plugins.indent_blankline then
      p["IndentBlanklineChar"] = { fg = colors.selection, style = "nocombine" }
      p["IndentBlanklineContextChar"] = { fg = colors.purple, style = "nocombine" }
    end
    if config.plugins.dap then
      p["DapBreakpoint"] = { fg = colors.red }
      p["DapStopped"] = { fg = colors.green }
    end
    if config.plugins.illuminate then
      p["illuminatedWord"] = { bg = colors.highlight }
      p["illuminatedCurWord"] = { bg = colors.highlight }
    end
    if config.plugins.hop then
      p["HopNextKey"] = { fg = colors.fg_light, style = "bold" }
      p["HopNextKey1"] = { fg = colors.cyan, style = "bold" }
      p["HopNextKey2"] = { fg = colors.purple }
      p["HopUnmatched"] = { fg = colors.light_gray }
    end
    if config.plugins.fern then
      p["FernBranchText"] = { fg = colors.blue }
    end
    if config.plugins.lightspeed then
      p["LightspeedLabel"] = { fg = colors.pink, style = "bold,underline" }
      p["LightspeedLabelOverlapped"] = { fg = colors.dark_pink, style = "underline" }
      p["LightspeedLabelDistant"] = { fg = colors.cyan, style = "bold,underline" }
      p["LightspeedLabelDistantOverlapped"] = { fg = colors.blue, style = "underline" }
      p["LightspeedShortcut"] = { fg = "#E5E9F0", bg = colors.pink, style = "bold,underline" }
      p["LightspeedMaskedChar"] = { fg = colors.light_purple }
      p["LightspeedGreyWash"] = { fg = colors.gray }
      p["LightspeedUnlabeledMatch"] = { fg = colors.fg_light, style = "bold" }
      p["LightspeedOneCharMatch"] = { fg = colors.yellow, style = "bold,reverse" }
    end
    if config.plugins.navic then
      p["NavicIconsFile"] = { bg = colors.active, fg = colors.blue }
      p["NavicIconsModule"] = { bg = colors.active, fg = colors.blue }
      p["NavicIconsNamespace"] = { bg = colors.active, fg = colors.yellow }
      p["NavicIconsPackage"] = { bg = colors.active, fg = colors.orange }
      p["NavicIconsClass"] = { bg = colors.active, fg = colors.yellow }
      p["NavicIconsMethod"] = { bg = colors.active, fg = colors.purple }
      p["NavicIconsProperty"] = { bg = colors.active, fg = colors.blue }
      p["NavicIconsField"] = { bg = colors.active, fg = colors.blue }
      p["NavicIconsConstructor"] = { bg = colors.active, fg = colors.yellow }
      p["NavicIconsEnum"] = { bg = colors.active, fg = colors.yellow }
      p["NavicIconsInterface"] = { bg = colors.active, fg = colors.yellow }
      p["NavicIconsFunction"] = { bg = colors.active, fg = colors.purple }
      p["NavicIconsVariable"] = { bg = colors.active, fg = colors.blue }
      p["NavicIconsConstant"] = { bg = colors.active, fg = colors.orange }
      p["NavicIconsString"] = { bg = colors.active, fg = colors.green }
      p["NavicIconsNumber"] = { bg = colors.active, fg = colors.orange }
      p["NavicIconsBoolean"] = { bg = colors.active, fg = colors.orange }
      p["NavicIconsArray"] = { bg = colors.active, fg = colors.yellow }
      p["NavicIconsObject"] = { bg = colors.active, fg = colors.orange }
      p["NavicIconsKey"] = { bg = colors.active, fg = colors.purple }
      p["NavicIconsNull"] = { bg = colors.active, fg = colors.red }
      p["NavicIconsEnumMember"] = { bg = colors.active, fg = colors.cyan }
      p["NavicIconsStruct"] = { bg = colors.active, fg = colors.yellow }
      p["NavicIconsEvent"] = { bg = colors.active, fg = colors.purple }
      p["NavicIconsOperator"] = { bg = colors.active, fg = colors.purple }
      p["NavicIconsTypeParameter"] = { bg = colors.active, fg = colors.yellow }
      p["NavicText"] = { bg = colors.active, fg = colors.fg }
      p["NavicSeparator"] = { bg = colors.active, fg = colors.cyan }
    end

    -- Disable nvim-tree background
    if config.disable.background and config.plugins.nvimtree then
      remove_background(p.NvimTreeNormal)
    end

    return p
  end

  function theme.load_terminal()
    -- dark
    vim.g.terminal_color_0 = colors.float
    vim.g.terminal_color_8 = colors.selection

    -- light
    vim.g.terminal_color_7 = colors.fg
    vim.g.terminal_color_15 = colors.fg_light

    -- colors
    vim.g.terminal_color_1 = colors.red
    vim.g.terminal_color_9 = colors.red

    vim.g.terminal_color_2 = colors.green
    vim.g.terminal_color_10 = colors.green

    vim.g.terminal_color_3 = colors.olive
    vim.g.terminal_color_11 = colors.olive

    vim.g.terminal_color_4 = colors.blue
    vim.g.terminal_color_12 = colors.blue

    vim.g.terminal_color_5 = colors.purple
    vim.g.terminal_color_13 = colors.purple

    vim.g.terminal_color_6 = colors.cyan
    vim.g.terminal_color_14 = colors.cyan
  end

  return vim.tbl_deep_extend("error", load_syntax(), load_editor(), load_treesitter(), load_lsp(), load_plugins())
end

return theme
