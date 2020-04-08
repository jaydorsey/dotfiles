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

let g:python3_host_prog = '/usr/local/bin/python3'
let g:python_host_prog = '/usr/local/bin/python3'

let g:ruby_path="/Users/jay/.asdf/shims/ruby"
let g:ruby_default_path="/Users/jay/.asdf/shims/ruby"
let g:ruby_host_prog="/Users/jay/.asdf/shims/neovim-ruby-host"

call plug#begin('~/.vim/plugged')

Plug 'tarekbecker/vim-yaml-formatter', { 'for': 'yaml' }
let g:yaml_formatter_indent_collection=1

" Use shortcuts gJ and gS to join and split, respectively
Plug 'AndrewRadev/splitjoin.vim'

" Plug 'airblade/vim-rooter'
" " let g:rooter_targets = 'hapi_server'
" let g:rooter_patterns = ['.git/']

Plug 'airblade/vim-gitgutter'

Plug 'scrooloose/nerdtree'
nnoremap <leader>e :NERDTreeToggle<cr>
let g:NERDTreeChDirMode = 2

" Formatting & validating json via :Jacinto
Plug 'alfredodeza/jacinto.vim', { 'for': 'json' }

" An improved matchit plugin with additional motions & matchers
Plug 'andymass/vim-matchup'

Plug 'Chrisbra/Colorizer'

Plug 'dense-analysis/ale'
let g:ale_sign_column_always = 1
let g:ale_sign_warning = ''
let g:ale_sign_error = ''
let g:ale_ruby_rubocop_executable = '/Users/jay/.asdf/shims/rubocop'

" Clone & compile
let g:ale_elixir_elixir_ls_release = '/Users/jay/dev/elixir-ls/release'

let g:ale_fix_on_save = 1
let g:ale_elixir_mix_options = "/Users/jay/.asdf/shims/mix"

      " \ 'elixir': ['credo', 'dialyxir', 'dogma', 'elixir-ls', 'mix'],
let g:ale_linters = {
      \ 'elixir': ['elixir-ls', 'mix'],
      \ 'ruby': ['rubocop']
      \}

let g:ale_fixers = {
      \ 'elixir': [
      \   'mix_format',
      \   'remove_trailing_lines',
      \   'trim_whitespace'
      \ ],
      \ '*': [
      \   'remove_trailing_lines',
      \   'trim_whitespace'
      \ ]
      \}

" let g:ale_echo_msg_error_str = 'E'
" let g:ale_echo_msg_warning_str = 'W'
" let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

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

" Better, automatic swap file management
Plug 'gioele/vim-autoswap'

" Nicer scrolling with CTRL-d/u
Plug 'yuttie/comfortable-motion.vim'

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

" Completion support
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = [
      \ 'coc-marketplace',
      \ 'coc-tabnine',
      \ 'coc-solargraph',
      \ 'coc-json',
      \ 'coc-yaml',
      \ 'coc-bookmark',
      \ 'coc-actions',
      \ 'coc-explorer',
      \ 'coc-git',
      \ 'coc-highlight',
      \ 'coc-snippets'
      \ ]

" Send to tmux
Plug 'jgdavey/tslime.vim'

" Extends " and @ in normal mode to auto-show registers
Plug 'junegunn/vim-peekaboo'

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
  let width = float2nr(&columns * 0.8)
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

" Tag creation
Plug 'ludovicchabant/vim-gutentags'
let g:gutentags_ctags_exclude=['.git', 'node_modules/**/*', 'tmp', 'frontend/**/*', 'coverage', 'log']
let g:gutentags_gtags_options_file="~/.ctags"
" https://github.com/ludovicchabant/vim-gutentags/issues/178#issuecomment-547475742
let g:gutentags_exclude_filetypes = ['gitcommit', 'gitconfig', 'gitrebase', 'gitsendemail', 'git']
" Type :messages after gutentag loads to see the trace
let g:gutentags_trace=0
let g:gutentags_enabled=1

" Add automatic delimiters ([<{, quotes, etc.
Plug 'Raimondi/delimitMate'
let delimitMate_expand_space = 1

" See git diff in commit window as another pane
" Plug 'rhysd/committia.vim'
Plug 'jaydorsey/committia.vim', {'branch': 'jay/variable_editor_width'}
let g:committia_open_only_vim_starting = 1
let g:committia_edit_window_width = 90

" Git message viewer with <leader>gm. Requires neovim 0.4+ for floating panel
" Install with brew install neovim --HEAD
Plug 'rhysd/git-messenger.vim'

" Crystal syntax highlighting & support
Plug 'rhysd/vim-crystal', { 'for': 'crystal' }
let g:crystal_define_mappings = 0

" Dash integration
Plug 'rizzatti/dash.vim'
nnoremap <leader>d :Dash<cr>

let g:polyglot_disabled = ['yard']
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
let g:rspec_command = 'call Send_to_Tmux("rspec {spec} --seed 42\n")'
map <leader>t :call RunCurrentSpecFile()<cr>
map <leader>r :call RunNearestSpec()<cr>
map <leader>l :call RunLastSpec()<cr>

" Comment with gc and motion
Plug 'tomtom/tcomment_vim'

" Use :ToGithub to open the current line in your browser
Plug 'tonchis/vim-to-github'

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

" Plug 'zxqfl/tabnine-vim'

call plug#end()

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

" nnoremap <silent> J :call <SID>show_documentation()<CR>

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
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
" nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>

" Disabled shortcuts
" Resume latest coc list.
" nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
" Manage extensions.
" nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>

"
" coc.vim sample config end
"

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
set nofoldenable                                   " Fold or don't fold files by default
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
set matchtime=5                                    " Show matching bracket for 0.5 seconds
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
set shortmess+=c
set signcolumn=yes
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
" set errorbells
" set belloff=
set writebackup                                    " write backup file before overwriting

" colorscheme dracula
colorscheme vim-monokai-tasty

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
  \ -g "!spec/vcr/*"
  \ '

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

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

nnoremap K :Find<cr>
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
  " autocmd BufRead,BufNewFile *_spec.rb setlocal foldmethod=indent
augroup END

" lightline
" https://github.com/statico/dotfiles/blob/202e30b23e5216ffb6526cce66a0ef4fa7070456/.vim/vimrc#L406-L453
let g:lightline = {
\ 'active': {
\   'colorscheme': 'monokai_tasty',
\   'left': [['mode', 'paste'], ['fugitive', 'readonly', 'filename', 'modified', 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok']],
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
\   'lightline_character': 'LightLineCharacter'
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

let &colorcolumn="130"

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
let @i = ":DelimitMateOff^xxxiRails.logger.info($a):DelimitMateOn\<cr>\\"

" Print all groups being applied
" https://jordanelver.co.uk/blog/2015/05/27/working-with-vim-colorschemes/
command! What echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
" Print out the color syntax group of the highlighted line
" https://github.com/patstockwell/vim-monokai-tasty/blob/master/README.md
command! Whatt echo synIDattr(synID(line('.'), col('.'), 1), 'name')

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

nmap ,cs :let @*=expand("%")<CR>
nmap ,cl :let @*=expand("%:p")<CR>

" Stuff
"
" Capture keys pressed while editing a vim file (for debugging)
" vi -w keys.txt file_name.rb
"
" Print out a list of all the colors in current syntax groups in a buffer
" :so $VIMRUNTIME/syntax/hitest.vim
