"       ______  __   _                ___           
"      / ____ \/ /__(_)____________  / (_)___ _   __
"     / / __ `/ //_/ / ___/ ___/ _ \/ / / __ \ | / /
"    / / /_/ / ,< / (__  |__  )  __/ / / /_/ / |/ / 
"    \ \__,_/_/|_/_/____/____/\___/_/_/\____/|___/  
"     \____/ 
"
"  Github:     https://github.com/kisseliov
"  Maintainer: Yegor Kisseliov

" Plugins {{{

  " Install vim-plug if necessary
  if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
    echo "Downloading junegunn/vim-plug to manage plugins..."
    silent !mkdir -p ~/.config/nvim/autoload/
    silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
    autocmd VimEnter * PlugInstall
  endif

  call plug#begin('~/.vim/plugged')

    Plug 'joelstrouts/swatch.vim' 
    Plug 'wellle/targets.vim'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-fireplace'
    Plug 'tpope/vim-dadbod'
    Plug 'tpope/vim-surround'
    Plug 'airblade/vim-rooter'
    Plug 'bluz71/vim-moonfly-colors'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'stsewd/fzf-checkout.vim'
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install', 'for': 'markdown' }
    Plug 'sheerun/vim-polyglot'
    Plug 'ChristianChiarulli/codi.vim'
    Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
    Plug 'mbbill/undotree'
    Plug 'ap/vim-css-color'
    Plug 'lervag/vimtex'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'
    Plug 'rbong/vim-flog'

    " Notes
    Plug 'xolox/vim-misc'
    Plug 'xolox/vim-notes'

    " Theming
    Plug 'mhinz/vim-startify'
    Plug 'itchyny/lightline.vim'
    Plug 'huyvohcmc/atlas.vim'
    Plug 'bluz71/vim-moonfly-colors'
    Plug 'andreypopp/vim-colors-plain'
    Plug 'drewtempelmeyer/palenight.vim'

  call plug#end()

" }}}

  call plug#begin('~/.vim/plugged')

    " Clojure
    Plug 'eraserhd/parinfer-rust', {'do':
            \  'cargo build --release'}
    Plug 'Olical/conjure', {'tag': 'v4.3.1'}
    Plug 'w0rp/ale'
    Plug 'clojure-vim/vim-jack-in'
    Plug 'radenling/vim-dispatch-neovim'
    Plug 'tpope/vim-dispatch'
    
    " Python
    Plug 'Vimjas/vim-python-pep8-indent'
    
    Plug 'wellle/targets.vim' " More text objects
    Plug 'tpope/vim-commentary'
    " Plug 'tpope/vim-fireplace'
    Plug 'tpope/vim-dadbod'
    Plug 'tpope/vim-surround'
    Plug 'airblade/vim-rooter'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'stsewd/fzf-checkout.vim'
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install', 'for': 'markdown' }
    Plug 'sheerun/vim-polyglot'
    Plug 'ChristianChiarulli/codi.vim'
    Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
    Plug 'mbbill/undotree'
    Plug 'ap/vim-css-color'
    Plug 'lervag/vimtex'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'
    Plug 'rbong/vim-flog'

    " Notes
    Plug 'xolox/vim-misc'
    Plug 'xolox/vim-notes'

    " Theming
    Plug 'joelstrouts/swatch.vim' 
    Plug 'bluz71/vim-moonfly-colors'
    Plug 'mhinz/vim-startify'
    Plug 'itchyny/lightline.vim'
    Plug 'huyvohcmc/atlas.vim'
    Plug 'bluz71/vim-moonfly-colors'
    Plug 'andreypopp/vim-colors-plain'
    Plug 'drewtempelmeyer/palenight.vim'

  call plug#end()

" }}}

