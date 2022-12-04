local colors = {
  fg = "#CBCBCB",
  fg_light = "#FFFFFF",
  bg = "#102C27",
  -- bg = "#0e2019",
  dark_gray = "#5F6365",
  gray = "#8F959D",
  dark_cyan = "#83A9AE",
  cyan = "#A4DADA",
  dark_blue = "#47669A",
  blue = "#79A3CA",
  dark_green = "#45754E",
  green = "#9AB684",
  light_green = "#78ce71",
  dark_red = "#974854",
  red = "#D57780",
  light_red = "#EB4C50",
  dark_pink = "#A33865",
  pink = "#EB79A3",
  dark_orange = "#7D4839",
  orange = "#E1926F",
  dark_olive = "#9B7456",
  olive = "#D6B87B",
  dark_purple = "#774B8E",
  purple = "#AD82C6",
  none = "NONE",
}

-- more semantically meaningful colors
colors.error = colors.pink
colors.warn = colors.olive
colors.info = colors.blue
colors.hint = colors.purple

colors.diff_add = colors.blue
colors.diff_add_bg = "#093245"
colors.diff_change = colors.green
colors.diff_change_bg = "#21402f"
colors.diff_remove = colors.red
colors.diff_remove_bg = "#411732"
colors.diff_text_bg = "#2D5642"

colors.active = "#11384D"
colors.float = "#134046"
colors.highlight = "#0e2a2f"
colors.border = "#173334"
colors.selection = "#225867"

return colors