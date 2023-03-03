lua << EOF
vim.notify = require("notify")
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
require("lsp_installer")
require("togglerterm_git")
-- require("bufferline_config")
-- 平滑滚动插件
-- require('neoscroll').setup()
require("ntree")
require("rust_tools")
-- require("noice_config")
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
" set cursorcolumn
" set showcmd
set fileencoding=utf-8
set tabstop=4		" 使用tab代表的空格数
set autoindent		" 设置自动缩进
set expandtab		" 使用tab输入不会转换成字符而是空格
set softtabstop=0	" 不将tab和空格混合使用
set autoread
set termguicolors
set scrolloff=3
"" set background = light
let python3_host_prog = "C:\\Users\\2\\AppData\\Local\\Programs\\Python\\Python310\\python"
" let python3_host_prog = "C:\\Users\\admin\\AppData\\Local\\Programs\\Python\\Python39\\python"

" ========================================== neovide 编辑器设置 ========================================== 
" 设置neovide编辑器中的样式
if exists("g:neovide")
    set guifont=JetBrainsMono\ NFM:h9
    " set guifont=Noto\ Sans\ Mono\ CJK\ SC:h12
    " set guifont=GoMono\ NFM:h9
    " set guifont=FiraCode\ NFM:h9
    set linespace=8
    let g:neovide_remember_window_size = v:true
    " set guifont=JetBrainsMono\ NFM:h11
    " set guifont=JetBrainsMonoNL\ Nerd\ Font\ Mono:h11
    let g:neovide_confirm_quit = v:true
    let g:neovide_hide_mouse_when_typing = v:true
endif
" ========================================================================================================

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

" 分词设置，包含这些的都认为是一个单词
set iskeyword=@,48-57,_,192-255,-

" 设置颜色主题
" colorscheme gruvbox
" colorscheme tokyonight-moon
" colorscheme github_light
" colorscheme github_dimmed
" colorscheme OceanicNext
colorscheme darcula-solid-custom

"  设置切换、关闭tab标签快捷键，就是替换原来的bn和bp命令
" " nnoremap <A-Right> :bn<CR>
" nmap <A-Right> :silent exec "bn"<CR>
" nnoremap <silent> <A-Left> :bp<CR>
" nnoremap <silent> <A-Down> :bd<CR>
" nmap <A-Right> <cmd>bn<CR>

" -----------------airline配置-----------------
let g:airline#extensions#tabline#enabled = 1        " 为1 则启动顶部标签栏，0 为关闭
" let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_sep = ''
" let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#buffer_nr_show = 1        "显示buffer编号
let g:airline#extensions#tabline#buffer_nr_format = '%s:'
let g:airline#extensions#battery#enabled = 1
" let g:airline_left_sep = ''
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
" let g:airline_statusline_ontop=1    " 将状态栏设置到顶部
" let g:airline_theme='solarized'
let g:airline_theme='bubblegum'

" 平滑滚动
" lua require('neoscroll').setup()

" set QuickRun 
" nnoremap <F10> <Esc>:QuickRun<CR>


nnoremap <C-Up> <C-y>
nnoremap <C-Down> <C-e>

" 彩虹括号配置
let g:rainbow_active = 1

" 设置编辑模式下的移动
imap <C-k> <Up>
imap <C-j> <Down>
imap <C-h> <Left>
imap <C-l> <Right>
" nmap <A-h> <Esc>:bp<CR>
" nmap <A-l> <Esc>:bn<CR>
nmap <A-h> <cmd>bp<CR>
nmap <A-l> <cmd>bn<CR>
nmap <leader>o <cmd>NvimTreeToggle<CR>
imap <C-d> <BackSpace>

" ========================================================== Telescope 配置 ==========================================================
" 符号匹配配置
lua << EOF
local status, autopairs = pcall(require, "nvim-autopairs")
if (not status) then return end

autopairs.setup({
  disable_filetype = { "TelescopePrompt" , "vim" },
})
EOF