" Visuals {{{

  " Colorscheme
  set background=dark
  colorscheme plain
  if exists('*Swatch_load') | call Swatch_load() | endif

  " New adjustment: identify hl group under cursor and take you to new
  " buffer where its attributes can be adjusted
  nnoremap <leader>ss :call Swatch_new_adjustment()

  " Preview this: highlight the current word (color name or hex code) with
  " the color it represents
  nnoremap <leader>pt :call Swatch_preview_this()

  if has("gui_running")
      "" Tweak GUI options
      set guioptions=aegimLt
      set go-=M
      set go-=m
      set go-=L
      set number
      let &t_ut=''
      "" Use 256 colours
      set t_Co=256
      "" Size of GUI version windows
      set columns=84 lines=60
      "" Highlight current line
      set cursorline
  endif
  
  if &t_Co >= 256 || has("gui_running")
      set background=dark
      colorscheme plain
  endif
  
  if &t_Co > 2 || has("gui_running")
      " switch syntax highlighting on, when the terminal has colors
      syntax on
  endif
  
  hi! PmenuSel ctermbg=0
  hi! LineNr ctermfg=236
  hi! CursorLineNr ctermfg=249

  
  " Lightline
  let g:lightline = {
        \ 'colorscheme': 'wombat',
        \ 'component_function': {
        \   'cocstatus': 'coc#status'
        \  },
        \ }

  autocmd User CocStatusChange, CocDiagnosticChange call lightline#update()


  " Startify
  let g:startify_lists = [
        \ { 'type': 'files',     'header': ['   Recent files 📁']   },
        \ { 'type': 'dir',       'header': ['   Recent files in current directory 📂']   },
        \ { 'type': 'sessions',  'header': ['   Sessions 📆']       },
        \ ]

  let g:startify_bookmarks = []

  let g:startify_custom_indices = ['j', 'k', 'l', ';', 'a', 's', 'd', 'f']


  " Clojure
  let g:float_preview#docked = 0
  let g:float_preview#max_width = 80
  let g:float_preview#max_height = 40

" }}}

" Programming {{{

  " Clojure linter
  let g:ale_linters = {
        \ 'clojure': ['clj-kondo', 'joker']
        \}

  " Codi
  hi! link CodiVirtualText String

  let g:codi#virtual_text_prefix = "\u276f\ "
  
  let g:codi#aliases = {
                    \ 'javascript.jsx': 'javascript',
                    \ }

  " Prettier
  let g:prettier#autoformat_config_present = 1
  
" }}}

" Writing {{{

  let g:tex_flavor = 'latex'
  let g:markdown_folding = 1

  " Notes
  let g:notes_directories = ['~/Sync/Notes']
  let g:notes_suffix = '.txt'
  hi! link notesTodo Normal
  hi! link notesDoneMarker LineNr
  hi! link notesDoneItem LineNr
  hi! link notesXXX Normal
  hi! link notesFixMe Normal

" }}}

