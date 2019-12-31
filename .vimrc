set nocompatible  " We don't want vi compatibility.
" Enable true color support
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  let &t_ZH="\e[3m"
  let &t_ZR="\e[23m"
  set termguicolors
endif

let mapleader=" " " Use the space key as a leader
" Ignore space key in normal mode
nnoremap <SPACE> <Nop>
" Ignore space key in visual mode
vnoremap <SPACE> <Nop>

let g:python3_host_prog = 'python3'
let g:python_host_prog = 'python2'

" Install vim-plug if it's not present
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Use shortcuts gJ and gS to join and split, respectively
Plug 'AndrewRadev/splitjoin.vim' " Convert between do/end and {}

Plug 'airblade/vim-gitgutter'

" Disabled for now; when's the last time I created one of these?
" Plug 'alvan/vim-closetag'
" let g:closetag_filenames = '*.html,*.xhtml,*.html.erb,*.eex'

" Formatting & validating json via :Jacinto
Plug 'alfredodeza/jacinto.vim'

" An improved matchit plugin with additional motions & matchers
Plug 'andymass/vim-matchup'

" Brewfile syntax highlighting
Plug 'bfontaine/brewfile.vim'

" Find and Replace plugin
" https://github.com/brooth/far.vim
Plug 'brooth/far.vim'
let g:far#source = 'rgnvim'

"{{{ Searching
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

" Incremental search
Plug 'haya14busa/is.vim'

" Improved * motions
Plug 'haya14busa/vim-asterisk'
" Keep cursor position across matches
" let g:asterisk#keeppos = 1

map * <Plug>(asterisk-z*)
"<Plug>(is-nohl-1)
" map g* <Plug>(asterisk-gz*)
"<Plug>(is-nohl-1)
map # <Plug>(asterisk-z#)
"<Plug>(is-nohl-1)
" map g# <Plug>(asterisk-gz#)
"<Plug>(is-nohl-1)

" Display current match index & number of times a match occurs with a search
Plug 'google/vim-searchindex'

" Clear search highlighting by pressing //
nnoremap // :noh<cr>
nnoremap <esc><esc> :noh<cr>
"}}}

" Both of these must be installed. Yank and delete blocks of ruby code
" using ar (all block) and ir (inner block). e.g. var/vir/dar/dir
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'

Plug 'editorconfig/editorconfig-Vim'

" Elixir configuration files
Plug 'elixir-editors/vim-elixir', { 'for': 'elixir' }

Plug 'elzr/vim-json', { 'for': 'json' }

" A better plugin for remembering the last place your cursor was. Ignores
" git commit message windows and others
Plug 'farmergreg/vim-lastplace'

Plug 'francoiscabrol/ranger.vim'

Plug 'godlygeek/tabular' " Align text

" Better, automatic swap file management
Plug 'gioele/vim-autoswap'

Plug 'itchyny/lightline.vim'
" Buffer tabs
Plug 'mengelbrecht/lightline-bufferline'
let g:lightline#bufferline#enable_devicons = 1
let g:lightline#bufferline#show_number = 1
let g:lightline#bufferline#unicode_symbols = 1

" Use c-n/c-h to switch buffers
nnoremap <c-n> :bnext<cr>
nnoremap <c-h> :bprev<cr>

" Send to tmux
Plug 'jgdavey/tslime.vim'

