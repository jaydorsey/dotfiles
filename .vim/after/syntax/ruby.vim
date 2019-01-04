" https://stackoverflow.com/questions/4162664/vim-highlight-a-list-of-words
syn keyword Wildmenu private
syn keyword Wildmenu protected
syn keyword WarningMsg puts
syn keyword WarningMsg print
syn match WarningMsg 'binding\.pry'

syn keyword RSpecFocus fcontext fdescribe fit
syn keyword RSpecSkip xdescribe xit skip xcontext

highlight RSpecSkip guifg=#000000 guibg=#bbbb00
highlight RSpecFocus guifg=#000000 guibg=#cc6666

" highlight IncSearch cterm=NONE guibg=#00ffdf guifg=#000000 " Change highlight color in incremental searches
