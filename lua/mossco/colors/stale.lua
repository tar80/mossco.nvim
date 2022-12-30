local colors = {
  fg =           "#A2A6A4",
  fg_light =     "#CBCECD",
  bg =           "#001610",
  dark_gray =    "#5F6365",
  gray =         "#737B80",
  dark_cyan =    "#698B8D",
  cyan =         "#83B1B0",
  dark_blue =    "#3A567E",
  blue =         "#6186A3",
  dark_green =   "#396242",
  green =        "#7B956C",
  light_green =  "#61A85E",
  dark_red =     "#793F47",
  red =          "#AA6469",
  light_red =    "#BB4244",
  dark_pink =    "#823254",
  pink =         "#BB6585",
  dark_orange =  "#653F32",
  orange =       "#B3795C",
  dark_olive =   "#7C6148",
  olive =        "#AA9765",
  dark_purple =  "#604174",
  purple =       "#8A6CA0",
  none = "NONE",
}

-- more semantically meaningful colors
colors.error = colors.pink
colors.warn = colors.olive
colors.info = colors.blue
colors.hint = colors.purple

colors.diff_add = colors.blue
colors.diff_add_bg = "#0E2132"
colors.diff_change = colors.green
colors.diff_change_bg = "#0C271B"
colors.diff_remove = colors.red
colors.diff_remove_bg = "#251824"
colors.diff_text_bg = "#1A4E3B"

colors.active = "#11384D"
colors.float = "#134046"
colors.highlight = "#0e2a2f"
colors.border = "#173334"
colors.selection = "#225867"
-- colors.active = "#103241"
-- colors.float = "#11393C"
-- colors.highlight = "#0E272A"
-- colors.border = "#152E2E"
-- colors.selection = "#1D4B56"

return colors