" Sensible defaults {{{

  set encoding=utf-8
  set noemoji
  set nocompatible
  set hidden
  set wrap          	" wrap lines
  set softtabstop=2
  set tabstop=2     	" a tab is four spaces
  set backspace=indent,eol,start
  set expandtab
  set foldenable
  set autoindent    	" always set autoindenting on
  set copyindent    	" copy the previous indentation on autoindenting
  set sw=2 ts=2 sts=2 " number of spaces to use for autoindenting
  set textwidth=90
  set shiftround    	" use multiple of shiftwidth when indenting with '<' and '>'
  set showmatch     	" set show matching parenthesis
  set smartcase     	" ignore case if search pattern is all lowercase,
                      "    case-sensitive otherwise
  set smarttab      	" insert tabs on the start of a line according to
                      "    shiftwidth, not tabstop
  set hlsearch      	" highlight search terms
  set incsearch     	" show search matches as you type
  set scrolloff=4	  	" keep 4 lines off the edges of the screen when scrolling

  set history=1000  	" remember more commands and search history
  set undolevels=1000 " use many muchos levels of undo
  set title           " change the terminal's title
  set visualbell      " don't beep
  set noerrorbells    " don't beep
  set vb t_vb=
  set tildeop 		    " make tilde (flip case) an operator

  set nobackup
  set noswapfile
  set wildmenu 		    " tab completion in ex mode
  set ruler			      " lines, cols in status line
  set noshowmode	   	" current mode in status line

  set showcmd         " display the number of chars in v-mode
  set laststatus=2    " no extra status lines
  set shortmess=a
  set display=lastline,uhex
  set mouse=a
  set confirm
  set ttimeoutlen=100
  set clipboard+=unnamed
  set wildignore=*.swp,*.bak,*.pyc,*.class
  set splitright

  " Activate filetype
  filetype on
  filetype plugin on
  filetype plugin indent on
  
  " let g:netrw_list_hide = '.*\.swp$,.*\.pyc$,\.svn$,^\.[A-Za-z].*'
  " TextEdit might fail if hidden is not set.

  " Some servers have issues with backup files, see #649.
  set nobackup
  set nowritebackup

  " Give more space for displaying messages.
  set cmdheight=2

  " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
  " delays and poor user experience.
  set updatetime=200

  " Don't pass messages to |ins-completion-menu|.
  set shortmess+=c

  " Always show the signcolumn, otherwise it would shift the text each time
  " diagnostics appear/become resolved.
  if has("patch-8.1.1564")
    " Recently vim can merge signcolumn and number column into one
    set signcolumn=number
  else
    set signcolumn=yes
  endif


" }}}

" Mappings {{{

  " Leader specific
  let g:mapleader = "\<Space>"
  " let g:maplocalleader = ","

  nnoremap <silent> <tab> za 
  nnoremap <silent> <leader>f :Files<CR>
  map <leader><leader> :Buffers<CR>
  nnoremap <leader>g :Rg<CR>
  nnoremap <leader>t :Tags<CR>
  nnoremap <leader>m :Marks<CR> 
  nnoremap <leader>h :History<CR> 
  nmap <silent> <leader>ve :e $MYVIMRC<CR>
  nmap <silent> <leader>vs :so $MYVIMRC<CR>
  nmap <silent> <leader>w <C-w>
  nmap <silent> <leader>gs :G<CR>
  nmap <silent> <leader>ggt :GitGutterToggle<CR>
  nmap <silent> <leader>bd :bd<CR>
  " nnoremap ; :
  " nnoremap : ;
  nmap <silent> <leader>/ :nohlsearch<CR>
  tnoremap <Leader><Esc> <C-\><C-n>
  nnoremap <leader>p :GFiles<CR>

  " Symbol renaming.
  nmap <leader>rn <Plug>(coc-rename)

  " Project-wide renaming
  nnoremap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>

  " Open explorer
  nnoremap <M-e> :Exp<CR>

  " Git checkout
  nnoremap <leader>gc :GCheckout<CR>

  " Set a timestamp 
  map <leader>D :put =strftime('%a %d %b %H:%M:%S')<CR>

  " Toggle line numbers
  noremap <F3> :set invnumber invrelativenumber<CR>

  " Toggle undotree
  nnoremap <F5> :UndotreeToggle<cr>

  " *Move* a visual block
  " vnoremap <silent>J :m '>+1<CR>gv=gv
  " vnoremap <silent>K :m '<-2<CR>gv=gv

  " Cycle through buffers
  nnoremap <C-n> :bnext<CR>
  nnoremap <C-p> :bprevious<CR>

  nnoremap <C-H> <C-W><C-H>
  nnoremap <C-J> <C-W><C-J>
  nnoremap <C-K> <C-W><C-K>
  nnoremap <C-L> <C-W><C-L>

  nnoremap <M-h> <C-W>H
  nnoremap <M-j> <C-W>J
  nnoremap <M-k> <C-W>K
  nnoremap <M-l> <C-W>L


  " Open shell in vim
  if has('nvim') || has('terminal')
    map <silent> <Leader>' :terminal<CR>
  else
    map <silent> <Leader>' :shell<CR>
  endif


  " Window {
    " if get(g:, 'vim_better_default_window_key_mapping', 1)
    "   nnoremap <Leader>ww <C-W>w
    "   nnoremap <Leader>wr <C-W>r
    "   nnoremap <Leader>wd <C-W>c
    "   nnoremap <Leader>wq <C-W>q
    "   nnoremap <Leader>wj <C-W>j
    "   nnoremap <Leader>wk <C-W>k
    "   nnoremap <Leader>wh <C-W>h
    "   nnoremap <Leader>wl <C-W>l
    "   if has('nvim') || has('terminal')
    "     tnoremap <Leader>wj <C-W>j
    "     tnoremap <Leader>wk <C-W>k
    "     tnoremap <Leader>wh <C-W>h
    "     tnoremap <Leader>wl <C-W>l
    "   endif
    "   nnoremap <Leader>wH <C-W>5<
    "   nnoremap <Leader>wL <C-W>5>
    "   nnoremap <Leader>wJ :resize +5<CR>
    "   nnoremap <Leader>wK :resize -5<CR>
    "   nnoremap <Leader>w= <C-W>=
    "   nnoremap <Leader>ws <C-W>s
    "   nnoremap <Leader>w- <C-W>s
    "   nnoremap <Leader>wv <C-W>v
    "   nnoremap <Leader>w\| <C-W>v
    "   nnoremap <Leader>w2 <C-W>v
    " endif
  " }

  " w!! saves file under sudo
  cmap w!! w !sudo tee % >/dev/null

  " Treat long lines as break lines (useful when moving around in them)
  nmap <silent> j gj
  nmap <silent> k gk
  vmap <silent> j gj
  vmap <silent> k gk

  " Key mapping for Russian QWERTY keyboard in UTF-8
  set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

  " Coc
  " 
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
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

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'vert h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
" Snippets
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'
let g:coc_snippet_previous = '<s-tab>'

