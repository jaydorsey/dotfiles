local o = vim.o
local wo = vim.wo
local bo = vim.bo

vim.opt.termguicolors = true

vim.cmd [[colorscheme catppuccino]]

vim.cmd [[filetype plugin indent on]]
vim.cmd [[syntax on]]

vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 blend=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B blend=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 blend=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 blend=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF blend=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD blend=nocombine]]

vim.opt.listchars = {
  space = '⋅',   
  trail = '⋅',   
  nbsp = '⋅',   
  eol = '↴',
  tab = '»»'
}

vim.wo.list = true

-- vim.cmd [[let g:indent_blankline_use_treesitter = v:true]]
-- vim.cmd [[let g:indent_blankline_enabled = v:false]]
-- vim.cmd [[let g:indent_blankline_show_current_context = v:false]]
-- vim.cmd [[let g:indent_blankline_show_first_indent_level = v:false]]
-- vim.cmd [[let g:indent_blankline_viewport_buffer = 5]]
-- vim.cmd [[let g:indent_blankline_show_end_of_line = v:true]]
-- vim.cmd [[let g:indent_blankline_strict_tabs = v:true]]

vim.opt.autoindent = true -- Automatic indenting/formatting
vim.opt.autoread = true -- Reload files changed outside of vim

-- This doesn't work for some reason
-- o.backup = true -- Make backups
-- o.backupdir="~/.vim/backups" -- Specify backup directory
-- o.backupdir = vim.fn.stdpath('data') .. '/backup'
-- if not vim.fn.isdirectory(o.backupdir) then
--   vim.fn.mkdir(o.backupdir, 'p')
-- end

--o.backspace=indent,eol,start -- Backspace configuration
o.cmdheight = 2 -- More space for messages
o.laststatus = 2
--o.concealcursor=nv -- From vim-markdown, conceals links, headings, etc in normal & visual mode
o.conceallevel=0 -- Expand everything, particularly in markdown files
o.swapfile = true -- use a swap file
o.directory='/tmp' -- List of directory names for the swap file, separated by commas
--o.encoding=utf-8 -- Always UTF-8 enoding
o.eol = true -- include a new line at EOF
o.expandtab = true -- Expand tabs to spaces

-- o.fillchars="eob:\ ," -- Fill empty gutter lines with nothing

--o.foldmethod=expr -- for treesitter
-- o.foldexpr=nvim_treesitter#foldexpr() -- for treesitter

o.foldcolumn = "2"
--o.foldlevel=2
--o.foldlevelstart=99 -- Edit with all folds open when opening a file
--o.foldnestmax=12 -- Deepest fold
o.foldenable = true -- Fold or don't fold files by default
-- o.formatoptions+=j -- Join comments better
-- o.grepprg=rg\ \-\-vimgrep\ \-\-no-heading -- Use ripgrep instead of ag for :Ag commands
-- o.grepformat=%f:%l:%c:%m,%f:%l:%m
--" set guicursor=a:blinkon0-Cursor/Cursor             " Turn off blink for all modes
--" set guicursor+=i:blinkwait0-blinkon100-blinkoff100 " Turn on blinking in insert mode
--" set guicursor=n-v-c:block-Cursor/lCursor,i-ci-ve:ver25-Cursor2/lCursor2,r-cr:hor20,o:hor50
o.hidden = true -- Required for operations modifying multiple buffers like rename.
o.history=500 -- Max history
o.hlsearch = true -- Highlight matches
o.ignorecase = true -- Ignore case when searching...
o.incsearch = true -- Find the next match as we type
--o.nolazyredraw = true -- Disable screen redraw when running macros, for performance
--o.redrawtime=10000 -- Increase redraw time so syntax highlighting works on larger files
--o.matchtime=10 -- Show matching bracket for 1 second
--o.mouse="" -- Disable mouse
--o.nocindent = true -- Don't indent text with parentheses https://stackoverflow.com/a/2129313/2892779
--o.nocursorcolumn = true -- Enable cursor column highlighting
--o.nocursorline = true -- Disable line highlighting, for performance
--o.norelativenumber = true -- Disable relative line numbers for performance
--o.noruler = true -- No ruler needed, because lightline
--o.noshowmode = true -- Disable current mode, handled by lightline
--o.nospell = true -- Turn spell checking off by default
o.wrap = false-- Don't wrap lines. Call `:set wrap` to change
o.numberwidth=5 -- Use 5 characters for number well
--o.pumheight=10 -- Limit height of completion popup
o.scrolloff=10 -- Prevent scrolling past bottom line
--o.sessionoptions-=options -- Disable options because sessions capture runtime path
--o.sessionoptions-=folds -- FastFold recommended setting to make sure buffer not overwritten in manual
o.showtabline=2 -- Always show a tab line in vim https://stackoverflow.com/a/47129698/2892779
o.shiftround = true -- Round indent of shifts
o.shiftwidth=2 -- Round indent to multiples of 2
o.showmatch = true -- Briefly show matching brackets
o.showcmd = true -- Show leader key and partial commands in the bottom right corner
--o.shortmess+=c
--o.signcolumn=auto:4
o.smartcase = true -- Don't ignore case if we type a capital
o.smarttab = true -- Backspace should delete tabwidth of characters
o.softtabstop=2
o.splitbelow = true -- Open new split panes to right and bottom
o.splitright = true -- Open new split panes to right and bottom
o.synmaxcol=512 -- Don't highlight on lines longer than X chars
o.tabstop=2
o.textwidth=120 -- Text width before wrapping
o.title = true -- Set the title of the iTerm tab
o.undofile = true -- Persistent undo
-- TODO: Figure out where to send this
-- o.undodir=".vim/undo" -- Persistent undo directory
--o.viewoptions=cursor,curdir,folds,unix,slash -- Recommended vim-stay option
--o.viewoptions-=options -- Recommended vim-stay option
--o.viewdir="~/.vim/views"
--" set viminfo^=!                                     " Add recently accessed projects menu (project plugin)
--" set viminfo='100,f1'                               " https://www.linux.com/news/vim-tips-moving-around-using-marks-and-jumps/
--o.shada=!,'100,<50,s10,h,f1
o.visualbell = true -- No visual feedback
o.errorbells = false
-- set errorbells
-- set belloff=
-- o.writebackup = true -- write backup file before overwriting