Plug 'junegunn/fzf.vim'
" Override and open ctrl-t in a new buffer to help me using buffers
let g:fzf_action = {
  \ 'ctrl-t': 'edit',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

let $FZF_DEFAULT_OPTS='--layout=reverse'
let g:fzf_layout = { 'window': 'call FloatingFZF()' }
function! FloatingFZF()
  let buf = nvim_create_buf(v:false, v:true)
  call setbufvar(buf, '&signcolumn', 'no')

  let height = float2nr(&lines * 0.5)
  let width = float2nr(&columns * 0.6)
  let horizontal = float2nr((&columns - width) / 2)
  let vertical = 1

  let opts = {
        \ 'relative': 'editor',
        \ 'row': vertical,
        \ 'col': horizontal,
        \ 'width': width,
        \ 'height': height
        \ }

  call nvim_open_win(buf, v:true, opts)
endfunction

" Browse git history with :GV
Plug 'junegunn/gv.vim'

" Focus highlighting
Plug 'junegunn/limelight.vim'
nmap <leader>ll <Plug>(Limelight)
xmap <leader>ll <Plug>(Limelight)

" Faster vim, better folding options
Plug 'Konfekt/FastFold'
nmap zuz <Plug>(FastFoldUpdate)
let g:fastfold_savehook = 1
let g:fastfold_fold_command_suffixes =  ['x','X','a','A','o','O','c','C']
let g:fastfold_fold_movement_commands = [']z', '[z', 'zj', 'zk']
let g:markdown_folding = 1
let g:vimsyn_folding = 'af'
" let g:xml_syntax_folding = 1
" let g:javaScript_fold = 1
let g:sh_fold_enabled= 7
let g:ruby_fold = 1

" Automated view session creation & restoration
Plug 'zhimsel/vim-stay'

" Show key mappings
" Plug 'liuchengxu/vim-which-key'
" nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

Plug 'ludovicchabant/vim-gutentags' " Tag creation
let g:gutentags_ctags_exclude=['.git', 'node_modules/**/*', 'tmp', 'frontend/**/*', 'coverage', 'log']
let g:gutentags_gtags_options_file="~/.ctags"
" https://github.com/ludovicchabant/vim-gutentags/issues/178#issuecomment-547475742
let g:gutentags_exclude_filetypes = ['gitcommit', 'gitconfig', 'gitrebase', 'gitsendemail', 'git']
" Type :messages after gutentag loads to see the trace
let g:gutentags_trace=0
let g:gutentags_enabled=1

Plug 'majutsushi/tagbar'

" Format SQL with :SQLFmt. Only works on a whole file, not visual selection
Plug 'mattn/vim-sqlfmt'

" Disabled this for now so I can look at vim-buftabline
" Plug 'matze/vim-move' " Use modifier+j or modifier+k to move a line or selected lines
" On ergodox, this allows the left ctrl key to work as the move key
" let g:move_key_modifier = 'C'

Plug 'mechatroner/rainbow_csv', { 'for': 'csv' }

" Startify provides a page on vim open with recent files, sessions, etc. I
" also use it to automatically update session on vim close
Plug 'mhinz/vim-startify'
let g:startify_session_persistence = 1
let g:startify_list_order = ['sessions', 'files', 'dir', 'bookmarks', 'commands']
let g:startify_change_to_vcs_root = 1 " Always change to vcs root

" Cursorline highlighting. Disabled, because iterm has this natively
" Plug 'miyakogi/conoline.vim'
" let g:conoline_auto_enable = 1

" Add automatic delimiters ([<{, quotes, etc.
Plug 'Raimondi/delimitMate'
let delimitMate_expand_space = 1

" j and k keys move faster when held down
Plug 'rhysd/accelerated-jk'
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)
" default
" let g:accelerated_jk_acceleration_table = [7,12,17,21,24,26,28,30]
let g:accelerated_jk_acceleration_table = [12,17,24,28,34,38,44,48]

" See git diff in commit window as another pane
Plug 'rhysd/committia.vim'
let g:committia_open_only_vim_starting = 1

" Git message viewer with <leader>gm. Requires neovim 0.4+ for floating panel
" Install with brew install neovim --HEAD
Plug 'rhysd/git-messenger.vim'

" Crystal syntax highlighting & support
Plug 'rhysd/vim-crystal', { 'for': 'crystal' }
let g:crystal_define_mappings = 0

Plug 'rizzatti/dash.vim' " Dash integration
nnoremap <leader>d :Dash<cr>

Plug 'scrooloose/nerdtree'
nnoremap <leader>e :NERDTreeToggle<cr>
augroup nerdtree_autocmd
  autocmd!
  " Close vim if the only window left open is NERDtree
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
augroup END
let g:NERDTreeChDirMode = 2