" Formatting selected code.
xmap <leader>fs  <Plug>(coc-format-selected)
nmap <leader>fs  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
" nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" }}}

" FZF {{{

  " This is the default extra key bindings
  let g:fzf_action = {
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-x': 'split',
    \ 'ctrl-v': 'vsplit' }

  " Enable per-command history.
  " CTRL-N and CTRL-P will be automatically bound to next-history and
  " previous-history instead of down and up. If you don't like the change,
  " explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
  let g:fzf_history_dir = '~/.local/share/fzf-history'

  let g:fzf_tags_command = 'ctags -R'

  " Border color
  let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'
  let $FZF_DEFAULT_COMMAND="rg --files --hidden"

  let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }

  " Customize fzf colors to match your color scheme
  let g:fzf_colors =
        \ { 'fg':      ['fg', 'Normal'],
        \   'bg':      ['bg', 'Normal'],
        \   'hl':      ['fg', 'Comment'],
        \   'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
        \   'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
        \   'hl+':     ['fg', 'Statement'],
        \   'info':    ['fg', 'PreProc'],
        \   'border':  ['fg', 'Ignore'],
        \   'prompt':  ['fg', 'Conditional'],
        \   'pointer': ['fg', 'Exception'],
        \   'marker':  ['fg', 'Keyword'],
        \   'spinner': ['fg', 'Label'],
        \   'header':  ['fg', 'Comment'] }

  "Get Files
  command! -bang -nargs=? -complete=dir Files
      \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)

  " Get text in files with Rg
  command! -bang -nargs=* Rg
    \ call fzf#vim#grep(
    \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
    \   fzf#vim#with_preview(), <bang>0)

  " Ripgrep advanced
  function! RipgrepFzf(query, fullscreen)
    let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
    let initial_command = printf(command_fmt, shellescape(a:query))
    let reload_command = printf(command_fmt, '{q}')
    let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
    call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
  endfunction

  command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

  " Git grep
  command! -bang -nargs=* GGrep
    \ call fzf#vim#grep(
    \   'git grep --line-number '.shellescape(<q-args>), 0,
    \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)
" }}}

" vim: fdm=marker
