local colors = {
  fg =          "#A2A6A4",
  fg_light =    "#CBCECD",
  bg =          "#001B1B",
  bg_light =    "#002222",
  dark_gray =   "#5F6365",
  gray =        "#818584",
  dark_cyan =   "#698B8D",
  cyan =        "#83B1B0",
  dark_blue =   "#3A567E",
  blue =        "#6186A3",
  dark_green =  "#396242",
  green =       "#7B956C",
  light_green = "#5BA46D",
  dark_red =    "#793F47",
  red =         "#AA6469",
  light_red =   "#BB4244",
  dark_pink =   "#823254",
  pink =        "#BB6585",
  dark_orange = "#653F32",
  orange =      "#B3795C",
  dark_olive =  "#7C6148",
  olive =       "#AA9765",
  dark_purple = "#604174",
  purple =      "#8A6CA0",
  none = "NONE",
}

-- more semantically meaningful colors
colors.error = colors.pink
colors.warn = colors.olive
colors.info = colors.blue
colors.hint = colors.purple

colors.diff_add = "#5A8B8D"
colors.diff_add_bg = "#072932"
colors.diff_change = "#558A78"
colors.diff_change_bg = "#0A2C25"
colors.diff_remove = "#A07A8E"
colors.diff_remove_bg = "#2F1627"
colors.diff_text_bg = "#175242"

colors.active = "#11384D"
colors.highlight = "#134046"
colors.float = "#0e2a2f"
colors.border = "#173334"
colors.selection = "#225867"

return colors
