---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "catppuccin",
  transparency = false,
  hl_override = {
    Folded = { bg = "#313244", fg = "#a6adc8" },
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
  },
}

return M
