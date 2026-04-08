local opt = vim.opt

-- Encoding
vim.o.encoding = "UTF-8"

-- Search
opt.hlsearch = true
opt.ignorecase = false

-- Clipboard
opt.clipboard = "unnamed"

-- UI
opt.number = true
opt.ruler = true
opt.wrap = false
opt.splitbelow = true
opt.cursorline = true
opt.background = "dark"
opt.guifont = "Iosevka Nerd Font:h14"
opt.linespace = 2
opt.laststatus = 2
opt.showmode = false
opt.showcmd = true
opt.autoindent = true

-- Invisibles (off by default, toggle with Option menu)
opt.list = false
opt.listchars = {
  tab = "· ",
  trail = "·",
  extends = "»",
  precedes = "«",
  nbsp = "░",
}

-- Folding (treesitter-based, start open)
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldlevel = 99

-- Indenting
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

-- Diff
opt.diffopt:append("vertical")

-- Highlight on yank (replaces vim-highlightedyank)
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({ higroup = "Visual", timeout = 300 })
  end,
})
