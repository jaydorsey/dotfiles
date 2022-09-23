vim.api.nvim_create_user_command(
  'Find',
  -- "call fzf#vim#tags({'options': '-q '.shellescape(expand('<cword>'))})",
  "call fzf#vim#grep('rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(expand('<cword>')), 1, fzf#vim#with_preview('right:75%'))",
  { bang = true, nargs = '*', desc = 'Find word under cursor'}
)
  -- "call fzf#vim#tags({'options': '-q '.shellescape(expand('<cword>'))})"
-- "call fzf#vim#grep(g:rg_command .shellescape(expand('<cword>')), 1, <bang>0 ? fzf#,vim#with_preview('up:60%') : fzf#vim#with_preview('right:50%:hidden', '?'), <bang>0)",

vim.api.nvim_create_user_command(
  'ALEToggleFixer',
  "execute \"let g:ale_fix_on_save = get(g:, 'ale_fix_on_save', 0) ? 0 : 1\"",
  { bang = true, desc = 'Toggle ALE Fixer'}
)
