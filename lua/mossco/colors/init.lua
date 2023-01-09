local function load()
  local theme = require("mossco.config").options.theme
  local themes = { "fresh", "stale", "decay" }

  if not vim.tbl_contains(themes, theme) then
    theme = "fresh"
  end

  return require("mossco.colors." .. theme)
end

return { load = load }