" Use :Silicon <filename> with a visual block highlighted to generate a screenshot image
Plug 'segeljakt/vim-silicon'

Plug 'sheerun/vim-polyglot'
" vim-ruby is already included, this isn't necessary
let g:polyglot_disable = ['ruby']
let g:vim_markdown_conceal = 0
" https://stackoverflow.com/a/44974239/2892779
let g:formatdef_sql = '"sqlformat --reindent --keywords upper - identifiers lower -"'
let g:formatters_sql = ['sql']

Plug 'sjl/gundo.vim' " Visualize your vim undo tree
nnoremap <leader>u :GundoToggle<cr>
let g:gundo_prefer_python3 = 1

" Vim git branch management. Invoke with :Twiggy
Plug 'sodapopcan/vim-twiggy'

" Vim rspec helpers
Plug 'thoughtbot/vim-rspec'
let g:rspec_command = 'call Send_to_Tmux("rspec {spec} --seed 42\n")'
map <leader>t :call RunCurrentSpecFile()<cr>
map <leader>r :call RunNearestSpec()<cr>
map <leader>l :call RunLastSpec()<cr>

" Comment with gc and motion
Plug 'tomtom/tcomment_vim'

" Use :ToGithub to open the current line in your browser
Plug 'tonchis/vim-to-github'

Plug 'tpope/vim-bundler'

" Add Unicode character metadata when using ga
Plug 'tpope/vim-characterize'

Plug 'tpope/vim-dispatch'

Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'tpope/vim-rake'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'

Plug 'vim-ruby/vim-ruby'
" Using vim-ruby, indent per work convention
" let g:ruby_indent_access_modifier_style = 'normal'
" Indent for multi-line statements against left. variable or hanging
let g:ruby_indent_assignment_style = 'variable'
" Indent nested blocks, do or expression
let g:ruby_indent_block_style = 'do'
" Highlight whitespace errors
let g:ruby_space_errors = 1

" Better mark management. Add with m+, delete with m-, toggle with m,
" Display with m? or m~
Plug 'jeetsukumaran/vim-markology'

" Vim understands line & column syntax when opening & editing files
Plug 'wsdjeg/vim-fetch'

Plug 'w0rp/ale'

Plug 'Yggdroot/indentLine'
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

" colorschemes
Plug 'jaydorsey/darkness.vim'
Plug 'rakr/vim-one'
Plug 'sonph/onehalf', { 'rtp': 'vim/' }
" Minimal colorscheme
Plug 'axvr/photon.vim'

Plug 'Shougo/echodoc.vim'

" Highlight vim indent guides
Plug 'nathanaelkane/vim-indent-guides'

Plug 'zxqfl/tabnine-vim'

Plug 'Lenovsky/nuake'

" Plantuml syntax
Plug 'aklt/plantuml-syntax'
if exists("g:loaded_plantuml_plugin")
  finish
endif
let g:loaded_plantuml_plugin = 1
if !exists("g:plantuml_executable_script")
  let g:plantuml_executable_script='/usr/local/bin/plantuml'
endif
let s:makecommand=g:plantuml_executable_script." %"
augroup plantuml
  autocmd!
  autocmd Filetype plantuml let &l:makeprg=s:makecommand
augroup END
nnoremap <F5> :w<CR> :silent make<CR>
inoremap <F5> <Esc>:w<CR>:silent make<CR>
vnoremap <F5> :<C-U>:w<CR>:silent make<CR>

call plug#end()

