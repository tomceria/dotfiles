---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "catppuccin",
  transparency = true,
  hl_override = {
    CursorLine = { bg = "#313244" },
    Folded  = { bg = "#313244", fg = "#a6adc8" },
    Visual  = { bg = "#45475a" },
    TabLineFill = { bg = "#1e1e2e" },
  },
}

M.ui = {
  statusline = {
    theme = "default",
    separator_style = "round",
  },
  tabufline = {
    enabled = true,
    lazyload = true,
    order = { "treeOffset", "buffers", "tabs" },
  },
}

return M
