" colors
  colorscheme gruvbox
  if has("gui_running")
  else
    hi! Normal ctermbg=NONE guibg=NONE
    hi! SignColumn ctermbg=NONE guibg=NONE
    hi! GitGutterAdd    ctermfg=2 guifg=#009900 ctermbg=NONE guibg=NONE
    hi! GitGutterChange ctermfg=3 guifg=#bbbb00 ctermbg=NONE guibg=NONE
    hi! GitGutterDelete ctermfg=1 guifg=#ff2222 ctermbg=NONE guibg=NONE
    hi! GitGutterChangeDelete ctermfg=3 guifg=#bbbb00 ctermbg=NONE guibg=NONE
  endif

" COC CONFIGS (Recommended)
  " if hidden is not set, TextEdit might fail.
  set hidden

  " Some servers have issues with backup files, see #649
  set nobackup
  set nowritebackup

  " Better display for messages
  "set cmdheight=2

  " You will have bad experience for diagnostic messages when it's default 4000.
  set updatetime=300

  " don't give |ins-completion-menu| messages.
  set shortmess+=c

  " always show signcolumns
  set signcolumn=yes

  " Use tab for trigger completion with characters ahead and navigate.
  " Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
  inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

  " Use <c-space> to trigger completion.
  inoremap <silent><expr> <c-space> coc#refresh()

  " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
  " Coc only does snippet and additional edit on confirm.
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

  " Use `[c` and `]c` to navigate diagnostics
  nmap <silent> [c <Plug>(coc-diagnostic-prev)
  nmap <silent> ]c <Plug>(coc-diagnostic-next)

  " Remap keys for gotos
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)

  " Use K to show documentation in preview window
  nnoremap <silent> K :call <SID>show_documentation()<CR>

  function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
    else
    call CocAction('doHover')
    endif
  endfunction

  " Highlight symbol under cursor on CursorHold
  autocmd CursorHold * silent call CocActionAsync('highlight')

  " Remap for rename current word
  nmap <leader>rn <Plug>(coc-rename)

  " Remap for format selected region
  xmap <leader>f  <Plug>(coc-format-selected)
  nmap <leader>f  <Plug>(coc-format-selected)

  augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  augroup end

  " Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
  xmap <leader>a  <Plug>(coc-codeaction-selected)
  nmap <leader>a  <Plug>(coc-codeaction-selected)

  " Remap for do codeAction of current line
  nmap <leader>ac  <Plug>(coc-codeaction)
  " Fix autofix problem of current line
  nmap <leader>qf  <Plug>(coc-fix-current)

  " Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
  nmap <silent> <TAB> <Plug>(coc-range-select)
  xmap <silent> <TAB> <Plug>(coc-range-select)
  xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

  " Use `:Format` to format current buffer
  command! -nargs=0 Format :call CocAction('format')

  " Use `:Fold` to fold current buffer
  command! -nargs=? Fold :call     CocAction('fold', <f-args>)

  " use `:OR` for organize import of current buffer
  command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

  "" Add status line support, for integration with other plugin, checkout `:h coc-status`
  "set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

  " Using CocList
  " Show all diagnostics
  nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
  " Manage extensions
  nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
  " Show commands
  nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
  " Find symbol of current document
  nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
  " Search workspace symbols
  nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
  " Do default action for next item.
  nnoremap <silent> <space>j  :<C-u>CocNext<CR>
  " Do default action for previous item.
  nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
  " Resume latest coc list
  nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
"
  let g:airline#extensions#coc#enabled = 1

" NERDTree CONFIGS
  "autocmd FileType nerdtree setlocal nolist
  let NERDTreeMinimalUI=1
  "let NERDTreeShowHidden=1
  let NERDTreeIgnore=['\.pyc', '\.o', '\.obj', '\.svn', '\.swp', '\.class', '\.hg', '\.DS_Store']


" Prettier CONFIGS
  "let g:prettier#config#use_tabs = 'true'

" vim-polyglot CONFIGS
  let g:vim_json_syntax_conceal = 0 
  let g:vim_markdown_conceal = 0
  let g:vim_markdown_conceal_code_blocks = 0

" vim-airline CONFIGS
  "if has("gui_running")
    let g:airline_powerline_fonts = 1
  "endif
  "let g:airline_theme = 'powerlineish'
  let g:airline_theme = 'one'

  "let g:airline_section_z = '%3p%% %#__accent_bold#%4l%#__restore__#/%L%#__restore__# :%#__accent_bold#%3v '
  let g:airline_section_z = '%L%{g:airline_symbols.maxlinenr} %#__accent_bold#%{g:airline_right_alt_sep} %3l%#__restore__#:%2v'
  let g:airline#extensions#xkblayout#short_codes = {'VietnameseSimpleTelex': 'VI', 'ABC': 'EN'}
  let g:airline#extensions#branch#enabled = 1
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#fnamemod = ':t'

" auto-pairs CONFIGS
  let g:AutoPairsShortcutBackInsert=''

" vim-xkbswitch CONFIGS
  "if has("gui_macvim")
    "let g:XkbSwitchLib = '/usr/local/lib/libInputSourceSwitcher.dylib'
  "endif

" indentLine CONFIGS
  let g:indentLine_char = '┊'

" devicons CONFIGS
  let g:webdevicons_enable_nerdtree = 1
  let g:NERDTreeHighlightFolders = 1
  let g:NERDTreeHighlightFoldersFullName = 1
  let g:WebDevIconsUnicodeDecorateFolderNodes = 1 " enable folder glyph flag
  let g:DevIconsEnableFoldersOpenClose = 1
  let g:DevIconsEnableFolderExtensionPatternMatching = 1
  let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
  let g:WebDevIconsNerdTreeBeforeGlyphPadding = ' '
  let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {} " needed
  "let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['js'] = ''
  "let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['css'] = ''
  let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['cs'] = ''
  if exists("g:loaded_webdevicons")
    call webdevicons#refresh() 
  endif

" vista CONFIGS
  let g:vista_default_executive = 'coc'
  nmap <Leader>v :Vista!!<CR>

" (UNUSED) Ale CONFIGS
  let g:ale_cs_mcsc_assemblies = [
    \ '/Applications/Unity/Unity.app/Contents/Frameworks/Managed/UnityEngine.dll',
    "\ 'path-to-unityproject/obj/Debug',
    "\ '/Users/owner/Documents/Game Development/Projects/project-bathunter/obj/Debug'
    "\ '/Users/owner/Documents/Game Development/Projects/project-earthlings/obj/Debug'
    \]
  let g:ale_cs_mcs_options = '-pkg:dotnet'
  let g:ale_sign_error = 'A✕'
  let g:ale_sign_warning = 'A△'
" (UNUSED) YouCompleteMe CONFIGS
  "let g:ycm_autoclose_preview_window_after_insertion = 1
  "" enhance YCM JS completion with tern's smarts
  "autocmd FileType javascript setlocal omnifunc=tern#Complete


