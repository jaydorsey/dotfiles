" Rename this file to something that's easier to identify
autocmd ColorScheme *
        \ highlight IndentBlanklineIndent1 guifg=#E06C75 guibg=#E06C75 blend=nocombine
        \ highlight IndentBlanklineIndent2 guifg=#E5C07B blend=nocombine
        \ highlight IndentBlanklineIndent3 guifg=#98C379 blend=nocombine
        \ highlight IndentBlanklineIndent4 guifg=#56B6C2 blend=nocombine
        \ highlight IndentBlanklineIndent5 guifg=#61AFEF blend=nocombine
        \ highlight IndentBlanklineIndent6 guifg=#C678DD blend=nocombine

" ripgrep customization
" http://owen.cymru/fzf-ripgrep-navigate-with-bash-faster-than-ever-before/
let g:rg_command = '
  \ rg --column --line-number --no-heading --fixed-strings --ignore-case --ignore --ignore-global --hidden --no-follow --color "always"
  \ -g "!.git/*"
  \ -g "!.elixir_ls/*"
  \ -g "!spec/vcr/*"
  \ '

command! -bang -nargs=* Find
\ call fzf#vim#grep(g:rg_command .shellescape(expand('<cword>')), 1,
\ <bang>0 ? fzf#vim#with_preview('up:60%')
\         : fzf#vim#with_preview('right:50%:hidden', '?'),
\ <bang>0)

