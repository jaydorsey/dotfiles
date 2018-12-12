set nocompatible  " We don't want vi compatibility.
set termguicolors " Enable true color support
set t_Co=256

let mapleader=" " " Use the space key as a leader
" Ignore space key in normal mode
nnoremap <SPACE> <Nop>
" Ignore space key in visual mode
vnoremap <SPACE> <Nop>

let g:python3_host_prog = '/usr/local/bin/python3'
let g:python_host_prog = '/usr/local/bin/python'

" Install vim-plug if it's not present
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

" Plugins I'm not using for one reason or another. These are either not
" maintained, incompatible with something, or I don't use them in my workflow
"
" Plug 'arnar/vim-matchopen' " Highlight the last opened tag
" Plug 'chun-yang/auto-pairs' "
"" Plug 'ervandew/supertab' " Supertab, an omnicomplete popup menu. Conflicts with Deoplete
" http://vim.wikia.com/wiki/Omni_completion_popup_menu
" let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
" let g:SuperTabDefaultCompletionType = "context"
" let g:SuperTabContextDefaultCompletionType = "<C-N>"
" Plug 'haya14busa/is.vim' " I don't use this at all
" Plug 'junegunn/vim-easy-align' " I don't use this. I use tabularize instead
" Plug 'maxbrunsfeld/vim-yankstack' " I don't use this
" Plug 'mustache/vim-mustache-handlebars' " I don't use this
" Plug 'mxw/vim-jsx' I don't use this
" Plug 'nathanaelkane/vim-indent-guides' " Performance
" Plug 'ngmy/vim-rubocop' Included with ale already
" Plug 'Raimondi/delimitMate' " Add automatic delimiters ([<{, quotes, etc.  Doesn't work quite right with Deoplete
" Plug 'ryanoasis/vim-devicons' " Add icons to plugins. This needs to be loaded last. I don't use this because it doesn't work
" Plug 'thoughtbot/vim-rspec' " Rspec runner. I run my specs manually
" let g:rspec_runner = "os_x_iterm2"
" Plug 'Townk/vim-autoclose' " Automatically close bracket pairs
" Plug 'xolox/vim-easytags' " Automatically generate tags files. I use gutentags instead

" Use shortcuts gJ and gS to join and split, respectively
Plug 'AndrewRadev/splitjoin.vim' " Convert between do/end and {}

Plug 'airblade/vim-gitgutter'

Plug 'alvan/vim-closetag'
let g:closetag_filenames = '*.html,*.xhtml,*.html.erb,*.eex'

Plug 'bfontaine/brewfile.vim' " Brewfile syntax highlighting

Plug 'blueyed/vim-diminactive' " Disable syntax highlight for inactive windows
let g:diminactive_use_syntax = 1

Plug 'bronson/vim-trailing-whitespace' " Highlights trailing whitespace in red

Plug 'chiel92/vim-autoformat'
let g:formatterpath = ['/Users/jay/.asdf/shims/ruby-beautify']

Plug 'editorconfig/editorconfig-Vim'

Plug 'elixir-editors/vim-elixir', { 'for': 'elixir' } " Elixir configuration files

Plug 'elzr/vim-json'

Plug 'francoiscabrol/ranger.vim'

Plug 'godlygeek/tabular' " Align text
nmap <Leader>t= :Tabularize /=<cr>
vmap <Leader>t= :Tabularize /=<cr>
nmap <Leader>t" :Tabularize /"<cr>
vmap <Leader>t" :Tabularize /"<cr>
nmap <Leader>t: :Tabularize /:\zs<cr>
vmap <Leader>t: :Tabularize /:\zs<cr>
nmap <Leader>t> :Tabularize /=><cr>
vmap <Leader>t> :Tabularize /=><cr>
nmap <Leader>t, :Tabularize /,\zs<cr>
vmap <Leader>t, :Tabularize /,\zs<cr>
nmap <Leader>t- :Tabularize / -><cr>
vmap <Leader>t- :Tabularize / -><cr>

Plug 'guns/xterm-color-table.vim' " View xterm colors with :XtermColorTable

Plug 'itchyny/lightline.vim'

Plug 'juanibiapina/vim-lighttree' " LightTree is an in-window file explorer
map <leader>e :LightTree<cr>

Plug 'junegunn/fzf.vim'

Plug 'junegunn/gv.vim' " Browse git history with :GV

Plug 'ludovicchabant/vim-gutentags' " Tag creation
let g:gutentags_ctags_exclude=['.git', 'node_modules/**/*', 'tmp', 'frontend/**/*', 'coverage', 'log']
let g:gutentags_gtags_options_file="~/.ctags"
" Type :messages after gutentag loads to see the trace
let g:gutentags_trace=0
let g:gutentags_enabled=0

Plug 'luochen1990/rainbow'
let g:rainbow_active = 1

Plug 'majutsushi/tagbar' " Tag browsing & grouping
let g:tagbar_autofocus = 1
let g:tagbar_autoclose = 1
let g:tagbar_ctags_bin = 'ctags'
nmap <end> :TagbarToggle<cr>
let g:tagbar_type_elixir = {
    \ 'ctagstype' : 'elixir',
    \ 'kinds' : [
        \ 'f:functions',
        \ 'functions:functions',
        \ 'c:callbacks',
        \ 'd:delegates',
        \ 'e:exceptions',
        \ 'i:implementations',
        \ 'a:macros',
        \ 'o:operators',
        \ 'm:modules',
        \ 'p:protocols',
        \ 'r:records',
        \ 't:tests'
    \ ]
    \ }

let g:tagbar_type_ruby = {
    \ 'kinds' : [
        \ 'm:modules',
        \ 'c:classes',
        \ 'F:singleton methods',
        \ 'f:methods',
        \ 'a:aliases',
        \ 's:symbols',
        \ 'd:describes',
        \ 'C:contexts',
        \ 'i:its',
        \ '?:unknown',
    \ ],
    \ 'kind2scope': { 'c' : 'class', 'm': 'class' },
    \ 'scope2kind': { 'class' : 'c' },
        \ }

Plug 'matze/vim-move' " Use modifier+j or modifier+k to move a line or selected lines
" On ergodox, this allows the left ctrl key to work as the move key
let g:move_key_modifier = 'C'

Plug 'mechatroner/rainbow_csv', { 'for': 'csv' }

Plug 'mhinz/vim-startify' " Always update session on vim close
let g:startify_session_persistence = 1
let g:startify_list_order = ['sessions', 'files', 'dir', 'bookmarks', 'commands']

" j and k keys move faster when held down
Plug 'rhysd/accelerated-jk'
nmap k <Plug>(accelerated_jk_gk)
nmap j <Plug>(accelerated_jk_gj)

Plug 'rhysd/committia.vim' " See git diff in commit window as another pane

Plug 'rizzatti/dash.vim' " Dash integration
nnoremap <leader>d :Dash<cr>

Plug 'sheerun/vim-polyglot'

Plug 'sjl/gundo.vim' " Visualize your vim undo tree
nnoremap <leader>u :GundoToggle<cr>
let g:gundo_prefer_python3 = 1

Plug 'slashmili/alchemist.vim', { 'for': 'elixir' } " Elixir project integration

" Press `v` multiple times to expand the selected region in visual mode
" Plug 'terryma/vim-expand-region'
" vmap v <Plug>(expand_region_expand)
" vmap <leader>v <Plug>(expand_region_shrink)

Plug 'tomtom/tcomment_vim'

Plug 'tpope/vim-bundler'

Plug 'tpope/vim-characterize' " Add Unicode character metadata when using ga
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-ruby/vim-ruby'

Plug 'w0rp/ale'

Plug 'Yggdroot/indentLine' " Display thin vertical lines at code indentation levels

" Themes

" Plug 'ayu-theme/ayu-vim'
" Plug 'baskerville/bubblegum'
" Plug 'jeffkreeftmeijer/vim-dim'
" Plug 'nanotech/jellybeans.vim'
" Plug 'squarefrog/tomorrow-night.vim'
Plug 'w0ng/vim-hybrid'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }
let g:deoplete#enable_at_startup = 1
let g:deoplete#ignore_sources = get(g:,'deoplete#ignore_sources',{})
" Disable tags file as a source
let g:deoplete#ignore_sources.ruby = ['tag']

" Use <tab> key to step into the selections
inoremap <expr><tab>  pumvisible() ? "\<c-n>" : "\<tab>"
call plug#end()

set autoindent                                     " Automatic indenting/formatting
set autoread                                       " Reload files changed outside of vim
set background=dark                                " Always use colors for dark color schemes
set backup                                         " Make backups
set backupdir=~/.vim/backups                       " Specify backup directory
set backspace=indent,eol,start                     " Backspace configuration
set cindent
set colorcolumn=80,120                             " Add color markers to columns to identify where wraps should occur
set directory=~/.vim/tmp                           " List of directory names for the swap file, separated by commas
set encoding=utf-8                                 " Always UTF-8 enoding
set eol                                            " include a new line at EOF
set expandtab                                      " Expand tabs to spaces
" set foldcolumn=2
set foldnestmax=12                                 " Deepest fold
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
set nocursorcolumn                                 " Enable cursor column highlighting
set nocursorline                                     " Disable line highlighting, for performance
set nofoldenable                                   " Don't fold files by default
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
set sessionoptions+=folds                          " Include folds between sessions
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
set synmaxcol=256                                  " Don't highlight on lines longer than X chars
set tabstop=2
set title                                          " Set the title of the iTerm tab
set ttyfast
set undofile                                       " Persistent undo
set undodir=~/.vim/undo                            " Persistent undo directory
set viewoptions=cursor,curdir,folds,unix,slash
set viewdir=~/.vim/views
set viminfo^=!                                     " Add recently accessed projects menu (project plugin)
set visualbell                                     " No visual feedback

" tt toggles between current and last tab
let g:lasttab = 1
nnoremap <leader>tt :exe "tabn ".g:lasttab<cr>
au TabLeave * let g:lasttab = tabpagenr()
nnoremap <leader>n :tabnext<cr>
nnoremap <leader>tn :tabnew<cr> " Open a new tab
" Opens a new tab with the current buffer's path
nnoremap <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

colorscheme hybrid

" Using vim-ruby, indent per work convention
let g:ruby_indent_access_modifier_style="normal"
" Highlight whitespace errors
let g:ruby_space_errors = 1

" htt://vim.wikia.com/wiki/Fix_indentation
" Format file with indention settings
map <leader>7 mzgg=G`z

filetype plugin on
filetype indent on

augroup vimrc_autocmd
  autocmd!

  " http://vim.wikia.com/wiki/Make_views_automatic
  autocmd BufWinLeave,BufLeave,BufWritePost ?* nested silent! mkview!
  autocmd BufWinEnter ?* silent! loadview

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
syntax sync minlines=32 " Look back up to X lines for syntax highlighting

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
" Use Q as a default macro. This lets you quickly create a macro with qq, then
" quit it with q, then replay it back with Q
noremap Q @q

" Clear search highlighting by pressing //
noremap // :noh<cr>

" ripgrep customization
"
" http://owen.cymru/fzf-ripgrep-navigate-with-bash-faster-than-ever-before/
let g:rg_command = '
  \ rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color "always"
  \ -g "!{.git,log,coverage,node_modules,vendor,frontend,tmp}/*"
  \ -g "!tmux*"
  \ -g "!*.log"
  \ -g "!docs/api/apiary.apib"
  \ -g "!docs/api/index.html"
  \ -g "!db/data/*"
  \ -g "!tags"
  \ -g "!tags.temp"
  \ -g "!spec/vcr/*"
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

" Pretty format json!
" https://til.hashrocket.com/posts/ha0ci0pvkj-format-json-in-vim-with-jq
" nnoremap <C-p> :%!jq '.'<cr>

augroup vim_ruby_group
  autocmd!

  " Start on last line edited
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

  " For shell files, always add a comment leader following <Enter>
  au FileType sh setlocal fo+=r
  au FileType dockerfile setlocal fo+=r

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

let g:ale_ruby_rubocop_executable = '/Users/jay/.asdf/shims/rubocop'
let g:ale_ruby_rubocop_options = ''

" Lightline
" https://github.com/statico/dotfiles/blob/202e30b23e5216ffb6526cce66a0ef4fa7070456/.vim/vimrc#L406-L453
let g:lightline = {
\ 'colorscheme': 'jay',
\ 'active': {
\   'left': [['mode', 'paste'], ['fugitive', 'readonly', 'filename', 'modified']],
\   'right': [['lineinfo'],
\             ['percent'],
\             ['lightline_character', 'fileformat', 'fileencoding', 'filetype', 'linter_warnings', 'linter_errors', 'linter_ok']]
\ },
\ 'component': {
\   'readonly': '%{&filetype=="help"?"":&readonly?"🔒":""}',
\   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
\   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
\ },
\ 'component_expand': {
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
\   'linter_warnings': 'warning',
\   'linter_errors': 'error'
\ },
\ 'component_function': {
\   'lightline_character': 'LightLineCharacter',
\   'filename': 'LightlineFilename'
\ },
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

" Update and show lightline but only if it's visible (e.g., not in Goyo)
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

" Call _ before a brace on a visual selection to add wrapped pair
vnoremap _( <Esc>`>a)<Esc>`<i(<Esc>
vnoremap _[ <Esc>`>a]<Esc>`<i[<Esc>
vnoremap _< <Esc>`>a><Esc>`<i<<Esc>
vnoremap _{ <Esc>`>a}<Esc>`<i{<Esc>

" Change line numbers so they're readable https://stackoverflow.com/a/32128209/2892779
highlight LineNr term=bold cterm=NONE ctermfg=LightGrey ctermbg=NONE gui=NONE guifg=Grey80 guibg=NONE
" Grey comments for certain themes
" highlight Comment term=bold cterm=NONE ctermfg=LightGrey ctermbg=NONE gui=NONE guifg=Grey50 guibg=NONE

" Edit/save and automatically reload vimrc file
" https://stackoverflow.com/a/39294493/2892779
nnoremap gev :e ~/.vimrc<cr>
nnoremap gsv :so ~/.vimrc<cr>
if has ('autocmd') " Remain compatible with earlier versions
 augroup vimrc     " Source vim configuration upon save
    autocmd! BufWritePost ~/.vimrc nested source % | tabdo e
  augroup END
endif " has autocmd

" Change the local window current directory to that of current file
nmap <leader>cd lcd %:p:h

" https://stackoverflow.com/q/4256697/2892779
" When pressing * or #, highlight current word and move to beginning of word,
" but don't jump to next occurence
" Also can use viwo<esc> instead of lb
nnoremap * m`:keepjumps normal! *``<cr>lb
nnoremap # m`:keepjumps normal! #``<cr>lb

" Automatically re-select the visually selected text
" https://superuser.com/a/207521/354661
vnoremap < <gv
vnoremap > >gv

" Automatically highlight the pasted text
" https://stackoverflow.com/a/4313335/2892779
nnoremap <c-p> p`[v`]

" Convert non-let syntax to let syntax in rspec files
let @l = '^ilet(:f i)llxi{$a }'
" Stuff
"
" Capture keys pressed while editing a vim file (for debugging)
" vi -w keys.txt file_name.rb
