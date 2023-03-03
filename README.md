# MyNvim-for-lua
针对于windows的neovim配置，使用lua+vimscript写的关于nvim的配置文件
> 在vim文件中编辑lua代码，前面需要加上lua字样，指明lua块

``` lua require(xxx).setup{} ```
``` 
lua <<< EOF
. 
.
.
EOF
```
> 使用python编写vim代码(非插件，vim中编辑)，这些EOF都是标记字符，可以为任意字符
```python
python << EOF
import vim

xxxxx
EOF
```

## 所需环境工具

- node.js
- python
- git
- neovim

## 配置windows terminal
> 不要装在自带PowerShell中，会出现报错，不能消除

- 在windows商店中下载 windows terminal 和 oh-my-posh
- 搜索下载PowerShell7，[PowerShell 7 下载](https://github.com/PowerShell/PowerShell)
- 下载后，使用```notepad $profile``` 编辑配置文件，如果找不到路径，使用```$profile```查看路径，创建路径，再次打开
- 在$profile文件中输入```oh-my-posh init pwsh | Invoke-Expression```
- 在PowerShell中输入```Get-PoshThemes```，导入全部主题，导入完成会显示保存的位置
- 如果放在Program Files (x86)可能会在写入的时候不能识别，如果在这里可以选择将下载的主题放在其他地方
- 重新打开```notepad $profile```，输入```oh-my-posh init pwsh --config D:\TerminalThemes\M365Princess.omp.json | Invoke-Expression```，保存
- 重启PowerShell即可显示
- 在运行命令中，使用```pwsh```打开PowerShell 7程序

## 配置terminal字体
- 在[Nerd Donts](https://www.nerdfonts.com/font-downloads)中下载喜欢的字体，这里使用的```meslo nerd font```
- 下载完成后解压，随便点击一个文件进行安装
- 重启windows terminal，在默认值--外观那里设置文字
![image](https://user-images.githubusercontent.com/42434762/180972268-b6e92b27-9f82-47dd-9d01-b1e277d8d1ae.png)
- 文字安装和oh-my-posh安装先后都可

## 安装配置

- 在```C:\Users\<name>\AppData\Local```下创建一个nvim文件夹
- 使用git clone，将项目放到nvim文件夹，如果进入nvim文件夹看到的不是```init.vim```等和项目一样的所有文件，则进入MyNvim-for-lua文件夹，将里面的文件、文件夹全部剪切到nvim文件夹下
- ```pip install neovim```安装python扩展
- 使用```npm i -g [language server]``` 为lsp安装语言服务器，也可以在nvim中使用```:LspInstall [language server]```安装，不知道名字可以去[nvim-lsp-install](https://github.com/williamboman/nvim-lsp-installer#available-lsps)
查看，默认启动会自动安装(golang/python/lua/json/yaml/~~toml~~/sql/vim语言服务)
- 修改 init.vim 文件中的python3_host_prog，改成你的python路径，填写到python.exe，不用后面的exe后缀
- 将 ```init.vim``` 文件中的 ```set guifont``` 设置成你自己下载的字体
- ~~下载 [ctags](https://github.com/universal-ctags/ctags-win32/releases)程序，解压添加到环境变量，如果使用lspsaga可以不下载此工具~~
- 下载[lazygit](https://github.com/jesseduffield/lazygit/releases/tag/v0.37.0)程序，如果不想使用也可以不下载
- 下载 [ripgrep](https://github.com/BurntSushi/ripgrep/releases/tag/13.0.0) 并添加到环境变量，这用于全局搜索，telescope、todo-commants插件需要使用此工具
- 下载 [gcc 编译工具](https://sourceforge.net/projects/mingw-w64/files/)，这个是 treesitter 插件需要使用的东西，下载解压并放入环境变量path中，不使用在线安装，可能会出错
![image](https://user-images.githubusercontent.com/42434762/216216145-7a841d08-3ea5-4c16-9d2d-84a9e8418b1c.png)
- 进入nvim程序或者neovide编辑器，```:PackerInstall```或者```:PackerSync```安装/更新全部插件
- 使用 ```:TSInstall``` 安装需要的语言高亮支持，比如 ```:TSInstall markdown```  ```:TSInstall toml```  ```TSInstall json``` 等，你可以去 [treesitter](https://github.com/nvim-treesitter/nvim-treesitter#supported-languages)查看支持的语言类型，默认安装了会自动安装html、toml、python、json、yaml、lua、vim、ini、go支持，使用```:TSInstallInfo``` 查看安装的语言，使用 ```:TSModuleInfo``` 可以查看当前文件的启用状态


## 预览

![image](https://user-images.githubusercontent.com/42434762/220234291-28aade5f-2d8a-486a-b781-57a1838c1234.png)
![image](https://user-images.githubusercontent.com/42434762/220234336-68da03ea-b37b-41c6-8e9f-f3e4f58a18ee.png)
![image](https://user-images.githubusercontent.com/42434762/220234382-0bcee981-634b-4315-b9e0-8662fbbf98aa.png)
![image](https://user-images.githubusercontent.com/42434762/220234409-22d32c59-56aa-4144-b507-10dad1556576.png)
![image](https://user-images.githubusercontent.com/42434762/220234499-c9dd4ef9-7e44-4821-b0f6-77a578f49d92.png)


## 修改配色

> 可以在[vim.org](https://www.vim.org/scripts/script.php?script_id=625)网页底部下载配色，color文件夹放init.vim同级，plugin文件夹内容移动到init.vim同级的plugin文件夹中，此配置已下载全部配色

可以通过修改 init.vim中的colorscheme来更改配色

在nvim程序界面，```:colorscheme```加空格，然后TAB可以在当前选择、查看不同的配色主题(此处为gruvbox)

修改```init.vim```中的```background```可以改变light或者drak等模式
![image](https://user-images.githubusercontent.com/42434762/180963299-4c2c5e42-e6c9-4668-970b-4ad3f977ac47.png)

## 键位操作
> 键位映射操作可以在```init.vim```中进行修改

- ```<Space>o``` 可以打开/关闭文件树，文件树可以按m标记批量操作
- ```crtl + w + w```/```ctrl + w + [方向键]``` 切换窗口
- ```Alt + [左右方向键]``` 或者 ```Alt+h/l``` 切换buffer
- ```Alt + ↓``` 选择关闭标签，或者 ```:bd``` 
- ```ctrl + ↑``` 与ctrl + y相同，向上滚动屏幕
- ```ctrl + ↓``` 与ctrl + e相同，向下滚动屏幕
- ```Ctrl+\``` 打开悬浮终端，注意如果不使用 ```exit``` 退出，终端会有缓存，不能运行更新后的文件
- ```Alt+\``` 打开所有开启的悬浮终端，可以依次进行退出操作
- ```<space>c\``` 关闭第一个悬浮终端，这是防止运行没有关闭导致缓存影响结果
- ```<space> + g``` 使用悬浮窗打开lazygit进行git操作
- ```gcc```快速注释一行代码，选中区域```gc```可以注释选中区域
- ```s/S``` 向上或者向下跳转单词，需要输入两个字符
- 在可视模式下 ```Ctrl+c``` 复制到系统粘贴板，普通或者编辑模式下，```Ctrl+v``` 从系统粘贴板获取数据粘贴
- ```K``` 或者 ```Shift+k``` 可以打开方法说明
- ```zR``` 展开所有折叠，```zM``` 收缩所有折叠，```zO``` 展开当前折叠下的所有折叠，```za``` 切换折叠状态，```zj``` 和 ```zk``` 可以向下或者向上跳转到折叠处
- [vim-surround](https://github.com/tpope/vim-surround)符号操作快捷键可查看其文档，这是能快速用符号包括单词的插件
- ```Alt+j``` 跳转下一个函数开头，```Alt+k``` 跳转上一个函数开头，同 ```]m``` 和 ```[m``` 
- ```Ctrl+Shift+F10``` 快速使用toggleterm运行python，此方法会首先自动关闭一次term，避免忘记亲管理缓存
	- 如果是html文件直接默认浏览器打开，如果html文件在含有 ```allure``` 字样的目录下，则使用allure open打开；
	- 如果是markdown文件，则使用markdown-preview插件从浏览器打开查看，记得手动关闭 ```:MarkdownPreviewStop```；
	- 如果是rust文件，则会以 ```cargo run``` 的形式运行当前main
- ```Ctrl+F12``` 可以重启lsp服务，在某些时候没有提示的时候可以使用（原为保存时自动重启一次，但会造成很大的性能损耗）

### todo和错误搜索

- ```<space>ts/tl/tq/tt``` 悬浮窗搜索todo标签/显示todo列表/显示快速修复列表/显示错误信息列表
- ```<space>xx/xl/xw/xd/xq``` 显示错误/显示错误列表/诊断当前工作空间/诊断当前文件/调出快速修复
- ```<space>ff/fg/fb/fh``` 悬浮窗查找当前目录文件/全局模糊查找字符对应文件/搜索buffer/搜索插件帮助信息

### mark标记

- ```m]``` 和 ```m[``` 可以跳转上一个和下一个标记
- ```ma``` 使用a字母进行标记
- ```dma``` 删除a标记
- ```dm<space>``` 删除buffer内所有标记
- ```m,``` 自动使用可用小写字母标记
- ```dm-``` 删除当前行的所有标记
- ```dm=``` 删除光标下的书签
- ```m{``` 和 ```m}``` 跳转上一个和下一个同类型的书签

### nvim-tree 目录树操作
在目录树中，也可以使用vim的搜索等操作

- ```<Enter>``` 或者 ```o``` 打开文件
- ```<BS>``` 退格键关闭打开的目录
- ```Ctrl+e``` 在目录树窗口打开文件
- ```Ctrl+]``` cd到光标下的目录
- ```ctrl+x/v/t``` 水平/垂直分屏打开，新的tab打开
- ```>/<``` 同级文件目录的切换
- ```P``` 切换父级目录
- ```<Tab>``` 预览形式打开，光标在目录树中
- ```a``` 新建文件，如果文件名后面是一个 ```/``` 结尾，则创建的是文件夹
- ```d``` 删除文件
- ```r``` 重命名文件
- ```x``` 剪切文件
- ```c``` 复制文件
- ```p``` 粘贴
- ```y``` 复制文件名
- ```Y``` 复制文件相对路径
- ```gy``` 复制文件绝对路径
- ```q``` 关闭目录树
- ```m``` 标记多个进行操作 

### vsnip补全插件管理
> 配置中，为了不需要每次使用此文件都重新配置，已经将补全文件路径做了修改，存放在nvim配置目录下的 ```vsnip``` 文件夹下，默认已有一个 ```python.json``` 

这里演示vsnip的使用，工程中也安装了支持cmp的 ```luasnip``` ，你也许可以选择其他你喜欢的代码片段补全插件，比如 [ultisnips](https://github.com/SirVer/ultisnips) 等

- 使用命令 ```:VsnipOpen``` 可以打开预设的配置文件，使用：```echo g:vsnip_snippet_dir``` 可以查看配置的目录
- 配置中可以使用 ```\t``` , ```\n``` 等来改变代码编写形式，如
```json
{
    "main": {
        "prefix": ["main"], 
        "body": [
            "if __name__ == \"__main__\": \n\t..."
        ], 
        "description": "run main"
    }
}
```
- ```prefix``` 指明什么命令可以触发补全
- ```body``` 是你的代码片段
- ```description``` 你可以放一些描述文字
- 你可以在body中使用 ```${1}``` 这种占位符，每次使用<TAB>可以跳转到这里直接进行修改
- 末尾使用 ```${0}``` 可以指明结束，TAB后则不再往下跳转，这些是写在body字符串里面的

### UltiSnips代码片段管理（目前框架使用此）
> 本配置中，安装会自带第三方的代码片段，自定义的补全文件夹，存放在项目的 ```ULtiSnipsDir``` 文件夹下，你可以在这里创建编写补全的代码片段，已存在 ```python.snippets``` 文件
> ultisnippets 非常强大，你可以使用shell、python等去进行构造，你可以去查看[第三方的中文文档](https://github.com/Linfee/ultisnips-zh-doc)，也可以前往[官方地址](https://github.com/SirVer/ultisnips)

#### 补全写法简单示例：
```
snippet allurecls "allure class" b
@allure.epic(${1})
@allure.feature(${2})
@allure.story(${3})
class ${4}: 
	${0}
endsnippet
```

- 使用 ```:UltiSnipsEdit``` 可以打开编辑文件，文件名以当前文件类型命名
- ```snippet``` 和 ```endsnippet``` 是开始结束标志，```allurecls``` 是触发单词，引号中是说明描述，中间为实际代码块
- ```${1}``` 代表占位符，使用TAB可跳转到此处进行编辑操作
- ```b``` 代表这个命令只在行开头适用，其他参数如下
- ```i``` 表示触发字符可以在单词内
- ```w``` 表示触发字符的前后必须是一个字母分界点
- ```r``` 表示触发字符可以是一个正则表达式
- ```t``` 表示展开的代码片段中如果有制表符，原样输出，即使你的 vimrc 里面设置了 expandtab
- ```m``` 表示删除代码片段右边的所有空白字符
- ```e``` 表示自定义上下文
- ```A``` 表示自动触发，不需要按 tab，类似于 VIM 中的 abbr

#### 相关片段键位操作

- ```Ctrl+Enter``` 可以快速补全，有些不是在代码最开始的时候，而是在中间单词后面，是没有提示的，所以需要手动去操作补全
- ```Tab/Shift+Tab``` 有可选项时可以向上或者向下选择补全的代码片段

#### 第三方截图参考
![image](https://user-images.githubusercontent.com/42434762/218480884-276bb558-6d3d-4e93-988c-621f4ac06418.png)

![image](https://user-images.githubusercontent.com/42434762/218480802-a6f32d43-7923-4797-bbc7-331841fcdab7.png)

![image](https://user-images.githubusercontent.com/42434762/218480679-c355e70b-090d-488f-a9c4-f43ed030e510.png)



### 分屏操作
- 在文件树或者telescope中，都可以使用 ```Ctrl+x``` ```Ctrl+v``` 进行水平垂直分屏
- ```Ctrl+方向键``` 可以快速在分屏之间切换
- ```Ctrl+Shift+方向键``` 可以改变窗口高度和宽度

### lspsaga编码支持
使用此插件需要最好装上 ```treesitter``` 插件，在弹出文档的时候，需要treesitter下载的markdown语言支持

- ```gh``` 查找器，查找所有具备光标下单词的文件以及代码，跳转 ```p``` ，编辑 ```o<enter``` ，竖向分屏 ```s``` ，横向分屏 ```i``` , tab显示 ```t``` ，退出 ```q``` 或者 ```<Esc>```
- ```<space>ca``` code_action，有错误的地方可以弹出快速修复的选项，和pycharm编辑器的小黄灯相似，支持普通模式和可视化模式
- ```gr``` 重命名，```Ctrl+c``` 取消操作，重命名会重命名整个函数中相同的字符，完成后你可以选择其他函数进行这种操作
- ~~```gd``` 跳转到定义文件中，你可以在配置中重新启用~~
- ```gd``` 悬浮窗查看定义， 编辑 ```<C-c>o```，竖向分屏 ```<C-c>v```，横向分屏 ```<C-c>i```，tabe显示 ```<C-c>t```，退出 ```q```,关闭 ```ESC``` 
- ```<space>sl``` 显示当前行的错误信息
- ```<space>sc``` 和上面的一样，只是可以传递一个参数
- ```[e``` 跳转上一个错误
- ```]e``` 跳转下一个错误
- ```<F7>``` 显示结构树，所有变量、类、函数、方法，跳转到选择 ```o``` 
- ```K``` 浮窗显示文字说明，会自动消失，你可以修改 ```.\lua\lspsaga_keymap.lua``` 启用窗口保持模式，这个将在右上角打开文档说明，需要你 ```Ctrl+w+w``` 切入，使用 ```q``` 退出
- ```<space>ci``` / ```<space>co``` 显示进出的调用层级
- ```Alt+d``` 打开lspsaga内置的悬浮终端

### windows的python项目修复
在使用vim创建python项目时，在导入的过程中会找不到我们的包，出现 ```no module named xxx``` 的这种错误，python只会在 ```sys.path``` 的路径下找包，但是我们项目并不属于，你可以将你的项目根目录，放到环境变量 ```PYTHONPATH``` 中，也可以在 ```C:\Users\admin\AppData\Local\Programs\Python\Python39\Lib\site-packages``` 路径中写上一个 ```xxx.pth``` 文件，xxx你可以定义成你项目的名字，这样即可，我们这里属于第二种方式，可以快速处理python的这种错误
- 在项目根目录下的文件中，使用 ```:call AddPth()``` 将以当前文件的父级目录作为项目根目录，文件名称为父级文件夹名称
- 在其他文件中使用，你可以传入数字，0代表当前文件上一级目录（父级），1代表上两级目录，以此类推，比如，我们所在文件是 ```D:\Project\base\base.py```,使用 ```:call AddPth(1)``` 将会把 ```Project``` 作为项目根目录进行处理，默认是0
- 你可以直接写入你的项目根目录路径，程序将以你输入的路径作为根目录路径，并进行文件添加
- 如果你传入两个参数，第一个参数是你的项目目录，第二个参数是你已经存在的```.pth```文件，你也可以使用这种方式自定义名称，例如：
```
# D:\abc\hello.pth 这是你已经存在的文件路径
# D:\project\main.py 假如这是你的项目目录，你当前在main.py文件中
# 使用自定义文件，你只能传入一个不带扩展名的文件名称，或者传入指向到pth的路径

:call AddPth(0, "hello")    这将从python的site-packages目录找到 hello.pth 文件编辑

:call AddPth(0, "D:\abc\hello.pth")   这将会把 project 目录名称，存放到 D:\abc\hello.pth 文件中
```
- 添加完成后，程序会自动重启一次Lsp服务

### 关于markdown-preview不能使用问题

> 注意的是，我们这里是默认使用的没有安装node.js的选项，你可以自己去插件文件中修改，但是这个并不影响。
插件路径是 ```nvim/lua/plugins.lua```

首先你应该先进入[markdown-preview](https://github.com/iamcco/markdown-preview.nvim)官网去查看具体的安装方法，你应该确定你是否是安装了node.js的状态，如果安装了node.js，你应该使用的命令是：

```lua
use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })
```

如果你显示安装好了仍不能打开，则可以进行如下操作

- 首先尝试在nvim中使用命令 ```:call mkdp#util#install()``` 去进行安装，如果不行，如下
- 进入文件夹 ```nvim-data/site/pack/packer/start/markdown-preview.nvim/app```
- 打开cmd或者其他命令行工具，输入 ```npm install```
- 等待安装完成重新再试


### 关于rust-analyzer不能安装问题
使用 ```nvim-lsp-installer``` 可能不能安装 ```rust-analyzer``` 我们需要手动去下载，其他的大部分语言，如果使用 ```nvim-lsp-installer``` 不能安装，基本都可以使用npm进行安装，前提是下载了node.js，使用npm安装使用 ```npm i -g pyright``` 这里使用pyright示例，```rust-analyzer``` 不适用此方式

- 前往[rust-analyzer](https://github.com/rust-lang/rust-analyzer/releases)下载二进制的可运行文件

![image](https://user-images.githubusercontent.com/42434762/221791582-69d84ab5-ffc2-4c8b-8ae9-856e7500ec67.png)

- 将下载文件解压，会有一个exe和一个pdb文件，进入我们nvim的data文件夹 ```nvim-data``` ，在 ```nvim-data/lsp_servers``` 文件夹中，创建一个 ```rust_analyzer``` 文件夹，注意是下划线

- 将解压的两个文件放入创建的文件夹中，重启nvim，再次运行 ```:LspInstallInfo``` 查看是否已有

- 上述的基本路径是 ```C:\Users\<username>\AppData\Local\nvim-data\lsp_servers```

### dashboard修改windows支持
找到 ```C:\Users\2\AppData\Local\nvim-data\site\pack\packer\opt\dashboard-nvim\lua\dashboard\theme``` 下的 ```hyper.lua``` 文件，修改function ```map_key``` ，大概在185行左右，将内容修改成：
```lua
local function map_key(config, key, content)
  keymap.set('n', key, function()
    local text = content or api.nvim_get_current_line()
    if string.find(text, "~") ~= nil then
      local scol = text:find('%p')
      text = text:sub(scol)
      local user_path = os.getenv("USERPROFILE")
      text = string.gsub(text, "~", user_path)
      path = text
    else
      local index = string.find(text, '%w')
      text = text:sub(index)
      local tbl = vim.split(text, '%s', { trimempty = true })
      path = tbl[#tbl]
      path = vim.fs.normalize(path)
      path = vim.loop.fs_realpath(path)
    end
    if vim.fn.isdirectory(path) == 1 then
      vim.cmd(config.project.action .. path)
    else
      vim.cmd('edit ' .. path)
    end
  end, { buffer = config.bufnr, silent = true, nowait = true })
end
```
你也可以将文件 141 到 143 行注释掉，将 177 行的 ```%p``` 换成 ```%w```
![image](https://user-images.githubusercontent.com/42434762/216031593-230e90b1-96ca-41db-9399-bf2489abfc1b.png)
![image](https://user-images.githubusercontent.com/42434762/216031639-0a7bf848-7a33-40ba-b71a-a3f441b58234.png)



## 正在使用部分插件
![image](https://user-images.githubusercontent.com/42434762/220235167-fc755fb0-6203-474d-906f-06e5504a2372.png)




