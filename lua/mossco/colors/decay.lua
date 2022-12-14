local colors = {
  fg =          "#BCBFBE",
  fg_light =    "#D2D4D3",
  bg =          "#001B1B",
  bg_light =    "#002222",
  dark_gray =   "#777B7B",
  gray =        "#939796",
  dark_cyan =   "#77949A",
  cyan =        "#92C6CE",
  dark_blue =   "#718096",
  blue =        "#97ABC8",
  dark_green =  "#7D8B7C",
  green =       "#91A889",
  light_green = "#A2C3A2",
  dark_red =    "#93646B",
  red =         "#CD7B8F",
  light_red =   "#F37F9E",
  dark_pink =   "#B07E8D",
  pink =        "#DBA1AE",
  dark_orange = "#977361",
  orange =      "#DCA47F",
  dark_olive =  "#918369",
  olive =       "#D0C097",
  dark_purple = "#896F91",
  purple =      "#C487C8",
  none = "NONE",
}

-- more semantically meaningful colors
colors.error = colors.pink
colors.warn = colors.olive
colors.info = colors.blue
colors.hint = colors.purple

colors.diff_add = colors.blue
colors.diff_add_bg = "#072932"
colors.diff_change = colors.green
colors.diff_change_bg = "#0A2C25"
colors.diff_remove = colors.red
colors.diff_remove_bg = "#2F1627"
colors.diff_text_bg = "#175242"

colors.active = "#11384D"
colors.float = "#134046"
colors.highlight = "#0e2a2f"
colors.border = "#173334"
colors.selection = "#225867"

return colors
