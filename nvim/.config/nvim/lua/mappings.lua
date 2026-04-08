local map = vim.keymap.set

-- File tree
map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file tree" })

-- Close buffer without closing window
map("n", "<leader>qq", "<cmd>bp<cr><cmd>bd! #<cr>", { desc = "Close buffer" })

-- quickui: space space opens menu bar
map("n", "<space><space>", function()
  vim.cmd("call quickui#menu#open()")
end, { desc = "Open menu" })

-- quickui: leader leader opens context menu (LSP actions)
map("n", "<leader><leader>", function()
  vim.cmd([[call quickui#tools#clever_context('k', g:context_menu_k, {})]])
end, { desc = "Context menu" })
