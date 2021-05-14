set nocompatible
set termguicolors

let mapleader=" "

nnoremap <space> <nop>
vnoremap <space> <nop>
nnoremap <s-up> <nop>
nnoremap <s-down> <nop>
vnoremap <s-up> <nop>
vnoremap <s-down> <nop>
inoremap <s-up> <nop>
inoremap <s-down> <nop>
noremap <f1> <nop>
nnoremap { <nop>
nnoremap } <nop>

let g:python3_host_prog=escape(expand('$HOME'), '\') . '/.asdf/shims/python'
let g:python_host_prog=escape(expand('$HOME'), '\') . '/.asdf/shims/python'

let g:ruby_path=escape(expand('$HOME'), '\') . '/.asdf/shims/ruby'
let g:ruby_default_path=escape(expand('$HOME'), '\') . '/.asdf/shims/ruby'
let g:ruby_host_prog=escape(expand('$HOME'), '\') . '/.asdf/shims/neovim-ruby-host'

" https://github.com/dense-analysis/ale#faq-coc-nvim
let g:ale_disable_lsp = 1

call plug#begin('~/.vim/plugged')

"Testing out telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'kyazdani42/nvim-web-devicons'

" Dark color scheme plugin manager
Plug 'tjdevries/colorbuddy.vim'
Plug 'DilanGMB/nightbuddy'

Plug 'tarekbecker/vim-yaml-formatter', { 'for': 'yaml' }
let g:yaml_formatter_indent_collection=1

" Use shortcuts gJ and gS to join and split, respectively
Plug 'AndrewRadev/splitjoin.vim'

Plug 'scrooloose/nerdtree'
nnoremap <leader>e :NERDTreeToggle<cr>
let g:NERDTreeChDirMode = 2

Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'

Plug 'mhinz/vim-startify'

" Formatting & validating json via :Jacinto
Plug 'alfredodeza/jacinto.vim', { 'for': 'json' }

" An improved matchit plugin with additional motions & matchers
Plug 'andymass/vim-matchup'

" Plug 'Chrisbra/Colorizer'
" Plug 'norcalli/nvim-colorizer.lua'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }

Plug 'liuchengxu/vista.vim'
let g:vista_default_executive = 'lspconfig'

Plug 'dense-analysis/ale'
let g:ale_sign_column_always = 1
let g:ale_sign_warning = ''
let g:ale_sign_error = ''
let g:ale_ruby_rubocop_executable = escape(expand('$HOME'), '\') . '/.asdf/shims/bundle'

let g:ale_fix_on_save = 1

let g:ale_linters = {
      \ 'ruby': ['rubocop']
      \}

let g:ale_fixers = {
      \ 'ruby': [
      \   'standardrb'
      \ ],
      \ '*': [
      \   'remove_trailing_lines',
      \   'trim_whitespace'
      \ ]
      \}

highlight link ALEWarningSign String
highlight link ALEErrorSign Title
highlight ALEWarning ctermbg=LightGreen

Plug 'maximbaz/lightline-ale'

" Better motions
Plug 'easymotion/vim-easymotion'
let g:EasyMotion_do_mapping = 0 " Disable default mappings
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap <leader>s <Plug>(easymotion-overwin-f)
nmap <leader>w <Plug>(easymotion-w)
" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1
" JK motions: Line motions
map <leader>j <Plug>(easymotion-j)
map <leader>k <Plug>(easymotion-k)

" Create images of source code
Plug 'segeljakt/vim-silicon'

" Colorscheme
" Plug 'dracula/vim'
Plug 'patstockwell/vim-monokai-tasty'
let g:vim_monokai_tasty_italic = 1

Plug 'guns/xterm-color-table.vim'

" Allows * to also work with visual selections
Plug 'bronson/vim-visual-star-search'

" Clear search highlighting by pressing //
" nnoremap // :noh<esc><c-c>
nnoremap // :noh<cr>
nnoremap <esc><esc> :noh<cr>

Plug 'editorconfig/editorconfig-Vim'

Plug 'elzr/vim-json', { 'for': 'json' }

" A better plugin for remembering the last place your cursor was. Ignores
" git commit message windows and others
Plug 'farmergreg/vim-lastplace'

Plug 'inside/vim-search-pulse'
let g:vim_search_pulse_disable_auto_mappings = 1
let g:vim_search_pulse_mode = 'pattern'

" Improved * motions
Plug 'haya14busa/vim-asterisk'
map * <Plug>(asterisk-z*)<Plug>Pulse
map # <Plug>(asterisk-z#)<Plug>Pulse
nmap n n<Plug>Pulse
nmap N N<Plug>Pulse

" Align text
Plug 'junegunn/vim-easy-align'

Plug 'Konfekt/FastFold'

Plug 'Konfekt/vim-scratchpad'
let g:scratchpad_ftype = 'text'

" Better, automatic swap file management
Plug 'gioele/vim-autoswap'

" Nicer scrolling with CTRL-d/u
" Plug 'yuttie/comfortable-motion.vim'
" Plug 'psliwka/vim-smoothie'
Plug 'karb94/neoscroll.nvim'

Plug 'itchyny/lightline.vim'
" Buffer tabs
Plug 'mengelbrecht/lightline-bufferline'
let g:lightline#bufferline#enable_devicons = 1
let g:lightline#bufferline#show_number = 1
let g:lightline#bufferline#unicode_symbols = 1

" Plug 'mhinz/vim-mix-format'
" let g:mix_format_on_save = 1

" Use c-n/c-h to switch buffers
nnoremap <c-n> :bnext<cr>
nnoremap <c-h> :bprev<cr>

Plug 'APZelos/blamer.nvim'
let g:blamer_enabled = 1
let g:blamer_delay = 500
let g:blamer_show_in_visual_modes = 0
let g:blamer_date_format = '%Y-%m-%d'

" Send to tmux
Plug 'jgdavey/tslime.vim'

" Extends " and @ in normal mode to auto-show registers
Plug 'junegunn/vim-peekaboo'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Override and open ctrl-t in a new buffer to help me using buffers
let g:fzf_action = {
  \ 'ctrl-t': 'edit',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

let $FZF_DEFAULT_OPTS='--layout=reverse'

" Add automatic delimiters ([<{, quotes, etc.
Plug 'Raimondi/delimitMate'
let delimitMate_expand_space = 1

" See git diff in commit window as another pane
Plug 'rhysd/committia.vim'
let g:committia_open_only_vim_starting = 1
let g:committia_edit_window_width = 90

let g:committia_hooks = {}
function! g:committia_hooks.edit_open(info)
    " Additional settings
    setlocal spell

    " If no commit message, start with insert mode
    " if a:info.vcs ==# 'git' && getline(1) ==# ''
    "     startinsert
    " endif

    " Scroll the diff window from insert mode
    " Map <C-n> and <C-u>
    imap <buffer><C-n> <Plug>(committia-scroll-diff-down-half)
    imap <buffer><C-u> <Plug>(committia-scroll-diff-up-half)
endfunction

" Git message viewer with <leader>gm. Requires neovim 0.4+ for floating panel
" Install with brew install neovim --HEAD
Plug 'rhysd/git-messenger.vim'

" Crystal syntax highlighting & support
Plug 'rhysd/vim-crystal', { 'for': 'crystal' }
let g:crystal_define_mappings = 0

" Dash integration
Plug 'rizzatti/dash.vim'
nnoremap <leader>d :Dash<cr>

let g:polyglot_disabled = ['yard', 'typescript', 'jsx', 'tsx']
Plug 'sheerun/vim-polyglot'
" sheerun/vim-yardoc
let g:vim_markdown_conceal = 0
" Using vim-ruby via vim-polyglot, indent per work convention
let g:ruby_indent_access_modifier_style = 'normal'
" Indent for multi-line statements against left. variable or hanging
let g:ruby_indent_assignment_style = 'variable'
" Indent nested blocks, do or expression
let g:ruby_indent_block_style = 'do'
" Highlight whitespace errors
let g:ruby_space_errors = 1

Plug 'tpope/vim-rails'

" Vim rspec helpers
Plug 'thoughtbot/vim-rspec'
let g:rspec_command = 'call Send_to_Tmux("spring rspec {spec} --seed 42\n")'
map <leader>t :call RunCurrentSpecFile()<cr>
map <leader>r :call RunNearestSpec()<cr>
" map <leader>l :call RunLastSpec()<cr>

" Comment with gc and motion
Plug 'tomtom/tcomment_vim'

" Use :ToGithub to open the current line in your browser
" Plug 'tonchis/vim-to-github'
Plug 'jaydorsey/vim-to-github', {'branch': 'jay/add_blame_shortcut'}

" Add Unicode character metadata when using ga
Plug 'tpope/vim-characterize'

Plug 'tpope/vim-dispatch'

Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-haml', { 'for': 'haml' }
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'

" Better mark management. Add with m+, delete with m-, toggle with m,
" Display with m? or m~
Plug 'jeetsukumaran/vim-markology'

" Vim understands line & column syntax when opening & editing files
Plug 'wsdjeg/vim-fetch'

Plug 'jaydorsey/charblob'
Plug 'jaydorsey/fzf_float', {'branch': 'main'}

Plug 'wincent/ferret'

" Plug 'ripxorip/aerojump.nvim', { 'do': ':UpdateRemotePlugins' }

" Highlight <f> jump commands on highlighted line
Plug 'unblevable/quick-scope'
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" Highlight code blocks with :LimelightToggle
Plug 'junegunn/limelight.vim'
nmap <leader>l <Plug>(Limelight)
xmap <leader>l <Plug>(Limelight)

" Completion support
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install() } }

let g:coC_global_extensions = [
      \ 'coc-actions',
      \ 'coc-bookmark',
      \ 'coc-css',
      \ 'coc-explorer',
      \ 'coc-floaterm',
      \ 'coc-git',
      \ 'coc-git-p',
      \ 'coc-github',
      \ 'coc-gitignore',
      \ 'coc-highlight',
      \ 'coc-html',
      \ 'coc-json',
      \ 'coc-lines',
      \ 'coc-lua',
      \ 'coc-marketplace',
      \ 'coc-markmap',
      \ 'coc-nextword',
      \ 'coc-pairs',
      \ 'coc-prettier',
      \ 'coc-smartf',
      \ 'coc-solargraph',
      \ 'coc-spell-checker',
      \ 'coc-split-term',
      \ 'coc-sql',
      \ 'coc-terminal',
      \ 'coc-yaml',
      \ 'coc-dictionary',
      \ 'coc-omni',
      \ 'coc-syntax',
      \ 'coc-tag',
      \ 'coc-word'
      \ ]
" Because old versions of node
let g:coc_disable_startup_warning = 1
" Plug 'amiralies/coc-elixir', {'do': 'yarn install && yarn prepack'}
" Plug 'antoinemadec/coc-fzf'

"
" coc.vim sample config
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

if has('patch8.1.1068')
  " Use `complete_info` if your (Neo)Vim version supports it.
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" nnoremap <silent> K :call <SID>show_documentation()<CR>
nnoremap <a-d> :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

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

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

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

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocFzfList diagnostics<cr>
" Manage extensions.
" nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocFzfList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocFzfList outline<cr>
" Search workspace symbols.
" nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
" nnoremap <silent> <space>j  :<C-u>CocFzfNext<CR>
" Do default action for previous item.
" nnoremap <silent> <space>k  :<C-u>CocFzfPrev<CR>
" Resume latest coc list.
" nnoremap <silent> <space>p  :<C-u>CocListResume<CR>


"
" coc.vim sample config end
"

call plug#end()

lua << EOF
  local actions = require('telescope.actions')

  require('telescope').setup {
    defaults = {
      file_sorter =  require'telescope.sorters'.get_fzy_sorter,
      generic_sorter =  require'telescope.sorters'.get_fzy_sorter,
      mappings = {
        i = {
          ["<Esc>"] = actions.close,
          ["<C-c>"] = function()
            vim.cmd [[stopinsert]]
          end,
        },
      },
    },
  }
EOF

let g:nb_style = "twilight"
lua require('colorbuddy').colorscheme('nightbuddy')

let g:Hexokinase_highlighters = [ 'sign_column' ]

" Part of norcalli/nvim-colorizer.lua. Use the command
" :ColorizerAttachToBuffer if the file has no filetype
" lua require'colorizer'.setup()

lua require('neoscroll').setup()

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

" Fugitive Conflict Resolution
" https://www.prodops.io/blog/solving-git-merge-conflicts-with-vim
nnoremap <leader>gd :Gdiffsplit!<CR>
nnoremap gdh :diffget //2<CR>
nnoremap gdl :diffget //3<CR>

set autoindent                                     " Automatic indenting/formatting
set autoread                                       " Reload files changed outside of vim
set background=dark                                " Always use colors for dark color schemes
set backup                                         " Make backups
set backupdir=~/.vim/backups                       " Specify backup directory
set backspace=indent,eol,start                     " Backspace configuration
set cmdheight=2                                    " More space for messages
set concealcursor=nv                               " From vim-markdown, conceals links, headings, etc in normal & visual mode
set conceallevel=0                                 " Expand everything, particularly in markdown files
set directory=~/.vim/tmp                           " List of directory names for the swap file, separated by commas
set encoding=utf-8                                 " Always UTF-8 enoding
set eol                                            " include a new line at EOF
set expandtab                                      " Expand tabs to spaces
set foldcolumn=2
set foldlevel=2
set foldlevelstart=99                              " Edit with all folds open when opening a file
set foldnestmax=12                                 " Deepest fold
set foldenable                                     " Fold or don't fold files by default
set formatoptions+=j                               " Join comments better
set grepprg=rg\ --vimgrep\ --no-heading            " Use ripgrep instead of ag for :Ag commands
set grepformat=%f:%l:%c:%m,%f:%l:%m
" set guicursor=a:blinkon0-Cursor/Cursor             " Turn off blink for all modes
" set guicursor+=i:blinkwait0-blinkon100-blinkoff100 " Turn on blinking in insert mode
" set guicursor=n-v-c:block-Cursor/lCursor,i-ci-ve:ver25-Cursor2/lCursor2,r-cr:hor20,o:hor50
set hidden                                         " Required for operations modifying multiple buffers like rename.
set history=500                                    " Max history
set hlsearch                                       " Highlight matches
set ignorecase                                     " Ignore case when searching...
set incsearch                                      " Find the next match as we type
set nolazyredraw                                   " Disable screen redraw when running macros, for performance
set redrawtime=10000                               " Increase redraw time so syntax highlighting works on larger files
set matchtime=10                                   " Show matching bracket for 1 second
set mouse=                                         " Disable mouse
set nocindent                                      " Don't indent text with parentheses https://stackoverflow.com/a/2129313/2892779
set nocursorcolumn                                 " Enable cursor column highlighting
set nocursorline                                   " Disable line highlighting, for performance
set norelativenumber                               " Disable relative line numbers for performance
set noruler                                        " No ruler needed, because lightline
set noshowmode                                     " Disable current mode, handled by lightline
set nospell                                        " Turn spell checking off by default
set nowrap                                         " Don't wrap lines. Call `:set wrap` to change
set number                                         " Line numbers on
set numberwidth=5                                  " Use 5 characters for number well
set pumheight=10                                   " Limit height of completion popup
" set regexpengine=1                                 " Use old regular expression engine because it's faster
set scrolloff=10                                   " Prevent scrolling past bottom line
set sessionoptions-=options                        " Disable options because sessions capture runtime path
set sessionoptions-=folds                          " FastFold recommended setting to make sure buffer not overwritten in manual
set showtabline=2                                  " Always show a tab line in vim https://stackoverflow.com/a/47129698/2892779
set shiftround                                     " Round indent of shifts
set shiftwidth=2                                   " Round indent to multiples of 2
set showmatch                                      " Briefly show matching brackets
set showcmd                                        " Show leader key and partial commands in the bottom right corner
set shortmess+=c
set signcolumn=auto:4
set smartcase                                      " Don't ignore case if we type a capital
set smarttab                                       " Backspace should delete tabwidth of characters
set softtabstop=2
set splitbelow                                     " Open new split panes to right and bottom
set splitright                                     " Open new split panes to right and bottom
set synmaxcol=512                                  " Don't highlight on lines longer than X chars
set tabstop=2
set textwidth=80                                   " Text width before wrapping
set title                                          " Set the title of the iTerm tab
set undofile                                       " Persistent undo
set undodir=~/.vim/undo                            " Persistent undo directory
set viewoptions=cursor,curdir,folds,unix,slash     " Recommended vim-stay option
set viewoptions-=options                           " Recommended vim-stay option
set viewdir=~/.vim/views
" set viminfo^=!                                     " Add recently accessed projects menu (project plugin)
" set viminfo='100,f1'                               " https://www.linux.com/news/vim-tips-moving-around-using-marks-and-jumps/
set shada=!,'100,<50,s10,h,f1
set visualbell                                     " No visual feedback
" set errorbells
" set belloff=
set writebackup                                    " write backup file before overwriting

" colorscheme dracula
" colorscheme vim-monokai-tasty

filetype plugin on
filetype indent on

augroup vimrc_autocmd
  autocmd!

  " Disable paste mode because I never use it
  " https://github.com/neovim/neovim/issues/7994#issuecomment-388296360
  au InsertLeave * set nopaste

  " https://github.com/neovim/neovim/issues/1936#issuecomment-309311829
  au FocusGained * :checktime

  " Remove trailing whitespace from certain files
  " https://stackoverflow.com/a/19031285/2892779
  autocmd FileType * autocmd BufWritePre <buffer> %s/\s\+$//e

  " Remove extra lines after end/end when writing ruby code
  " autocmd BufWritePre *.rb silent! %s/\v(end\n)(\n+)(\s*end)/\1\3//e

  " Allow Dockerfile to be commented
  " https://github.com/tpope/vim-commentary#faq
  autocmd FileType Dockerfile setlocal commentstring=#\ %s

  " Crystal comments should add comment prefix on newline
  autocmd FileType crystal setlocal formatoptions=jcroql

  " Make fzf quit quickly when esc is pressed
  " https://github.com/junegunn/fzf/issues/1393#issuecomment-426576577
  autocmd! FileType fzf tnoremap <buffer> <esc> <c-c>

  " https://vim.fandom.com/wiki/Folding#Indent_folding_with_manual_folds
  au BufReadPre * setlocal foldmethod=indent
  au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
augroup END

set wildmode=list:longest
set wildmenu
" stuff to ignore when tab completing
set wildignore=*.o,*.obj,*~,*vim/backups*,*sass-cache*,*DS_Store*,vendor/rails/**,vendor/cache/**,*.gem,log/**,tmp/**,*.png,*.jpg,*.gif

" Display tabs & trailing spaces visually
set list listchars=tab:»·,trail:·,nbsp:·

syntax sync minlines=80 " Look back up to X lines for syntax highlighting

" Macros
" Use Q as a default macro. This lets you quickly create a macro with qq & replay it back with Q
noremap Q @q

" ripgrep customization
" http://owen.cymru/fzf-ripgrep-navigate-with-bash-faster-than-ever-before/
let g:rg_command = '
  \ rg --column --line-number --no-heading --fixed-strings --ignore-case --ignore --ignore-global --hidden --no-follow --color "always"
  \ -g "!.git/*"
  \ -g "!.elixir_ls/*"
  \ -g "!spec/vcr/*"
  \ '

" https://github.com/junegunn/fzf.vim/issues/419#issuecomment-479687537
command! -bang -nargs=* Rg
\ call fzf#vim#grep(
\    g:rg_command
\    . (len(<q-args>) > 0 ? shellescape(<q-args>) : '""'), 1,
\ <bang>0 ? fzf#vim#with_preview('up:60%')
\         : fzf#vim#with_preview('right:50%:hidden', '?'),
\ <bang>0)


let g:rg_case_command = '
  \ rg --column --line-number --no-heading --fixed-strings --ignore --ignore-global --hidden --no-follow --color "always"
  \ -g "!.git/*"
  \ -g "!.elixir_ls/*"
  \ -g "!spec/vcr/*"
  \ '

command! -bang -nargs=* Rgg
\ call fzf#vim#grep(
\    g:rg_case_command
\    . shellescape(<q-args>), 1,
\ <bang>0 ? fzf#vim#with_preview('up:60%')
\         : fzf#vim#with_preview('right:50%:hidden', '?'),
\ <bang>0)

" Use a preview window with the Files command
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" This command is used with a shortcut key below to find all occurences of the
" word beneath the cursor
command! -bang -nargs=* Find
\ call fzf#vim#grep(g:rg_command .shellescape(expand('<cword>')), 1,
\ <bang>0 ? fzf#vim#with_preview('up:60%')
\         : fzf#vim#with_preview('right:50%:hidden', '?'),
\ <bang>0)

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" https://github.com/hashrocket/vim-hashrocket/blob/master/plugin/hashrocket.vim#L36
command! -bar -range=% NotRocket :<line1>,<line2>s/:\(\w\+\)\s*=>/\1:/ge

nnoremap K :Find<cr>
" nnoremap <leader>p :Files<cr>
nnoremap <leader>p :Telescope find_files<cr>
nnoremap <leader>b :Buffers<cr>

augroup vim_ruby_group
  autocmd!

  " For shell files, always add a comment leader following <Enter>
  au FileType sh setlocal fo+=r
  au FileType dockerfile setlocal fo+=r

  " Disable highlighting and set folding to indent for schema.rb
  autocmd BufRead,BufNewFile db/schema.rb setlocal syntax=off
  autocmd BufRead,BufNewFile db/schema.rb setlocal nofoldenable

  " Read Envfile as ruby
  au BufRead,BufNewFile Envfile setfiletype ruby
  au BufRead,BufNewFile Brewfile setfiletype ruby

  " Indent haml files
  autocmd FileType haml setlocal foldmethod=indent
  autocmd FileType elixir setlocal foldmethod=syntax

  " vim-ruby completion
  autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
  autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
  autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

  " Disable highlighting for RSpec by default for performance
  " autocmd BufRead,BufNewFile *_spec.rb setlocal syntax=off
  autocmd BufRead,BufNewFile *_spec.rb setlocal foldmethod=indent
augroup END

" lightline
" https://github.com/statico/dotfiles/blob/202e30b23e5216ffb6526cce66a0ef4fa7070456/.vim/vimrc#L406-L453
let g:lightline = {
\ 'active': {
\   'colorscheme': 'monokai_tasty',
\   'left': [['mode', 'paste'], ['fugitive', 'readonly', 'filename', 'modified', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok', 'method']],
\   'right': [['lineinfo'], ['percent'], ['lightline_character', 'fileformat', 'fileencoding', 'filetype']]
\ },
\ 'component': {
\   'readonly': '%{&filetype=="help"?"":&readonly?"🔒":""}',
\   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
\   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
\ },
\ 'component_expand': {
\  'buffers': 'lightline#bufferline#buffers',
\  'linter_checking': 'lightline#ale#checking',
\  'linter_infos': 'lightline#ale#infos',
\  'linter_warnings': 'lightline#ale#warnings',
\  'linter_errors': 'lightline#ale#errors',
\  'linter_ok': 'lightline#ale#ok'
\ },
\ 'component_visible_condition': {
\   'readonly': '(&filetype!="help"&& &readonly)',
\   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
\   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
\ },
\ 'component_type': {
\   'buffers': 'tabsel',
\   'linter_checking': 'right',
\   'linter_infos': 'right',
\   'linter_warnings': 'warning',
\   'linter_errors': 'error',
\   'linter_ok': 'right'
\ },
\ 'component_function': {
\   'filename': 'LightlineFilename',
\   'lightline_character': 'LightLineCharacter',
\   'method': 'NearestMethodOrFunction'
\ },
\ 'enable': {
\   'statusline': 1, 'tabline': 1
\ },
\ 'tabline': {
\   'left': [['buffers']]
\ }
\ }

" Shows a decimal & hex value of the character under cursor
function! LightLineCharacter() abort
  let dec = char2nr(matchstr(getline('.'), '\%' . col('.') . 'c.'))
  return dec . "/0x" . printf('%x', dec)
endfunction

" Full filename path. Requires fugitive
" https://github.com/itchyny/lightline.vim/issues/293#issuecomment-373710096
function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction

" Map ESC in terminal mode to exit terminal mode
tnoremap <esc> <c-\><c-n>

" Yank into the system clipboard
vmap <leader>y "+y

" Open tag/definition in a new tab. Requires vim-ruby
nmap <c-\> <c-w><c-]><c-w>T

" Change the local window current directory to that of current file
nmap <leader>cd lcd %:p:h

" Automatically re-select the visually selected text
" https://superuser.com/a/207521/354661
vnoremap < <gv
vnoremap > >gv

" Automatically highlight the pasted text
" https://stackoverflow.com/a/4313335/2892779
nnoremap <c-p> p`[v`]

let &colorcolumn="120"

" To save a macro and define it here, record the macro as normal, then
" paste it in normal mode using "qp (assuming you used the q register)
" https://stackoverflow.com/a/2024537/2892779

" Convert non-let syntax to let syntax in rspec files
"
" For some reason, vim/neovim/mac insists on adding a ^J to the end of this
" macro even when it's not defined. I have to add some kind of NOOP character
" after the <cr> in order for it to work correctly and not execute CTRL-J,
" which is mapped to swap lines on my setup
let @l = ":DelimitMateOff^ilet(:ea)llxxi{ $a }:DelimitMateOn\<cr>\\"

" Change Rails.logger.info calls to use a block
let @i = ":DelimitMateOff^xxxiRails.logger.info($a):DelimitMateOn\<cr>\\"

" Add a frozen string literal comment to the top of a file
let @f= "gg0ikki# frozen_string_literal_�kb: true``"

" Print all groups being applied
" https://jordanelver.co.uk/blog/2015/05/27/working-with-vim-colorschemes/
command! What echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
" Print out the color syntax group of the highlighted line
" https://github.com/patstockwell/vim-monokai-tasty/blob/master/README.md
command! Whatt echo synIDattr(synID(line('.'), col('.'), 1), 'name')

" https://vi.stackexchange.com/a/440
" Like gJ, but always remove spaces
" fun! JoinSpaceless()
"   execute 'normal gJ'
"
"   " Character under cursor is whitespace?
"   if matchstr(getline('.'), '\%' . col('.') . 'c.') =~ '\s'
"     " When remove it!
"     execute 'normal dw'
"   endif
" endfun

" Map it to a key
nnoremap gJ :call JoinSpaceless()<CR>

augroup AleStuff
  autocmd User ALELint call s:MaybeUpdateLightline()
augroup END

" Update and show lightline but only if it's visible
function! s:MaybeUpdateLightline()
  if exists('#lightline')
    call lightline#update()
  end
endfunction

hi PMenu guibg=#000000 guifg=#dddddd
hi Search cterm=bold ctermfg=22 ctermbg=148 gui=bold guifg=#005f00 guibg=#afdf00
hi incSearch cterm=bold ctermfg=22 ctermbg=148 gui=bold guifg=#005f00 guibg=#afdf00

hi rubyConstant ctermfg=33 guifg=#0087ff
hi rubyClassName ctermfg=148 guifg=#A4E400
hi rubyKeywordAsMethod ctermfg=164 guifg=#df00df

hi Normal guibg=black guifg=white

nmap ,cs :let @*=expand("%")<CR>
nmap ,cl :let @*=expand("%:p")<CR>

" Stuff
"
" Capture keys pressed while editing a vim file (for debugging)
" vi -w keys.txt file_name.rb
"
" Print out a list of all the colors in current syntax groups in a buffer
" :so $VIMRUNTIME/syntax/hitest.vim
