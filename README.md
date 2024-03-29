# mossco.nvim

The mossco is my personal ColorScheme for Neovim.  
It is based on the [onenord](https://github.com/rmehri01/onenord.nvim),
and optimized for mossy green background.

## Features

- `custom_colors` feature has been removed
- `lualine` theme has been removed
- Selective plugin-specific highlighting
- Optimization of highlighting process

### Plugin Support

Plugins supports provided by onenord. And,

- [Agit](https://github.com/cohama/agit.vim)
- [Conflict-marker](https://github.com/rhysd/conflict-marker.vim)
- [Fuzzy Motion](https://github.com/yuki-yano/fuzzy-motion.vim)
- [Feline](https://github.com/feline-nvim/feline.nvim)
- [Gina](https://github.com/lambdalisue/gina.vim)
- [Vim-eft](https://github.com/hrsh7th/vim-eft)
- [Fret](https://github.com/tar80/fret.nvim)
- [Skkeleton_indicator](https://github.com/delphinus/skkeleton_indicator.nvim)
- [vim-sandwich](https://github.com/machakann/vim-sandwich)

## Configuration

This is an example of setup with the default values.  
Set the values you want to change from the default values.

```lua
require("mossco").setup({
    theme = "fresh", -- "fresh" or "stale" and "decay" can be selected. Default is "fresh"
    borders = true, -- Split window border color
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
        references = "underline"
    },
    disable = {
        background = false, -- Disable setting the background color
        cursorline = false, -- Disable the cursorline
        eob_lines = false -- Hide the end-of-buffer lines
    },
    -- Overwrite default highlight groups. Follow nvim_set_hl()
    -- Example: highlight_group = {fg = "white", bg = "black", style = "underline"}
    custom_highlights = {},
    plugins = {
        lsp = true,
        treesitter = false,
        treesitter_context = false,
        agit = false,
        confilct_marker = false,
        eft = false,
        fret = false,
        gina = false,
        fuzzy_motion = false,
        skkeleton_indicator = false,
        sandwich = false,
        cmp = false,
        dashboard = false,
        notify = false,
        trouble = false,
        neogit = false,
        gitgutter = false,
        gitsigns = false,
        telescope = false,
        nvimtree = false,
        whichkey = false,
        lspsaga = false,
        bufferline = false,
        barbar = false,
        sneak = false,
        indent_blankline = false,
        dap = false,
        illuminate = false,
        hop = false,
        fern = false,
        lightspeed = false,
        navic = false
    }
})
```

If you want to apply the Mossco theme to Feline.  

```lua
local colors = require("feline.themes.mossco")

require("feline").setup({
  theme = colors.theme,
  vi_mode_colors = colors.vi_mode,
})
```

## Credit

The mossco created based on onenord. Click here to check it out!

- [rmehri01/onenord.nvim](https://github.com/rmehri01/onenord.nvim)
