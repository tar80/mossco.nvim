local config = {}

local defaults = {
  theme = "fresh", -- "fresh" or "stale"
  borders = true, -- Split window borders
  fade_nc = false, -- Fade non-current windows, making them more distinguishable
  fade_no_bg = false, -- Enables fade_nc and makes the current background transparent
  -- Style that is applied to various groups: see `highlight-args` for options
  styles = {
    comments = "NONE",
    strings = "NONE",
    keywords = "NONE",
    functions = "NONE",
    variables = "NONE",
    diagnostics = "underline",
    references = "underline",
  },
  disable = {
    background = false, -- Disable setting the background color. This is override fade_nc
    cursorline = false, -- Disable the cursorline
    eob_lines = false, -- Hide the end-of-buffer lines
  },
  -- Overwrite default highlight groups
  custom_highlights = {},
  plugins = {
    lsp = true,
    treesitter = false,
    agit = false,
    confilct_marker = false,
    eft = false,
    gina = false,
    fuzzy_motion = false,
    cmp = false,
    skkeleton_indicator = false,
    sandwich = false,
    dashboard = false,
    notify = false,
    trouble = false,
    diff = false,
    neogit = false,
    gitgutter = false,
    gitsigns = false,
    telescope = false,
    nvimtree = false,
    whichkey = false,
    lspsaga = false,
    bufferline = false,
    treesitter_context = false,
    barbar = false,
    sneak = false,
    indent_blankline = false,
    dap = false,
    illuminate = false,
    hop = false,
    fern = false,
    lightspeed = false,
    navic = false,
  },
}

config.options = {}

function config.set_options(opts)
  config.options = vim.tbl_deep_extend("force", config.options, opts or {})
end

config.set_options(defaults)

return config