set autoindent                                     " Automatic indenting/formatting
set autoread                                       " Reload files changed outside of vim
set background=dark                                " Always use colors for dark color schemes
set backup                                         " Make backups
set backupdir=~/.vim/backups                       " Specify backup directory
set backspace=indent,eol,start                     " Backspace configuration
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
set nofoldenable                                   " Fold or don't fold files by default
set formatoptions+=j                               " Join comments better
set grepprg=rg\ --vimgrep\ --no-heading            " Use ripgrep instead of ag for :Ag commands
set grepformat=%f:%l:%c:%m,%f:%l:%m
set guicursor=a:blinkon0-Cursor/Cursor             " Turn off blink for all modes
set guicursor+=i:blinkwait0-blinkon100-blinkoff100 " Turn on blinking in insert mode
set hidden                                         " Required for operations modifying multiple buffers like rename.
set history=10000                                  " Max history
set hlsearch                                       " Highlight matches
set ignorecase                                     " Ignore case when searching...
set incsearch                                      " Find the next match as we type
set nolazyredraw                                   " Disable screen redraw when running macros, for performance
set redrawtime=10000                               " Increase redraw time so syntax highlighting works on larger files
set matchtime=5                                    " Show matching bracket for 0.5 seconds
set mouse=                                         " Disable mouse
set noerrorbells                                   " No sounds
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
set path+=**                                       " Search within subfolders by default
set path-=.git                                     " But ignore these folders
set path-=lib/node_modules
set path-=node_modules
set path-=frontend/dist
set path-=lock
set regexpengine=1                                 " Use old regular expression engine because it's faster
set rtp+=/usr/local/opt/fzf                        " fzf.vim
set scrolloff=10                                   " Prevent scrolling past bottom line
set sessionoptions-=options                        " Disable options because sessions capture runtime path
set sessionoptions-=folds                          " FastFold recommended setting to make sure buffer not overwritten in manual
set showtabline=2                                  " Always show a tab line in vim https://stackoverflow.com/a/47129698/2892779
set shiftround                                     " Round indent of shifts
set shiftwidth=2                                   " Round indent to multiples of 2
set showmatch                                      " Briefly show matching brackets
set showcmd                                        " Show leader key and partial commands in the bottom right corner
set smartcase                                      " Don't ignore case if we type a capital
set smarttab                                       " Backspace should delete tabwidth of characters
set softtabstop=2
set splitbelow                                     " Open new split panes to right and bottom
set splitright                                     " Open new split panes to right and bottom
set synmaxcol=512                                  " Don't highlight on lines longer than X chars
set tabstop=2
set title                                          " Set the title of the iTerm tab
set undofile                                       " Persistent undo
set undodir=~/.vim/undo                            " Persistent undo directory
set viewoptions=cursor,curdir,folds,unix,slash     " Recommended vim-stay option
set viewoptions-=options                           " Recommended vim-stay option
set viewdir=~/.vim/views
set viminfo^=!                                     " Add recently accessed projects menu (project plugin)
set visualbell                                     " No visual feedback
set writebackup                                    " write backup file before overwriting

" tt toggles between current and last tab
let g:lasttab = 1
nnoremap <leader>tt :exe "tabn ".g:lasttab<cr>
au TabLeave * let g:lasttab = tabpagenr()

colorscheme onehalfdark
" colorscheme photon

filetype plugin on
filetype indent on

augroup vimrc_autocmd
  autocmd!

  " Disable paste mode because I never use it
  "
  " https://github.com/neovim/neovim/issues/7994#issuecomment-388296360
  au InsertLeave * set nopaste

  " https://github.com/neovim/neovim/issues/1936#issuecomment-309311829
  au FocusGained * :checktime
  " https://stackoverflow.com/a/19031285/2892779

  " Remove trailing whitespace from certain files
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
augroup END

set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

" Display tabs & trailing spaces visually
set list listchars=tab:»·,trail:·,nbsp:·

syntax on               " Basic syntax
syntax enable           " Basic syntax
syntax sync minlines=80 " Look back up to X lines for syntax highlighting

" Minibuffer Explorer Settings
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
let g:multicursor_insert_maps = 1
let g:multicursor_normal_maps = 1

" Explore shortcut
let g:netrw_liststyle=3

" Use :help instead of f1, which I always hit by accident
noremap <f1> <noop>

" Macros
" Use Q as a default macro. This lets you quickly create a macro with qq & replay it back with Q
noremap Q @q

