set nocompatible                " be iMproved
filetype off                    " required!

"common conf {{             通用配置
set ai                      "自动缩进
set noic
set bs=2                    "在insert模式下用退格键删除
set showmatch               "代码匹配
set laststatus=2            "总是显示状态行
set shiftwidth=4
set tabstop=4
"set linespace=0
set lines=44 columns=160
set expandtab               "以下三个配置配合使用，设置tab和缩进空格数
set cursorline              "为光标所在行加下划线
set cursorcolumn
set number                  "显示行号
set autoread                "文件在Vim之外修改过，自动重新读入

set ignorecase              "检索时忽略大小写
set fileencodings=uft-8     "使用utf-8或gbk打开文件
set hlsearch
set helplang=cn             "帮助系统设置为中文
"set foldmethod=syntax       "代码折叠
set ruler
"set nowrap
"}}

"conf for tabs, 为标签页进行的配置，通过ctrl h/l切换标签等
let mapleader = ';'
nnoremap <C-l> gt
nnoremap <C-h> gT
nnoremap <leader>t : tabe<CR>

"conf for plugins {{ 插件相关的配置
"状态栏的配置 
"powerline{
"set guifont=PowerlineSymbols\ for\ Powerline
" set nocompatible
" set t_Co=256
"let g:Powerline_symbols = 'fancy'
"}

let g:Powerline_colorscheme='solarized'

set guifont=BitstreamVeraSansMono\ 14
"set guifont=ArialMonospacedForSap\ 18
"set guifont=DejaVuSansMono\ 14

" 随 vim 自启动
let g:indent_guides_enable_on_vim_startup=1
" 从第二层开始可视化显示缩进
let g:indent_guides_start_level=2
" 色块宽度
let g:indent_guides_guide_size=1
" 快捷键 i 开/关缩进可视化
nmap <silent> <Leader>i <Plug>IndentGuidesToggle


let g:solarized_termcolors = 256
let g:solarized_contrast = "high"
let g:solarized_termtrans = 1

syntax enable
colorscheme solarized
"colorscheme molokai

if has('gui_running')
    set background=light
else
    set background=dark
endif

set background=dark

set gcr=a:block-blinkon0
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R

set guioptions-=m
set guioptions-=T


fun! ToggleFullscreen()
  call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")
endf
map <silent> <F11> :call ToggleFullscreen()<CR>
autocmd VimEnter * call ToggleFullscreen()


set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'fatih/vim-go'
Plugin 'Valloric/YouCompleteMe'

" NerdTree use <F2>
Bundle 'scrooloose/nerdtree'
let NERDTreeWinPos='left'
let NERDTreeWinSize=25
let NERDTreeChDirMode=1
map <F2> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

Bundle 'majutsushi/tagbar'
nmap <F3> :TagbarToggle<CR>
let tagbar_width=20
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
    \ }

set runtimepath^=~/.vim/bundle/ctrlp.vim

call vundle#end()            " required
"call pathogen#infect()
filetype plugin indent on    " required

set cursorline
set cursorcolumn
hi CursorLine   cterm=NONE ctermbg=darkgreen ctermfg=black guibg=darkgreen guifg=white

if expand('%') == 'BUILD' && executable('buildifier')
    autocmd BufWritePost BUILD !buildifier -showlog '%:p'
endif

