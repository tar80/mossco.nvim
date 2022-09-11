-- Refresh cache for local debugging and development purposes
if vim.g.mossco_debug == true then
  package.loaded["mossco"] = nil
  package.loaded["mossco.util"] = nil
  package.loaded["mossco.theme"] = nil
  package.loaded["mossco.colors"] = nil
  package.loaded["mossco.colors.fresh"] = nil
  package.loaded["mossco.colors.stale"] = nil
  package.loaded["feline.themes.mossco"] = nil
end

local mossco = require("mossco")

mossco.load(false)
