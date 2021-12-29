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

-- These can be updated with vim.api.nvim_command('') syntax
--
-- " Print all groups being applied
-- " https://jordanelver.co.uk/blog/2015/05/27/working-with-vim-colorschemes/
-- command! What echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
-- " Print out the color syntax group of the highlighted line
-- " https://github.com/patstockwell/vim-monokai-tasty/blob/master/README.md
-- command! Whatt echo synIDattr(synID(line('.'), col('.'), 1), 'name')

-- let g:Hexokinase_highlighters = [ 'sign_column' ]
