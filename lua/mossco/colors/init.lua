local fresh = require("mossco.colors.fresh")
local stale = require("mossco.colors.stale")

local function load()
  local theme = require("mossco.config").options.theme

  if not theme then
    theme = "fresh"
  end

  return theme ~= "fresh" and stale or fresh
end

return { load = load }
