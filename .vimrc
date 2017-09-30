"Highlight all search pattern matches 
set hls
"Map F12 to create ctags index in current directory 
map <F12> :!ctags -R <CR><CR>
"A shotcut to execute the grep command 
"map mg :!grep
map mg :vimgrep /<C-R>=expand("<cword>")<CR>/gj **/*.h **/*.cpp
"change the comment color 
hi Comment ctermfg=6

nnoremap <F5> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

nmap <F3> :cs find 3 <C-R>=expand("<cword>")<CR><CR>

nmap <F4> :cs find 0 <C-R>=expand("<cword>")<CR><CR>

if has("cscope")
 set csprg=/usr/bin/cscope
 set csto=0
 set cst
 set csverb
 if filereadable("cscope.out")
     cs add cscope.out
elseif $CSCOPE_DB != ""
 cs add $CSCOPE_DB
 endif
 set csverb
endif

set nocp
filetype plugin on " 文件类型自动检测

" 总是显示状态行
set laststatus=2

" 语法高亮
syntax on

" 设置取消大小写区分
set ic

"去掉有关vi一致性模式，避免以前版本的bug和局限 
set nocompatible

"vim使用自动对齐，也就是把当前行的对齐格式应用到下一行(自动缩进）
set autoindent

"（cindent是特别针对 C语言语法自动缩进）
set cindent

"依据上面的对齐格式，智能的选择对齐方式，对于类似C语言编写上有用
set smartindent

"设置匹配模式，类似当输入一个左括号时会匹配相应的右括号
set showmatch

"在程序中查询一单词，自动匹配单词的位置；如查询desk单词，当输到/d时
set incsearch

" 显示行号
set nu!

" 制表符为4统一缩进为4
set tabstop=4
set softtabstop=4
set shiftwidth=4
" 用空格代替制表符
set expandtab

" 设置自动加载文件
set autoread

""""""""""""""""""""""""""""""
" Tag list (ctags)
""""""""""""""""""""""""""""""
let Tlist_Ctags_Cmd = '/usr/bin/ctags'
let Tlist_Show_One_File = 1            "不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow = 1          "如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Auto_Open = 1                "启动vim后自动打开tag list 窗口
let Tlist_Use_Right_Window = 1         "在右侧窗口中显示taglist窗口 

let g:neocomplcache_enable_at_startup = 1 "自动运行 neocomplcache

" mapping
"inoremap <expr> <CR>       pumvisible()?"\<C-Y>":"\<CR>"
"inoremap <expr> <C-J>      pumvisible()?"\<PageDown>\<C-N>\<C-P>":"\<C-X><C-O>"
"inoremap <expr> <C-K>      pumvisible()?"\<PageUp>\<C-P>\<C-N>":"\<C-K>"
"inoremap <expr> <C-U>      pumvisible()?"\<C-E>":"\<C-U>"

"inoremap <C-]>             <C-X><C-]>
"inoremap <C-F>             <C-X><C-F>
"inoremap <C-D>             <C-X><C-D>
"inoremap <C-L>             <C-X><C-L>


" 配色设置
syntax enable
set background=dark
colorscheme solarized