wo.number = true -- Line numbers on
vim.wo.colorcolumn = "120"

-- g.python3_host_prog = vim.env.HOME .. '/leet/vim-python3/bin/python3'

-- delimtmate
vim.cmd('let g:delimitMate_expand_space = 1')

-- committia
vim.cmd('let g:committia_open_only_vim_starting = 1')
vim.cmd('let g:committia_edit_window_width = 120')

-- quick-scope
vim.cmd("let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']")

-- let g:python3_host_prog=escape(expand('$HOME'), '\') . '/.asdf/shims/python'
-- let g:python_host_prog=escape(expand('$HOME'), '\') . '/.asdf/shims/python'

-- let g:ruby_path=escape(expand('$HOME'), '\') . '/.asdf/shims/ruby'
-- let g:ruby_default_path=escape(expand('$HOME'), '\') . '/.asdf/shims/ruby'
-- let g:ruby_host_prog=escape(expand('$HOME'), '\') . '/.asdf/shims/neovim-ruby-host'

-- let g:yaml_formatter_indent_collection=1
-- let g:EasyMotion_smartcase = 1
-- let g:EasyMotion_do_mapping = 0 " Disable default mappings
-- let g:blamer_enabled = 1
-- let g:blamer_delay = 500
-- let g:blamer_show_in_visual_modes = 0
-- let g:blamer_date_format = '%Y-%m-%d'
-- let g:polyglot_disabled = ['yard', 'typescript', 'jsx', 'tsx']
-- " sheerun/vim-yardoc
-- let g:vim_markdown_conceal = 0
-- " Using vim-ruby via vim-polyglot, indent per work convention
-- let g:ruby_indent_access_modifier_style = 'normal'
-- " Indent for multi-line statements against left. variable or hanging
-- let g:ruby_indent_assignment_style = 'variable'
-- " Indent nested blocks, do or expression
-- let g:ruby_indent_block_style = 'do'
-- " Highlight whitespace errors
-- let g:ruby_space_errors = 1
-- " Set completeopt to have a better completion experience
-- set completeopt=menuone,noinsert,noselect

-- " Avoid showing message extra message when using completion
-- set shortmess+=c

-- set wildmode=list:longest
-- set wildmenu
-- " stuff to ignore when tab completing
-- set wildignore=*.o,*.obj,*~,*vim/backups*,*sass-cache*,*DS_Store*,vendor/rails/**,vendor/cache/**,*.gem,log/**,tmp/**,*.png,*.jpg,*.gif

-- " Display tabs & trailing spaces visually
-- set list listchars=tab:Â»Â·,trail:Â·,nbsp:Â·
