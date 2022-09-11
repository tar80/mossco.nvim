local M = {}
M.theme = {
    fg = "#4B7774",
    bg = "#173334",
    bg2 = "#215053",
    cyan = "#56909A",
    blue = "#437995",
    green = "#5B8C6B",
    olive = "#98905E",
    orange = "#906B64",
    pink = "#AA616D",
    purple = "#796E99"
}
M.vi_mode = {
    NORMAL = M.theme.fg,
    INSERT = M.theme.cyan,
    REPLACE = M.theme.orange,
    OP = M.theme.pink,
    VISUAL = M.theme.purple,
    LINES = M.theme.purple,
    BLOCK = M.theme.purple,
    ["V-REPLACE"] = M.theme.purple,
    ENTER = M.theme.cyan,
    MORE = M.theme.cyan,
    SELECT = M.theme.pink,
    COMMAND = M.theme.green,
    SHELL = M.theme.green,
    TERM = M.theme.blue,
    NONE = M.theme.pink
}
return M