" 查找项目中是否有作为标志的 root.txt 文件
function! FindRootFile()
    if strlen(globpath(".", "root.txt"))
        let g:project = fnamemodify("root.txt", ":p:h")
    else
        let parent_mark = '../'
        for path in range(10)
            if strlen(globpath(parent_mark, "root.txt"))
                let g:project = fnamemodify("root.txt", ":p:h")
                break
            else
                let parent_mark = parent_mark . '../'
            endif
        endfor
    endif
endfunction

" 替换原来的启动，如果设置了项目根目录，则切入根目录再开启文件选择
function! SwitchRootAndOpenTogglescope()
    if exists("g:project")
        execute "cd " . g:project
    endif
    execute "Telescope find_files"
endfunction

" 自动化命令设置项目根路径
autocmd VimEnter,GUIEnter * :call FindRootFile()

" 文件选择设置
" nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>ff <cmd>call SwitchRootAndOpenTogglescope()<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nmap <leader>fn <cmd>Telescope notify<cr>
" ==================================================================================================================================

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
" function! UpdateTags()
" python << EOF
" from pathlib import Path
" import os
" import vim
" current_file = vim.eval('resolve(expand("%"))')
" base_path = Path(current_file).resolve().parent
" for i in range(10):
"     print(f"寻找目录：{base_path}")
"     if (base_path / 'tags').exists():
"         os.system('ctags -R')
"         print("======更新完毕======")
"         break
"     elif i == 9:
"         print("======未找到tags文件，更新失败======")
"     else:
"         base_path = base_path.parent
" EOF
" endfunction
"
" nmap <F10> <Esc>:call UpdateTags()<CR>

" 设置寄存器的粘贴，系统粘贴
vmap <C-c> "+y
nmap <C-v> "+p
imap <C-v> <Esc>"+pa

" 设置输入时、选择模式和普通模式下的Home和End按键
imap <C-S-l> <End>
imap <C-S-h> <Esc>^i
nmap <C-S-h> ^
nmap <C-S-l> <End>
vmap <C-S-h> ^
vmap <C-S-l> <End>

" 设置pycharm形式的回车增加空行
nmap <S-Enter> o<Esc>

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

" " 使用默认浏览器快速打开html文件
" function! OpenHtml()
"     if &filetype == "html"
"         execute 'silent ! start "1" "%:p"'
"     else
"         echo "当前文件不是html文件"
"     endif
" endfunction
"
" " 打开HTML快捷方式
" nmap <F12> :call OpenHtml()<cr>

" treesitter 找不到折叠问题的设置
function FoldConfig()
	set foldmethod=expr
	set foldexpr=nvim_treesitter#foldexpr()
endfunction

autocmd BufAdd,BufEnter,BufNew,BufNewFile,BufWinEnter * :call FoldConfig()


" =============================================================== 修复python导入包错误问题 ============================================================= 
" 检查python的pth文件是否存在并将当前目录填入到pth中
function! AddPth(...)
python << EOF
import vim
from pathlib import Path
import platform
import sys
python_path = sys.executable
if python_path.lower().endswith(".exe"):
    python_path = Path(python_path).parent
else:
    python_path = Path(python_path)
pack_path = str(python_path / "Lib" / "site-packages")
current_project = vim.eval("expand('%:p')")
if int(vim.eval("a:0")) > 0:
    if int(vim.eval("a:0")) == 1:
        args = vim.eval("a:1")
        exist_file = None
    elif int(vim.eval("a:0")) == 2:
        args = vim.eval("a:1")
        exist_file = vim.eval("a:2")
else:
    args = "0"
    exist_file = None
if args.isdigit():
    insert_path = str(Path(current_project).parents[int(args)])
else:
    insert_path = vim.eval("a:1")
split_var = "/"
if platform.system().lower() == "windows":
    split_var = "\\"
filename = insert_path.split(split_var)[-1] + ".pth"
if exist_file is not None:
    is_path = Path(exist_file).is_absolute()
    if is_path:
        save_file = Path(exist_file)
        filename = save_file.name
        pack_path = save_file.parent
    else:
        filename = exist_file + '.pth'
        save_file = Path(pack_path) / filename
else:
    save_file = Path(pack_path) / filename