" ripgrep customization
"
" http://owen.cymru/fzf-ripgrep-navigate-with-bash-faster-than-ever-before/
let g:rg_command = '
  \ rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color "always"
  \ -g "!{.git,log,coverage,node_modules,vendor,frontend,tmp,.yardoc,doc}/*"
  \ -g "!tmux*"
  \ -g "!*.log"
  \ -g "!*.map"
  \ -g "!docs/api/apiary.apib"
  \ -g "!swagger/*"
  \ -g "!storage/*"
  \ -g "!db/data/*"
  \ -g "!package-lock.json"
  \ -g "!tags"
  \ -g "!tags.temp"
  \ -g "!.yardopts"
  \ -g "!yarn.lock"
  \ -g "!spec/vcr/*"
  \ -g "!**/node_modules/*"
  \ -g "!**/tmp/*"
  \ -g "!sales_app/tmp/**"
  \ -g "!sales_app/node_modules/**"
  \ '
  " \ -g "*.{js,json,php,md,styl,jade,html,config,py,cpp,c,go,hs,rb,conf}"

command! -bang -nargs=* Rg
\ call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1,
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

" bind F to ripgrep word under cursor
nnoremap K :Find <cr>
nnoremap <leader>p :Files<cr>
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

  " Indent haml files
  autocmd FileType haml setlocal foldmethod=indent

  " vim-ruby completion
  autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
  autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
  autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

  " Disable highlighting for RSpec by default for performance
  " autocmd BufRead,BufNewFile *_spec.rb setlocal syntax=off
  " autocmd BufRead,BufNewFile *_spec.rb setlocal foldmethod=indent
augroup END

" ALE
" https://github.com/statico/dotfiles/blob/202e30b23e5216ffb6526cce66a0ef4fa7070456/.vim/vimrc#L400-L404
let g:ale_sign_warning = '▲'
let g:ale_sign_error = '✗'
" Always leave sign gutter column open
let g:ale_sign_column_always = 1
highlight link ALEWarningSign String
highlight link ALEErrorSign Title
highlight ALEWarning ctermbg=LightGreen

" let g:ale_ruby_rubocop_executable = '/Users/jay/.asdf/shims/bundle exec rubocop'
let g:ale_ruby_rubocop_executable = '/Users/jay/.asdf/shims/rubocop'
let g:ale_ruby_rubocop_options = ''

" lightline
" https://github.com/statico/dotfiles/blob/202e30b23e5216ffb6526cce66a0ef4fa7070456/.vim/vimrc#L406-L453
let g:lightline = {
\ 'active': {
\   'colorscheme': 'onehalfdark',
\   'left': [['mode', 'paste'], ['fugitive', 'readonly', 'filename', 'modified']],
\   'right': [['lineinfo'],
\             ['percent'],
\             ['currentfunction', 'lightline_character', 'fileformat', 'fileencoding', 'filetype', 'linter_warnings', 'linter_errors', 'linter_ok']]
\ },
\ 'component': {
\   'readonly': '%{&filetype=="help"?"":&readonly?"🔒":""}',
\   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
\   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
\ },
\ 'component_expand': {
\   'buffers': 'lightline#bufferline#buffers',
\   'linter_warnings': 'LightlineLinterWarnings',
\   'linter_errors': 'LightlineLinterErrors',
\   'linter_ok': 'LightlineLinterOK'
\ },
\ 'component_visible_condition': {
\   'readonly': '(&filetype!="help"&& &readonly)',
\   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
\   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
\ },
\ 'component_type': {
\   'buffers': 'tabsel',
\   'linter_warnings': 'warning',
\   'linter_errors': 'error'
\ },
\ 'component_function': {
\   'lightline_character': 'LightLineCharacter',
\   'filename': 'LightlineFilename'
\ },
\ 'enable': {
\   'statusline': 1, 'tabline': 1
\ },
\ 'tabline': {
\   'left': [['buffers']], 'right': [['close']]
\ }
\ }

