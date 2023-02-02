lua << EOF
require('plugins')
require('lsp')
require('init_lspconfig')
require('keymap')
require('term')
require('indent')
require("mark")
require("smartsplit")
require("lspsaga_keymap")
require("treesitter_conf")
EOF

" 设置leader按键
let mapleader = " "

" ----------------------------nvim基础配置------------------------------------
set nobackup
set noswapfile
set noundofile
set number
set relativenumber
set mouse=a
set shiftwidth=4	" 使用 > 进行缩进时的空格量
set cursorline
set cursorcolumn
set showcmd
set fileencoding=utf-8
set tabstop=4		" 使用tab代表的空格数
set autoindent		" 设置自动缩进
set expandtab		" 使用tab输入不会转换成字符而是空格
set softtabstop=0	" 不将tab和空格混合使用
set autoread
set termguicolors
set scrolloff=5
"" set background = light
let python3_host_prog = "C:\\Users\\2\\AppData\\Local\\Programs\\Python\\Python310\\python"
" let python_host_prog = "C:\\Users\\2\\AppData\\Local\\Programs\\Python\\Python310\\python"
" let python3_host_prog = "C:\\Users\\admin\\AppData\\Local\\Programs\\Python\\Python39\\python"

" 设置neovide编辑器中的样式
if exists("g:neovide")
  set guifont=JetBrainsMono\ NFM:h10
  " set guifont=JetBrainsMonoNL\ Nerd\ Font\ Mono:h11
  let g:neovide_confirm_quit = v:true
  let g:neovide_hide_mouse_when_typing = v:true
endif

" 设置折叠模式，按照更多的缩进
" manual 代表手工定义的折叠
" indent 更多缩进代表更高级别的折叠
" expr 用表达式定义折叠
" syntax 通过语法高亮定义折叠
" diff 对没有更改文本进行折叠
" marker 对文中标志进行折叠
set fdm=indent
set nofoldenable

" 设置tags位置
set tags=tags;set autochdir

" 设置颜色主题
" colorscheme gruvbox
colorscheme tokyonight-moon
" colorscheme github_light
" colorscheme github_dimmed

" -----------------airline配置-----------------
"  设置切换、关闭tab标签快捷键，就是替换原来的bn和bp命令
nnoremap <A-Right> :bn<CR>		
nnoremap <A-Left> :bp<CR>
nnoremap <A-Down> :bd<CR>
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#buffer_nr_show = 1        "显示buffer编号
let g:airline#extensions#tabline#buffer_nr_format = '%s:'
let g:airline#extensions#battery#enabled = 1
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_theme='solarized'

" 平滑滚动
" lua require('neoscroll').setup()

" set QuickRun 
" nnoremap <F10> <Esc>:QuickRun<CR>


nnoremap <C-Up> <C-y>
nnoremap <C-Down> <C-e>

" 彩虹括号配置
let g:rainbow_active = 1

" 符号匹配配置
lua << EOF
local status, autopairs = pcall(require, "nvim-autopairs")
if (not status) then return end

autopairs.setup({
  disable_filetype = { "TelescopePrompt" , "vim" },
})
EOF

" 符号替换快捷键配置
" nnoremap <leader><leader> <Esc>:norm ysiw

" 设置编辑模式下的移动
imap <C-k> <Up>
imap <C-j> <Down>
imap <C-h> <Left>
imap <C-l> <Right>
nmap <A-h> <Esc>:bp<CR>
nmap <A-l> <Esc>:bn<CR>
nmap <leader>o <esc>:NvimTreeToggle<CR>
imap <C-d> <BackSpace>
" 文件选择设置
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" 设置函数切换快捷方式
nmap <A-k> [m
nmap <A-j> ]m

" 悬浮终端设置
" set
" autocmd TermEnter term://*toggleterm#*
"       \ tnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>
" 
" " By applying the mappings this way you can pass a count to your
" " mapping to open a specific window.
" " For example: 2<C-t> will open terminal 2
" nnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>
" inoremap <silent><c-t> <Esc><Cmd>exe v:count1 . "ToggleTerm"<CR>


" 设置关于ctags的自动更新策略，使用python进行
function! UpdateTags()
python << EOF
from pathlib import Path
import os
import vim
current_file = vim.eval('resolve(expand("%"))')
base_path = Path(current_file).resolve().parent
for i in range(10):
    print(f"寻找目录：{base_path}")
    if (base_path / 'tags').exists():
        os.system('ctags -R')
        print("======更新完毕======")
        break
    elif i == 9:
        print("======未找到tags文件，更新失败======")
    else:
        base_path = base_path.parent
EOF
endfunction

nmap <F10> <Esc>:call UpdateTags()<CR>

" 设置寄存器的粘贴，系统粘贴
vmap <C-c> "+y
nmap <C-v> "+p
imap <C-v> <Esc>"+pa

" 错误显示插件快捷键
nnoremap <leader>xx <cmd>TroubleToggle<cr>								" 显错误列表
nnoremap <leader>xw <cmd>TroubleToggle workspace_diagnostics<cr>		" 诊断当前工作空间
nnoremap <leader>xd <cmd>TroubleToggle document_diagnostics<cr>			" 诊断当前文件
nnoremap <leader>xq <cmd>TroubleToggle quickfix<cr>						" 打开快速修复内容
nnoremap <leader>xl <cmd>TroubleToggle loclist<cr>						" 打开错误列表
nnoremap gR <cmd>TroubleToggle lsp_references<cr>						" 参照lsp错误指示

" todo插件的快捷方式
nmap <leader>ts <cmd>TodoTelescope<cr>		" 使用悬浮窗搜索todo等
nmap <leader>tt <cmd>TodoTrouble<cr>		" 显示当前的错误信息
nmap <leader>tl <cmd>TodoLocList<cr>		" 通过底部显示列表
nmap <leader>tq <cmd>TodoQuickFix<cr>		" 打开todo的快速修复列表

" gcc注释插件的另外快捷方式
nmap <C-/> gcc
vmap <C-/> gc

" 快速刷新配置文件
nmap <leader>vcr <cmd>so $MYVIMRC<cr>

" 使用默认浏览器快速打开html文件
function! OpenHtml()
    if &filetype == "html"
        execute 'silent ! start "1" "%:p"'
    else
        echo "当前文件不是html文件"
    endif
endfunction

" 打开HTML快捷方式
nmap <F12> :call OpenHtml()<cr>

" treesitter 找不到折叠问题的设置
function FoldConfig()
	set foldmethod=expr
	set foldexpr=nvim_treesitter#foldexpr()
endfunction

autocmd BufAdd,BufEnter,BufNew,BufNewFile,BufWinEnter * :call FoldConfig()