with save_file.open("a", encoding="utf8") as f:
    f.write(insert_path)
print(f"The pth file '{filename}' is successfully created to the '{pack_path}', saved data: '{insert_path}'!!!!!!")
vim.command("LspRestart")
EOF
endfunction
" ======================================================================================================================================================
"
" 自动命令每次保存重启一下Lsp
" autocmd BufWritePost,FileWritePost *.py LspRestart
" 手动进行重启操作
function! LspRestartCustomer()
    execute "LspRestart"
    lua require("notify")("重启lsp服务", "info", {title="重启lsp", timeout=1000, stages="fade"})
endfunction

nmap <C-F12> <cmd>call LspRestartCustomer()<CR>

" ================================================= python 文件运行自定义方法 ========================================================
" 同pycharm相吻合的快捷方式
" 为python文件则使用ToggleTerm悬浮窗快速运行当前文件
" 为html文件则使用默认浏览器快速打开
" 如果上级目录包含 allure 字样，则使用allure服务启动
function! OpenHtmlFile()
python << EOF
import vim
from pathlib import Path
file_abs_path = vim.eval("expand('%:p')")
parent_dir_name = Path(file_abs_path).parent.name
if 'allure' in parent_dir_name:
    cmd = 'TermExec cmd="allure open ."'
else:
    cmd = 'silent ! start "1" "%:p"'
vim.command(cmd)
EOF
endfunction

function! RunCurrentFile()
    let current_file = expand("%")
    if &filetype == 'python'
        execute "TermExec cmd=\"exit\""
        " lua require("notify")("清理并运行python", "info", {title="运行当前文件", timeout=1000, stages="fade"})
        sleep 1000m
        execute "TermExec cmd=" . "\"py " . current_file . "\"" 
    elseif &filetype == 'html'
        call OpenHtmlFile()
    elseif &filetype == 'rust'
        execute "TermExec cmd=\"exit\""
        sleep 1000m
        execute "TermExec cmd=\"cargo run\""
    elseif &filetype == 'markdown'
        execute "MarkdownPreview"
    else
        lua require("notify")("当前不是一个python/html/markdown/rust文件", "warn", {title="运行文件出错", timeout=1000, stages="fade"})
    endif
endfunction

nmap <C-S-F10> <cmd>call RunCurrentFile()<cr>
" ====================================================================================================================================

" ================================================= 快捷显示和关闭toggleterm =================================================
function! CloseTermFirst()
    execute "TermExec cmd=\"exit\""
    lua require("notify")("关闭第一个toggleterm", "info", {title="关闭term", timeout=1000, stages="fade"})
endfunction

nmap <A-\> <cmd>ToggleTermToggleAll<cr>         " 显示所有打开的toggleterm
nmap <leader>c\ <cmd>call CloseTermFirst()<cr>     " 关闭第一个toggleterm
" ============================================================================================================================

" ================================================ vsnip 代码片段相关设置 ============================================================
if has("win32") || has("win64") || has("win16")
    let split_symbol="\\"
else
    let split_symbol="/"
endif
" let g:vsnip_snippet_dir=fnamemodify($MYVIMRC, ":h") . split_symbol . "vsnip"
"
" imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
" smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
" imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
" smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
" ====================================================================================================================================

" =============================================== ulsnips 代码片段相关设置 ==========================================================
let g:UltiSnipsSnippetsDir=fnamemodify($MYVIMRC, ":h") . split_symbol . "ULtiSnipsDir"
let g:UltiSnipsSnippetDirectories=[fnamemodify($MYVIMRC, ":h") . split_symbol . "ULtiSnipsDir"]

" let g:UltiSnipsExpandTrigger="<C-Tab>"
" " 使用 tab 切换下一个触发点，shit+tab 上一个触发点
" let g:UltiSnipsJumpForwardTrigger="<tab>"
" let g:UltiSnipsJumpBackwardTrigger="<S-tab>"
" 使用 UltiSnipsEdit 命令时垂直分割屏幕
let g:UltiSnipsEditSplit="vertical"
" ===================================================================================================================================
