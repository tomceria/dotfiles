return {

  -- Git (keep, no better replacement)
  {
    "tpope/vim-fugitive",
    lazy = false,
  },

  -- Custom menu bar (space+space) — keep with all your menus
  -- fzf calls updated to Telescope, NERDTree -> NvimTree, COC -> native LSP
  {
    "skywind3000/vim-quickui",
    lazy = false,
    init = function()
      -- Must be set before plugin loads (read at load time by plugin/quickui.vim)
      vim.g.quickui_border_style = 4  -- rounded corners ╭─╮╰─╯
    end,
    config = function()
      vim.g.quickui_color_scheme = "papercol dark"
      vim.g.quickui_show_tip = 1

      -- Catppuccin Mocha colors for quickui
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "*",
        callback = function()
          vim.cmd([[
            hi QuickBG    guibg=#1e1e2e guifg=#cdd6f4  ctermbg=NONE
            hi QuickSel   guibg=#313244 guifg=#cba6f7  gui=bold
            hi QuickKey   guibg=#1e1e2e guifg=#89b4fa  gui=bold
            hi QuickOff   guibg=#1e1e2e guifg=#45475a
            hi QuickHelp  guibg=#1e1e2e guifg=#6c7086
          ]])
        end,
      })
      -- Apply immediately for current session
      vim.cmd([[
        hi QuickBG    guibg=#1e1e2e guifg=#cdd6f4  ctermbg=NONE
        hi QuickSel   guibg=#313244 guifg=#cba6f7  gui=bold
        hi QuickKey   guibg=#1e1e2e guifg=#89b4fa  gui=bold
        hi QuickOff   guibg=#1e1e2e guifg=#45475a
        hi QuickHelp  guibg=#1e1e2e guifg=#6c7086
      ]])

      vim.cmd([[
        call quickui#menu#reset()

        call quickui#menu#install('File', [
              \ [ "New\t:enew",             'enew' ],
              \ [ "Open (Git)\t:GFiles",    'Telescope git_files' ],
              \ [ "Open\t:Files",           'Telescope find_files' ],
              \ [ "Close\t:bd",             'bd' ],
              \ [ "--", '' ],
              \ [ "Save\t:w",               'w' ],
              \ [ "Save All\t:wa",          'wa' ],
              \ [ "--", '' ],
              \ [ "Exit\t:qa",              'qa' ],
              \ ])

        call quickui#menu#install('Edit', [
              \ [ "Prettify\t:Prettier",    'Prettier' ],
              \ ['--',''],
              \ [ "Copy", "call quickui#textbox#open('Copy by switching to Visual Mode (V), highlight text then press (y)', {'close':'button', 'title':'Copy'})", 'Copy dialog' ],
              \ [ "Paste\t p",              'execute "normal! \p"' ],
              \ [ "Paste Above\t P",        'execute "normal! \P"' ],
              \ ])

        call quickui#menu#install('Find', [
              \ [ "Find (This File)",       'Telescope current_buffer_fuzzy_find', 'Find in this file' ],
              \ [ "Find (Project)\t:Rg",    'Telescope live_grep',                 'Find in working directory' ],
              \ [ "Find File\t:Files",      'Telescope find_files',                'Find file by name' ],
              \ ])

        call quickui#menu#install('Go', [
              \ [ "Buffers\t:Buffers",      'Telescope buffers',  'Show open buffers' ],
              \ ['--',''],
              \ [ "Terminal\t:term",        'terminal' ],
              \ [ "Git Diff\t:Gdiff",       'Gdiff',              'Git diff current file' ],
              \ ['--',''],
              \ [ "Explorer\tC-n",          'NvimTreeToggle' ],
              \ ])

        call quickui#menu#install('Window', [
              \ [ "Split Vertically\tC-w v",         'call feedkeys("\<C-w>v")' ],
              \ [ "Split Horizontally\tC-w s",        'call feedkeys("\<C-w>s")' ],
              \ [ "Equally Resize All\tC-w =",        'call feedkeys("\<C-w>=")' ],
              \ [ "--", '' ],
              \ [ "Toggle Fullscreen\tC-w m",         'call feedkeys("\<C-w>m")' ],
              \ [ "--", '' ],
              \ [ "Close Window\tC-w q",              'call feedkeys("\<C-w>q")' ],
              \ ])

        call quickui#menu#install("Option", [
              \ ['%{&wrap? " ":"  "} Line Wrap',         'set wrap!'],
              \ ['%{&number? " ":"  "} Show Line Number', 'set number!'],
              \ ['%{&cursorline? " ":"  "} Cursor Line',  'set cursorline!'],
              \ ['%{&spell? " ":"  "} Spellcheck',        'set spell!'],
              \ ['%{&list? " ":"  "} Show Invisibles',    'set list!'],
              \ ])

        call quickui#menu#install('Help', [
              \ ["Cheatsheet",    'help index',    ''],
              \ ['Tips',          'help tips',     ''],
              \ ['--',''],
              \ ["Tutorial",      'help tutor',    ''],
              \ ['Quick Reference','help quickref', ''],
              \ ['Summary',       'help summary',  ''],
              \ ], 10000)

        " Context menu — updated from COC to native LSP
        let g:context_menu_k = [
              \ ["Peek Definition\tK",          'lua vim.lsp.buf.hover()'],
              \ [ "--" ],
              \ ["Goto Definition\tgd",         'lua vim.lsp.buf.definition()'],
              \ ["Goto Type Definition\tgy",    'lua vim.lsp.buf.type_definition()'],
              \ ["Goto Implementation\tgi",     'lua vim.lsp.buf.implementation()'],
              \ ["Goto References\tgr",         'lua vim.lsp.buf.references()'],
              \ ]
      ]])
    end,
  },

  -- Surround (Lua rewrite of vim-surround, same muscle memory)
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup()
    end,
  },

  -- Auto tab/space detection
  { "tpope/vim-sleuth", lazy = false },

  -- Bracket pair mappings ([b ]b [e ]e etc.)
  { "tpope/vim-unimpaired", event = "VeryLazy" },

  -- Zoom window toggle (C-w m)
  { "dhruvasagar/vim-zoom", event = "VeryLazy" },

  -- Emmet
  {
    "mattn/emmet-vim",
    ft = { "html", "css", "javascript", "javascriptreact", "typescript", "typescriptreact" },
  },

  -- Styled-components syntax
  {
    "styled-components/vim-styled-components",
    branch = "main",
    ft = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
  },

  -- nvim-tree: carry over your NERDTree ignore list and folder icons
  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      filters = {
        custom = { "\\.pyc$", "\\.o$", "\\.obj$", "\\.svn$", "\\.swp$", "\\.class$", "\\.hg$", "\\.DS_Store$" },
      },
      renderer = {
        root_folder_label = false,
        icons = {
          glyphs = {
            folder = {
              arrow_closed = "",
              arrow_open  = "",
            },
          },
        },
      },
    },
  },

  -- Auto-install Mason tools on startup (replaces manual :MasonInstall)
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "mason.nvim" },
    opts = {
      ensure_installed = {
        "html-lsp",
        "css-lsp",
        "typescript-language-server",
        "json-lsp",
        "prettier",
      },
      auto_update = false,
      run_on_start = true,
    },
  },

  -- conform: formatting (replaces vim-prettier, adds :Prettier command)
  {
    "stevearc/conform.nvim",
    opts = function()
      local opts = require "nvchad.configs.conform"
      opts.formatters_by_ft = {
        javascript      = { "prettier" },
        typescript      = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        css             = { "prettier" },
        html            = { "prettier" },
        json            = { "prettier" },
        markdown        = { "prettier" },
      }
      opts.format_on_save = false
      return opts
    end,
    config = function(_, opts)
      require("conform").setup(opts)
      vim.api.nvim_create_user_command("Prettier", function()
        require("conform").format({ async = true, lsp_fallback = true })
      end, {})
    end,
  },
}
