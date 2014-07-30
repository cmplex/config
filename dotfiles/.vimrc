syntax enable
set autoindent
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab

set noswapfile
set nobackup

set hlsearch

colorscheme jellybeansmod

:highlight ExtraWhitespace ctermbg=red guibg=red
:match ExtraWhitespace /\s\+$/

autocmd BufRead *.vala,*.vapi set efm=%f:%l.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m
au BufRead,BufNewFile *.vala,*.vapi setfiletype vala

autocmd BufNewFile,BufRead *.mobile.erb let b:eruby_subtype='html'
autocmd BufRead,BufNewFile *.mobile.erb set filetype=eruby.html
