local colors = {
  fg =          "#BCBFBE",
  fg_light =    "#D2D4D3",
  bg =          "#001B1B",
  bg_light =    "#002222",
  dark_gray =   "#777B7B",
  gray =        "#939796",
  dark_cyan =   "#77949A",
  cyan =        "#82B7BF",
  dark_blue =   "#718096",
  blue =        "#97ABC8",
  dark_green =  "#7D8B7C",
  green =       "#91A889",
  light_green = "#A2C3A2",
  dark_red =    "#93646B",
  red =         "#CD7B8F",
  light_red =   "#F37F9E",
  dark_pink =   "#B07E8D",
  pink =        "#C688A0",
  dark_orange = "#977361",
  orange =      "#CC9977",
  dark_olive =  "#918369",
  olive =       "#BDB08A",
  dark_purple = "#896F91",
  purple =      "#A188A8",
  none = "NONE",
}

-- more semantically meaningful colors
colors.error = colors.pink
colors.warn = colors.olive
colors.info = colors.blue
colors.hint = colors.purple

colors.diff_add = "#5A8B8D"
colors.diff_add_bg = "#072932"
colors.diff_change = "#6B9587"
colors.diff_change_bg = "#0F2928"
colors.diff_remove = "#7B6B77"
colors.diff_remove_bg = "#2F1C31"
colors.diff_text_bg = "#184438"

colors.active = "#11384D"
colors.highlight = "#134046"
colors.float = "#0e2a2f"
colors.border = "#173334"
colors.selection = "#225867"

return colors
