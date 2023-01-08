local theme = require("mossco.theme")

local util = {}

-- Highlight the given group according to the color values
function util.highlight(group, colors)
  local hl = {}

  if colors.fg then
    hl["fg"] = colors.fg
  end
  if colors.bg then
    hl["bg"] = colors.bg
  end
  if colors.sp then
    hl["sp"] = colors.sp
  end
  if colors.style and colors.style ~= "NONE" then
    for i in string.gmatch(colors.style, "[^,]+") do
      hl[i] = true
    end
  end
  if colors.link then
    hl["link"] = colors.link
  end

  vim.api.nvim_set_hl(0, group, hl)
end

-- Load the theme
function util.load(colors, exec_autocmd)
  local config = require("mossco.config").options

  if vim.g.colors_name then
    vim.api.nvim_command("highlight clear")
  end

  if vim.fn.exists("syntax_on") then
    vim.api.nvim_command("syntax reset")
  end

  vim.o.termguicolors = true
  vim.g.colors_name = "mossco"

  -- Load highlights
  local highlights = vim.tbl_extend("force", theme.highlights(colors, config), config.custom_highlights)

  for group, color in pairs(highlights) do
    util.highlight(group, color)
  end

  theme.load_terminal()

  if exec_autocmd then
    vim.api.nvim_command("doautocmd ColorScheme")

    if vim.g.fade_no_bg then
      vim.api.nvim_command("hi Normal guibg=NONE")
      vim.api.nvim_command("hi LineNr guibg=NONE")
      vim.api.nvim_command("hi SignColumn guibg=NONE")
      vim.api.nvim_del_var("fade_no_bg")
    end
  end
end

return util
