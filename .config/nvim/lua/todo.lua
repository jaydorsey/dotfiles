-- let $FZF_DEFAULT_OPTS='--layout=reverse'

-- " ripgrep customization
-- " http://owen.cymru/fzf-ripgrep-navigate-with-bash-faster-than-ever-before/
-- let g:rg_command = '
--   \ rg --column --line-number --no-heading --fixed-strings --ignore-case --ignore --ignore-global --hidden --no-follow --color "always"
--   \ -g "!.git/*"
--   \ -g "!.elixir_ls/*"
--   \ -g "!spec/vcr/*"
--   \ '

-- " https://github.com/junegunn/fzf.vim/issues/419#issuecomment-479687537
-- command! -bang -nargs=* Rg
-- \ call fzf#vim#grep(
-- \    g:rg_command
-- \    . (len(<q-args>) > 0 ? shellescape(<q-args>) : '""'), 1,
-- \ <bang>0 ? fzf#vim#with_preview('up:60%')
-- \         : fzf#vim#with_preview('right:50%:hidden', '?'),
-- \ <bang>0)


-- let g:rg_case_command = '
--   \ rg --column --line-number --no-heading --fixed-strings --ignore --ignore-global --hidden --no-follow --color "always"
--   \ -g "!.git/*"
--   \ -g "!.elixir_ls/*"
--   \ -g "!spec/vcr/*"
--   \ '

-- command! -bang -nargs=* Rgg
-- \ call fzf#vim#grep(
-- \    g:rg_case_command
-- \    . shellescape(<q-args>), 1,
-- \ <bang>0 ? fzf#vim#with_preview('up:60%')
-- \         : fzf#vim#with_preview('right:50%:hidden', '?'),
-- \ <bang>0)

-- " Use a preview window with the Files command
-- command! -bang -nargs=? -complete=dir Files
--   \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

-- " This command is used with a shortcut key below to find all occurences of the
-- " word beneath the cursor
-- command! -bang -nargs=* Find
-- \ call fzf#vim#grep(g:rg_command .shellescape(expand('<cword>')), 1,
-- \ <bang>0 ? fzf#vim#with_preview('up:60%')
-- \         : fzf#vim#with_preview('right:50%:hidden', '?'),
-- \ <bang>0)

-- function! RipgrepFzf(query, fullscreen)
--   let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
--   let initial_command = printf(command_fmt, shellescape(a:query))
--   let reload_command = printf(command_fmt, '{q}')
--   let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
--   call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
-- endfunction

-- command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

-- " https://github.com/hashrocket/vim-hashrocket/blob/master/plugin/hashrocket.vim#L36
-- command! -bar -range=% NotRocket :<line1>,<line2>s/:\(\w\+\)\s*=>/\1:/ge

-- nnoremap K :Find<cr>

-- " Print all groups being applied
-- " https://jordanelver.co.uk/blog/2015/05/27/working-with-vim-colorschemes/
-- command! What echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
-- " Print out the color syntax group of the highlighted line
-- " https://github.com/patstockwell/vim-monokai-tasty/blob/master/README.md
-- command! Whatt echo synIDattr(synID(line('.'), col('.'), 1), 'name')



-- lua <<EOF
-- require'nvim-treesitter.configs'.setup {
--   rainbow = {
--     enable = true,
--     extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
--     max_file_lines = 1000, -- Do not enable for files with more than 1000 lines, int
--   }
--   ensure_installed = {"ruby", "yaml", "json"}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
--   ignore_install = { "javascript" }, -- List of parsers to ignore installing
--   highlight = {
--     enable = true,              -- false will disable the whole extension
--     disable = { "c", "rust" },  -- list of language that will be disabled
--   },
--   indent = {
--     enable = true
--   },
-- }
-- EOF

-- let g:nb_italic_comments  = 0
-- let g:nb_italic_keywords  = 1
-- let g:nb_italic_functions = 0
-- let g:nb_italic_variables = 1
-- let g:nb_style = "night"

-- let g:Hexokinase_highlighters = [ 'sign_column' ]

-- Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

-- Plug 'liuchengxu/vista.vim'
-- let g:vista_default_executive = 'lspconfig'

-- let g:ale_disable_lsp = 1
-- Plug 'dense-analysis/ale'
-- let g:ale_sign_column_always = 1
-- let g:ale_sign_warning = 'î¸'
-- let g:ale_sign_error = 'î±'
-- let g:ale_ruby_rubocop_executable = escape(expand('$HOME'), '\') . '/.asdf/shims/bundle'

-- let g:ale_fix_on_save = 1

-- let g:ale_linters = {
--       \ 'ruby': [
--       \     'rubocop'
--       \ ]
--       \}

-- let g:ale_fixers = {
--       \ '*': [
--       \   'remove_trailing_lines',
--       \   'trim_whitespace'
--       \ ],
--       \ 'ruby': [
--       \   'rubocop'
--       \ ]
--       \}