function! LightlineLinterWarnings() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ◆', all_non_errors)
endfunction

" Shows a decimal & hex value of the currently selected character
function! LightLineCharacter() abort
  let dec = char2nr(matchstr(getline('.'), '\%' . col('.') . 'c.'))
  return dec . "/0x" . printf('%x', dec)
endfunction

function! LightlineLinterErrors() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ✗', all_errors)
endfunction

function! LightlineLinterOK() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '✓ ' : ''
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

augroup AleStuff
  autocmd User ALELint call s:MaybeUpdateLightline()
augroup END

" Update and show lightline but only if it's visible
function! s:MaybeUpdateLightline()
  if exists('#lightline')
    call lightline#update()
  end
endfunction

" Map ESC in terminal mode to exit terminal mode
tnoremap <esc> <c-\><c-n>

" Disable these keys in normal mode because it makes my cursor jump all over
" the place when I hit the wrong keys
nmap { <ESC>
nmap } <ESC>

" Yank into the system clipboard
vmap <leader>y "+y

" Open tag/definition in a new tab. Requires vim-ruby
nmap <c-\> <c-w><c-]><c-w>T

" Disable Shift + up/down arrow. It makes me jump around and I don't want to
nnoremap <S-Up> <Nop>
nnoremap <S-Down> <Nop>
vnoremap <S-Up> <Nop>
vnoremap <S-Down> <Nop>
inoremap <S-Up> <Nop>
inoremap <S-Down> <Nop>

" Edit/save and automatically reload vimrc file
" https://stackoverflow.com/a/39294493/2892779
nnoremap gev :e ~/.vimrc<cr>
nnoremap gsv :so ~/.vimrc<cr>
if has ('autocmd') " Remain compatible with earlier versions
 augroup vimrc     " Source vim configuration upon save
    autocmd! BufWritePost ~/.vimrc nested source % | tabdo e
  augroup END
endif

" Change the local window current directory to that of current file
nmap <leader>cd lcd %:p:h

" Automatically re-select the visually selected text
" https://superuser.com/a/207521/354661
vnoremap < <gv
vnoremap > >gv

" Automatically highlight the pasted text
" https://stackoverflow.com/a/4313335/2892779
nnoremap <c-p> p`[v`]

" Highlight the column at 120
highlight ColorColumn ctermbg=DarkRed guibg=#ffa3fe
let &colorcolumn="120"

highlight rubyComment ctermfg=247 ctermbg=236 guifg=#919baa guibg=#282c34
highlight vimLineComment ctermfg=247 ctermbg=236 guifg=#919baa guibg=#282c34
highlight Comment ctermfg=247 ctermbg=236 guifg=#919baa guibg=#282c34
highlight rubyComment cterm=italic term=italic gui=italic
highlight vimLineComment cterm=italic term=italic gui=italic
highlight Comment cterm=italic term=italic gui=italic
highlight rubyBoolean cterm=italic term=italic gui=italic guifg=Yellow

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

" Print out the color syntax group of the highlighted line
" https://github.com/patstockwell/vim-monokai-tasty/blob/master/README.md
command! What echo synIDattr(synID(line('.'), col('.'), 1), 'name')

" Change colors of current incremental search result and all search results
hi! link Search PMenu
hi! link IncSearch PMenuSel
highlight NormalFloat cterm=NONE ctermfg=14 ctermbg=0 gui=NONE guifg=#93a1a1 guibg=#002931

" https://vi.stackexchange.com/a/440
" Like gJ, but always remove spaces
fun! JoinSpaceless()
    execute 'normal gJ'

    " Character under cursor is whitespace?
    if matchstr(getline('.'), '\%' . col('.') . 'c.') =~ '\s'
        " When remove it!
        execute 'normal dw'
    endif
endfun

" Map it to a key
nnoremap gJ :call JoinSpaceless()<CR>

" Stuff
"
" Capture keys pressed while editing a vim file (for debugging)
" vi -w keys.txt file_name.rb
