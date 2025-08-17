local util = require("tairiki.util")
-- stylua: ignore start
local M = {
  -- bg          = "#151515",
  -- bg          = "#282c34",
  fg          = "#c5c8c6",
  bg          = "#1c1c1c",
  fg1            = "#dcd7ba",
  bg1            = "#223249",
  --fg          = "#eeeeee",

  -- bg_light    = "#1d1f21",
  bg_light    = "#282c34",
  bg_light2   = "#282828",
  bg_light3   = "#3b3f4c",
  fg_dark     = "#afb2b0",
  fg_dark2    = "#969896",
  fg_dark3    = "#696969",

  purple      = "#b294bb",
  green       = "#b5bd68",
  orange      = "#de935f",
  blue        = "#81a2be",
  yellow      = '#ffe6a7',
  cyan        = "#7eada7",
  red         = "#cc6666",
  comment     = "#8a8a8a",
  comment2    = "#a89984",
  none        = "none",


  normal_blue   = '#4682B4',
  normal_green  = '#98c379',
  normal_yellow = '#ffff00',

  light_red         = '#d78787',
  light_brown       = '#d7af87',
 -- let s:light_green       = ['#afd787', 150 ]
  light_yellow  = '#ffffaf',
  light_green   = '#b5e8a9',
  -- light_orange  = "#e78c45",
  light_orange      = '#ffaf00',
  light_aqua        = '#87d7d7',
  --light_purple  = "#c397d8",
  light_blue    = '#87afd7';
  light_purple  = '#af5f87',

  medium_purple = '#9370DB',

    --Bright colors
  bright_red        = '#fb4934',
  bright_green      = '#afff00',
  bright_blue       = '#005fff',
  bright_aqua       = '#87ffaf',
  bright_orange     = '#fe8019',
  bright_yellow     = '#fabd2f',
  bright_purple     = '#d3869b',

  light_teal    = '#2eb297',
  pastel_green  = '#7aa89f',
  teal        = '#008080';
}

