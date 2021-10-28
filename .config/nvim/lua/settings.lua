-- To check the proper scope of a setting, try:
--   :lua print (<setting))
-- For example:
--   :lua print(vim.wo.scrolloff)
--
-- vim.o global
-- vim.wo window
-- vim.bo buffer

vim.opt.termguicolors = true

vim.cmd [[filetype plugin indent on]]
vim.cmd [[syntax on]]

vim.cmd [[colorscheme catppuccino]]

vim.g.indent_blankline_filetype_exclude = {
  'startify', 'log', 'fugitive', 'gitcommit', 'TelescopePrompt', 'undotree', 'markdown', 'peekaboo', 'git',
  'help', 'terminal', 'dashboard', ''
}

vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 blend=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B blend=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 blend=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 blend=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF blend=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD blend=nocombine]]

vim.opt.listchars = {
  space = ' ',
  trail = '⋅',
  nbsp = '⋅',
  -- eol = '↴',
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
vim.o.cmdheight = 2 -- More space for messages
vim.o.laststatus = 2
--o.concealcursor=nv -- From vim-markdown, conceals links, headings, etc in normal & visual mode
vim.o.conceallevel = 0 -- Expand everything, particularly in markdown files
vim.o.swapfile = true -- use a swap file
vim.o.directory='/tmp' -- List of directory names for the swap file, separated by commas
--o.encoding=utf-8 -- Always UTF-8 enoding
vim.o.eol = true -- include a new line at EOF
vim.o.expandtab = true -- Expand tabs to spaces

-- o.fillchars="eob:\ ," -- Fill empty gutter lines with nothing

--o.foldmethod=expr -- for treesitter
-- o.foldexpr=nvim_treesitter#foldexpr() -- for treesitter

vim.o.foldcolumn = "2"
--o.foldlevel=2
--o.foldlevelstart=99 -- Edit with all folds open when opening a file
--o.foldnestmax=12 -- Deepest fold
vim.o.foldenable = true -- Fold or don't fold files by default
-- o.formatoptions+=j -- Join comments better
-- o.grepprg=rg\ \-\-vimgrep\ \-\-no-heading -- Use ripgrep instead of ag for :Ag commands
-- o.grepformat=%f:%l:%c:%m,%f:%l:%m
--" set guicursor=a:blinkon0-Cursor/Cursor             " Turn off blink for all modes
--" set guicursor+=i:blinkwait0-blinkon100-blinkoff100 " Turn on blinking in insert mode
--" set guicursor=n-v-c:block-Cursor/lCursor,i-ci-ve:ver25-Cursor2/lCursor2,r-cr:hor20,o:hor50
vim.o.hidden = true -- Required for operations modifying multiple buffers like rename.
vim.o.history=500 -- Max history
vim.o.hlsearch = true -- Highlight matches
vim.o.ignorecase = true -- Ignore case when searching...
vim.o.incsearch = true -- Find the next match as we type
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
vim.o.wrap = false-- Don't wrap lines. Call `:set wrap` to change
vim.o.numberwidth=5 -- Use 5 characters for number well
--o.pumheight=10 -- Limit height of completion popup
vim.o.scrolloff=10 -- Prevent scrolling past bottom line
--o.sessionoptions-=options -- Disable options because sessions capture runtime path
--o.sessionoptions-=folds -- FastFold recommended setting to make sure buffer not overwritten in manual
vim.o.showtabline=2 -- Always show a tab line in vim https://stackoverflow.com/a/47129698/2892779
vim.o.shiftround = true -- Round indent of shifts
vim.o.shiftwidth=2 -- Round indent to multiples of 2
vim.o.showmatch = true -- Briefly show matching brackets
vim.o.showcmd = true -- Show leader key and partial commands in the bottom right corner
--o.shortmess+=c
--o.signcolumn=auto:4
vim.o.smartcase = true -- Don't ignore case if we type a capital
vim.o.smarttab = true -- Backspace should delete tabwidth of characters
vim.o.softtabstop=2
vim.o.splitbelow = true -- Open new split panes to right and bottom
vim.o.splitright = true -- Open new split panes to right and bottom
vim.o.synmaxcol=512 -- Don't highlight on lines longer than X chars
vim.o.tabstop=2
vim.o.textwidth=120 -- Text width before wrapping
vim.o.title = true -- Set the title of the iTerm tab
vim.o.undofile = true -- Persistent undo
-- TODO: Figure out where to send this
-- o.undodir=".vim/undo" -- Persistent undo directory
--o.viewoptions=cursor,curdir,folds,unix,slash -- Recommended vim-stay option
--o.viewoptions-=options -- Recommended vim-stay option
--o.viewdir="~/.vim/views"
--" set viminfo^=!                                     " Add recently accessed projects menu (project plugin)
-- set viminfo='100,f1'                               " https://www.linux.com/news/vim-tips-moving-around-using-marks-and-jumps/
--o.shada=!,'100,<50,s10,h,f1
vim.o.visualbell = true -- No visual feedback
vim.o.errorbells = false
-- o.writebackup = true -- write backup file before overwriting


vim.wo.number = true -- Line numbers on
vim.wo.colorcolumn = "120"

-- delimtmate
vim.g.delimitMate_expand_space = 1

-- committia
vim.g.committia_open_only_vim_starting = 1
vim.g.committia_edit_window_width = 120

vim.g.yaml_formatter_indent_collection=1

-- easy motion
vim.g.EasyMotion_smartcase = 1
vim.g.EasyMotion_do_mapping = 0 -- Disable default mappings

-- blamer
vim.g.blamer_enabled = 1
vim.g.blamer_delay = 500
vim.g.blamer_show_in_visual_modes = 0
vim.g.blamer_date_format = '%Y-%m-%d'


-- " sheerun/vim-yardoc
vim.cmd [[let g:vim_markdown_conceal = 0]]

-- TODO: Figure out this syntax, with the path
-- vim.cmd [[let g:indent_blankline_use_treesitter = v:true]]
-- vim.cmd([[
--   let g:multiline_list = [
--             \ '1',
--             \ 2,
--             \ '3',
--             \ ]
-- ]])

-- " sheerun/vim-yardoc
-- vim.cmd [[let g:vim_markdown_conceal = 0]]
vim.g.vim_markdown_conceal = 0

-- TODO: Figure out this syntax, with the path
-- let g:python3_host_prog=escape(expand('$HOME'), '\') . '/.asdf/shims/python'
-- let g:python_host_prog=escape(expand('$HOME'), '\') . '/.asdf/shims/python'

-- vim.g.ruby_path="$HOME/.asdf/shims/ruby"

-- vim.g.ruby_path=escape(expand('$HOME'), '\') . '/.asdf/shims/ruby'
-- vim.g.ruby_default_path=escape(expand('$HOME'), '\') . '/.asdf/shims/ruby'
-- vim.g.ruby_host_prog=escape(expand('$HOME'), '\') . '/.asdf/shims/neovim-ruby-host'


-- " ripgrep customization
-- " http://owen.cymru/fzf-ripgrep-navigate-with-bash-faster-than-ever-before/
-- let g:rg_command = '
--   \ rg --column --line-number --no-heading --fixed-strings --ignore-case --ignore --ignore-global --hidden --no-follow --color "always"
--   \ -g "!.git/*"
--   \ -g "!.elixir_ls/*"
--   \ -g "!spec/vcr/*"
--   \ '
vim.cmd [[
  let g:rg_command = 'rg --column --line-number --no-heading --fixed-strings --ignore-case --ignore --ignore-global --hidden --no-follow --color "always" -g "!.git/*" -g "!.elixir_ls/*" -g "!spec/vcr/*"'
]]

vim.g.ruby_indent_access_modifier_style = 'normal' -- Using vim-ruby via vim-polyglot, indent per work convention
vim.g.ruby_indent_assignment_style = 'variable' -- Indent for multi-line statements against left. variable or hanging
vim.g.ruby_indent_block_style = 'do' -- Indent nested blocks, do or expression
vim.g.ruby_space_errors = 1 -- Highlight whitespace errors

vim.g.ale_disable_lsp = 1
-- Plug 'dense-analysis/ale'
vim.g.ale_sign_column_always = 1
-- vim.g.ale_sign_warning = 'î¸'
-- vim.g.ale_sign_error = 'î±'
vim.g.ale_fix_on_save = 1
-- vim.g.ale_ruby_rubocop_executable = escape(expand('$HOME'), '\') . '/.asdf/shims/bundle'

vim.cmd [[
  let g:ale_linters = {'ruby':['rubocop']}
]]

-- let g:ale_fixers = {'*':['remove_trailing_lines','trim_whitespace'],'ruby':['rubocop']}
vim.cmd [[
  let g:ale_fixers = {'ruby':['rubocop']}
]]


-- " Set completeopt to have a better completion experience
-- set completeopt=menuone,noinsert,noselect

-- " Avoid showing message extra message when using completion
-- set shortmess+=c

-- set wildmode=list:longest
-- set wildmenu
-- " stuff to ignore when tab completing
-- set wildignore=*.o,*.obj,*~,*vim/backups*,*sass-cache*,*DS_Store*,vendor/rails/**,vendor/cache/**,*.gem,log/**,tmp/**,*.png,*.jpg,*.gif
