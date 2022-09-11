local config = require("mossco.config")
local util = require("mossco.util")

local mossco = {}

function mossco.setup(options)
  config.set_options(options)
  mossco.load(true)
end

function mossco.load(exec_autocmd)
  local colors = require("mossco.colors").load()
  util.load(colors, exec_autocmd)
end

return mossco