function M.regen_sub_groups(self)
  self.diag = {
    error = self.red,
    info  = self.cyan,
    warn  = self.yellow,
    hint  = self.purple,
    ok    = self.green,
  }
  self.diff = {
    add    = util.blend(self.green, self.bg, 0.3),
    remove = util.blend(self.red, self.bg, 0.1),
    change = util.blend(self.fg_dark3, self.bg, 0.3),
    text   = util.blend(self.blue, self.bg, 0.4),
  }
  self.syn = {
    module      = self.pastel_green,
    ident       = self.fg,
    constant    = self.none,
    literal     = self.none,
    func        = self.green, --self.light_green,
    string      = self.yellow,
    type        = self.light_blue,
    keyword     = self.red,
    special     = self.red,
    delim       = self.fg_dark3,
    exception   = self.none,
    operator    = self.fg_dark,
    number      = self.light_red,
    keyword_mod = self.normal_green,
    macro       = self.normal_green, -- "#5fd75f",
    enum        = self.purple,
  }

  self.terminal = {
    black         = util.lighten(self.bg_light3, 0.95),
    bright_black  = self.fg_dark3,
    red           = util.darken(self.red, 0.85),
    bright_red    = self.red,
    green         = util.darken(self.green, 0.85),
    bright_green  = self.green,
    yellow        = util.darken(self.yellow, 0.85),
    bright_yellow = self.yellow,
    blue          = util.darken(self.blue, 0.85),
    bright_blue   = self.blue,
    purple        = util.darken(self.purple, 0.85),
    bright_purple = self.purple,
    cyan          = util.darken(self.cyan, 0.85),
    bright_cyan   = self.cyan,
    white         = self.fg,
    bright_white  = util.lighten(self.fg, 0.85),
  }

  self.highlights = {
    -- LspKindEnumMember = "@lsp.type.enumMember",

    -- Directory         = { fg = self.light_blue },
    -- FloatTitle        = "Title",
    FoldColumn        = { fg = self.fg_dark, bg = self.bg_light },
    Identifier        = { fg = self.red },
    Ignore            = "Normal",
    Label             = { fg = self.light_orange },
    SpecialKey        = { fg = self.fg_dark3 },
    Statement         = { fg = self.light_green},
    StatusLine        = { fg = self.fg_dark2, bg = self.bg_light },
    StatusLineNC      = { fg = self.fg_dark3, bg = self.bg_light2 },
    StatusLineTerm    = { fg = self.fg_dark2, bg = self.bg_light2 },
    StatusLineTermNC  = { fg = self.fg_dark3, bg = self.bg_light2 },

    -- xxx guifg=#dcd7ba guibg=#223249
    -- Type              = { fg = self.pastel_green };
    -- StorageClass     = { fg = self.blue },
    -- cStorageClass     = { fg = self.blue },

    -- Macro = { fg = '#5fd75f' },
    -- Include          = { fg = self.normal_green },
    -- PreCondit = { fg = self.normal_green },

    Boolean = {fg = self.blue},
    cConditional = { fg = self.red },
    cStatement        = { fg = self.red},
    cppExceptions = { fg = self.red },

    cParen = { fg = self.fg_dark3 },
    cBlock = { fg = self.fg_dark3 },
    -- cType = { fg = self.light_blue },
    -- cppType = { fg = self.light_blue },

    TelescopeMatching = { fg = self.orange },
    TelescopePromptPrefix = { fg = self.fg_dark2 },
    TelescopeSelection = { fg = self.fg, bg = self.bg_light2, bold = true },
    TelescopeSelectionCaret = { fg = self.light_orange, bg = self.bg_light2 },
    TelescopeMultiIcon = { fg = self.red },
    TelescopeTitle = { fg = self.orange },

    DiffChange = {
      bg = "#1f2231"
    },
    DiffDelete = {
      bg = "#37222c"
    },
    DiffText = {
      bg = "#394b70"
    },

    ["@module.cpp"]                               = { fg = self.syn.module },

    ["@constant"]                                 = {},
    ["@constant.cpp"]                             = {},
    ["@constant.macro.cpp"]                       = "Macro",
    ["@constant.builtin.cpp"]                     = "Macro",
    ["@constructor"]                              = {},

    ["@function.cpp"]                             = "Function", --{ fg = self.syn.func},
    -- ["@function.method.call.cpp"]                 = { fg = self.normal_blue },
    ["@function.call.cpp"]                        = "@function.cpp",
    ["@function.method.call.cpp"]                 = "@function.cpp",

    ["@type.builtin.cpp"]                         = { fg = self.syn.type },
    ["@lsp.type.type"]                            = "@type.builtin.cpp",

    ["@lsp.type.function"]                        = "Function",
    ["@lsp.type.method"]                          = "Function",

    ["@lsp.type.namespace"]                       = "@module.cpp",

    ["@lsp.type.enumMember.cpp"]                  = { fg = self.purple },
    ["@lsp.typemod.enumMember.globalScope.cpp"]   = "@lsp.type.enumMember.cpp",
    ["@lsp.typemod.enumMember.readonly.cpp"]      = "@lsp.type.enumMember.cpp",

--[[
    ["@keyword"] = {
      fg = "#9d7cd8",
      italic = true
    },
]]--

    ["@keyword"]                    = { fg = self.syn.keyword },
    ["@keyword.cpp"]                = { fg = self.syn.keyword },
    ["@keyword.operator.cpp"]       = { fg = self.syn.keyword },
    ["@keyword.exception.cpp"]      = { fg = self.syn.keyword },
    ["@keyword.return.cpp"]         = { fg = self.syn.keyword },

    ["@keyword.type.cpp"]           = { fg = self.light_teal },
    ["@keyword.modifier.cpp"]       = "@module.cpp",
    ["@keyword.import.cpp"]         = { fg = self.syn.keyword_mod },
    ["@property.yaml"]              = { fg = "#007F87"},
    ["@string.yaml"]                = { fg = "#9B2D30"},

--[[
    ["@module"] = { fg = self.teal },
--    ["@module"]                = { fg = util.lighten(self.fg, 0.7, self.blue) },

    -- treesitter
    ["@attribute.builtin"]     = { fg = self.red },
    ["@attribute.typescript"]  = { fg = self.blue },
    -- ["@function.macro"]        = "Macro",
    -- ["@keyword.coroutine"]     = { fg = self.syn.keyword_mod },
    -- ["@keyword.exception"]     = { fg = self.syn.exception },
    -- ["@keyword.function"]      = { fg = self.syn.keyword_mod },
    -- ["@keyword.operator"]      = { fg = self.syn.keyword_mod },

    ["@markup.italic"]         = { fg = self.light_orange, italic = true },
    ["@markup.strong"]         = { fg = self.light_orange, bold = true },
    ["@markup.link.url"]       = { fg = self.blue },
    ["@markup.list"]           = "Special",
    ["@markup.math"]           = { fg = self.blue },
    ["@markup.quote"]          = { fg = self.fg_dark2 },
    ["@markup.raw.block"]      = { fg = self.fg_dark2 },
    ["@string.escape"]         = { fg = self.red },
    ["@string.regexp"]         = { fg = self.orange },
    ["@string.special.url"]    = { fg = self.blue, underline = true },
    ["@string.special.vimdoc"] = { fg = self.light_orange },
    ["@tag"]                   = { fg = self.red },
    ["@tag.attribute"]         = { fg = self.orange },
    ["@tag.builtin"]           = "Special",
    ["@tag.delimiter"]         = { fg = self.fg_dark2 },
    ["@type.builtin"]          = { fg = self.light_orange },
    ["@type.tag.css"]          = { fg = self.orange },

    ["@label.markdown"]          = "Tag",
    ["@label.vimdoc"]            = { fg = self.light_purple },
    ["@keyword.gitcommit"]       = { fg = self.blue },
    ["@namespace.vim"]           = { fg = self.orange },
    ["@punctuation.bracket.css"] = { fg = self.fg_dark2 },

    -- LSP

    ["@annotation"] = "PreProc",
    ["@attribute"] = "PreProc",
    ["@boolean"] = "Boolean",
    ["@character"] = "Character",
    -- ["@character.printf"] = "SpecialChar",
    ["@character.printf"] = "Function",
    ["@character.special"] = "SpecialChar",
    ["@comment"] = "Comment",
    ["@comment.error"] = {
      fg = "#db4b4b"
    },
    ["@comment.hint"] = {
      fg = "#1abc9c"
    },
    ["@comment.info"] = {
      fg = "#0db9d7"
    },
    ["@comment.note"] = {
      fg = "#1abc9c"
    },
    ["@comment.todo"] = {
      fg = "#7aa2f7"
    },
    ["@comment.warning"] = {
      fg = "#e0af68"
    },
    ["@constant.builtin"] = "Special",
    ["@constant.macro"] = "Define",
    ["@constructor"] = {
      fg = "#bb9af7"
    },
    ["@constructor.tsx"] = {
      fg = "#2ac3de"
    },
    ["@diff.delta"] = "DiffChange",
    ["@diff.minus"] = "DiffDelete",
    ["@diff.plus"] = "DiffAdd",
    ["@function"] = "Function",
    ["@function.builtin"] = "Special",
    ["@function.call"] = "@function",
    ["@function.macro"] = "Function",
    ["@function.method"] = "Function",
    ["@function.method.call"] = "@function.method",
    ["@keyword"] = {
      fg = "#9d7cd8",
      italic = true
    },
    ["@keyword.conditional"] = "Conditional",
    ["@keyword.coroutine"] = "@keyword",
    ["@keyword.debug"] = "Debug",
    ["@keyword.directive"] = "PreProc",
    ["@keyword.directive.define"] = "Define",
    ["@keyword.exception"] = "Exception",
    ["@keyword.function"] = "Function",
    ["@keyword.import"] = "Include",
    ["@keyword.operator"] = "@operator",
    ["@keyword.repeat"] = "Repeat",
    ["@keyword.return"] = "@keyword",
    ["@keyword.auto"] = "@cppType",
    ["@keyword.storage"] = "StorageClass",
    ["@label"] = {
      fg = "#7aa2f7"
    },
    ["@lsp.type.boolean"] = "@boolean",
    ["@lsp.type.builtinType"] = "@type.builtin",
    ["@lsp.type.comment"] = "@comment",
    ["@lsp.type.decorator"] = "@attribute",
    ["@lsp.type.deriveHelper"] = "@attribute",
    ["@lsp.type.enum"] = "@type",
    ["@lsp.type.enumMember"] = "@constant",
    ["@lsp.type.escapeSequence"] = "@string.escape",
    ["@lsp.type.formatSpecifier"] = "@markup.list",
    ["@lsp.type.generic"] = "@variable",
    ["@lsp.type.interface"] = {
      fg = "#57c5e5"
    },
    ["@lsp.type.keyword"] = "@keyword",
    ["@lsp.type.lifetime"] = "@keyword.storage",
    ["@lsp.type.namespace"] = "@module",
    ["@lsp.type.namespace.python"] = "@variable",
    ["@lsp.type.number"] = "@number",
    ["@lsp.type.operator"] = "@operator",
    ["@lsp.type.parameter"] = "@variable.parameter",
    ["@lsp.type.property"] = "@property",
    ["@lsp.type.selfKeyword"] = "@variable.builtin",
    ["@lsp.type.selfTypeKeyword"] = "@variable.builtin",
    ["@lsp.type.string"] = "@string",
    ["@lsp.type.typeAlias"] = "@type.definition",
    ["@lsp.type.unresolvedReference"] = {
      sp = "#db4b4b",
      undercurl = true
    },
    ["@lsp.type.variable"] = {},
    ["@lsp.typemod.class.defaultLibrary"] = "@type.builtin",
    ["@lsp.typemod.enum.defaultLibrary"] = "@type.builtin",
    ["@lsp.typemod.enumMember.defaultLibrary"] = "@constant.builtin",
    ["@lsp.typemod.function.defaultLibrary"] = "@function.builtin",
    ["@lsp.typemod.keyword.async"] = "@keyword.coroutine",
    ["@lsp.typemod.keyword.injected"] = "@keyword",
    ["@lsp.typemod.macro.defaultLibrary"] = "@function.builtin",
    ["@lsp.typemod.method.defaultLibrary"] = "@function.builtin",
    ["@lsp.typemod.operator.injected"] = "@operator",
    ["@lsp.typemod.string.injected"] = "@string",
    ["@lsp.typemod.struct.defaultLibrary"] = "@type.builtin",
    ["@lsp.typemod.type.defaultLibrary"] = {
      fg = "#27a1b9"
    },
    ["@lsp.typemod.typeAlias.defaultLibrary"] = {
      fg = "#27a1b9"
    },
    ["@lsp.typemod.variable.callable"] = "@function",
    ["@lsp.typemod.variable.defaultLibrary"] = "@variable.builtin",
    ["@lsp.typemod.variable.injected"] = "@variable",
    ["@lsp.typemod.variable.static"] = "@constant",
    ]]--

  }
end
-- stylua: ignore end

M:regen_sub_groups()

return M
