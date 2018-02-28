" ------------------- vim 通用配置开始 ---------------------

" 设置 vim 工作在非兼容模式下，即不兼容 vi 下的一些操作
set  nocp

" 定义快捷键的前缀，即<Leader>
let mapleader=";"

" 映射 mg 按键调用 vimgrep 查找当前光标处的单词
map <Leader>g :vimgrep /<C-R>=expand("<cword>")<CR>/gj **/*.h **/*.cpp

" 定义快捷键保存当前窗口内容
nmap <Leader>w :w<CR>

" 定义快捷键关闭当前分割窗口
nmap <Leader>q :q<CR>

" 高亮搜索结果
set hls

" 打开文件类型检测
filetype on

" 针对不同的文件类型采用不同的缩进格式
filetype indent on

" 允许插件
filetype plugin on

" 总是显示状态行
set laststatus=2

" 打开语法高亮
syntax on

" 设置取消大小写区分，用于搜索
set ic

" vim使用自动对齐，也就是把当前行的对齐格式应用到下一行(自动缩进）
set autoindent

" （cindent是特别针对 C语言语法自动缩进）
set cindent

" 调整 c/c++ 下的缩进风格
set cino=:0g0t0(sus

" 依据上面的对齐格式，智能的选择对齐方式，对于类似C语言编写上有用
set smartindent

" 设置匹配模式，类似当输入一个左括号时会匹配相应的右括号
set showmatch

" 在程序中查询一单词，自动匹配单词的位置；如查询desk单词，当输到/d时
set incsearch

" 粘贴时保持格式，此时会关闭自动缩进
"set paste

" 执行 set paste 后重新打开自动缩进
"set nopaste

" 显示行号
set nu!

" 不显示行号
"set nonumber

" 制表符为4统一缩进为4
set tabstop=4
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=4
" 设置格式化时制表符占用空格数
set shiftwidth=4

" 用空格代替制表符
set expandtab

" 设置使用 Backspace 键可一下删除4个空格
set smarttab

" 设置自动加载文件
set autoread

" ------------------- ctags ---------------------

" 映射 F5 键执行 ctags 生成数据库
nnoremap <F5> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" ------------------- cscope ---------------------:w

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

" 查找C语言符号，即查找函数名、宏、枚举值等出现的地方
nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>

" 查找函数、宏、枚举等定义的位置，类似ctags所提供的功能
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>

" 查找调用本函数的函数 
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>

" 查找指定的字符串 
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>

" 查找egrep模式，相当于egrep功能，但查找速度快多了
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>

" 查找并打开文件，类似vim的find功能
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>

" 查找包含本文件的文件
nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>

" 查找本函数调用的函数
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

" 保存cscope结果至quickfix窗口
set cscopequickfix=s-,c-,d-,i-,t-,e-

endif

" ------------------- Vundle ---------------------

set nocompatible              " be iMproved, required
filetype off                  " required

" 启用vundle来管理vim插件
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" 安装插件写在这之后

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-scripts/AutoComplPop'
Plugin 'vim-scripts/OmniCppComplete'

Plugin 'kien/ctrlp.vim'

"Plugin 'vim-airline/vim-airline'
"Plugin 'vim-airline/vim-airline-themes'

Plugin 'majutsushi/tagbar'
Plugin 'vim-scripts/taglist.vim'

Plugin 'altercation/vim-colors-solarized'

"Plugin 'octol/vim-cpp-enhanced-highlight'

"Plugin 'Lokaltog/vim-powerline'

"Plugin 'nathanaelkane/vim-indent-guides'

" 安装插件写在这之前
call vundle#end()            " required
filetype plugin on    " required

" 常用命令
" :PluginList       - 查看已经安装的插件
" :PluginInstall    - 安装插件
" :PluginUpdate     - 更新插件
" :PluginSearch     - 搜索插件，例如 :PluginSearch xml就能搜到xml相关的插件
" :PluginClean      - 删除插件，把安装插件对应行删除，然后执行这个命令即可

" h: vundle         - 获取帮助

" vundle的配置到此结束，下面是你自己的配置

" ------------------- ctrlp ---------------------

let g:ctrlp_map = '<c-p>'

let g:ctrlp_cmd = 'CtrlP'

" 设置过滤不进行查找的后缀名 
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|pyc)$'

" ------------------- tagbar ---------------------

nmap <F11> :TagbarToggle<CR>

" ------------------- taglist ---------------------

"设定linux系统中ctags程序的位置
let Tlist_Ctags_Cmd = '/usr/bin/ctags'

"不同时显示多个文件的tag，只显示当前文件的
let Tlist_Show_One_File = 1

"如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Exit_OnlyWindow = 1

"在右侧窗口中显示taglist窗口
let Tlist_Use_Right_Window = 1

nmap <F10> :TlistToggle<CR>

" ------------------- solarized ---------------------

syntax enable
set background=dark
colorscheme solarized

let g:solarized_termcolors=256


