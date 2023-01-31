# MyNvim-for-lua
使用lua写的关于nvim的配置文件
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
查看
- 修改 init.vim 文件中的python3_host_prog，改成你的python路径，填写到python.exe，不用后面的exe后缀
- 将 ```init.vim``` 文件中的 ```set guifont``` 设置成你自己下载的字体
- 进入nvim程序，```:PackerInstall```或者```:PackerSync```安装更新全部插件
- 下载 [ctags](https://github.com/universal-ctags/ctags-win32/releases)程序，解压添加到环境变量
- 下载 [ripgrep](https://github.com/BurntSushi/ripgrep/releases/tag/13.0.0) 并添加到环境变量，这用于全局搜索，telescope、todo-commants插件需要使用此工具


## 预览

![image](https://user-images.githubusercontent.com/42434762/181021793-686e883a-0c50-4ead-998e-da8738a2ae2e.png)
![image](https://user-images.githubusercontent.com/42434762/180933865-8f63d266-5dcd-43d4-b605-16764dcc1acd.png)
![image](https://user-images.githubusercontent.com/42434762/180933925-805f9ec9-c5d7-40bb-adf0-09be44aabd4b.png)
![image](https://user-images.githubusercontent.com/42434762/181533919-f82cdad7-6e6a-4000-b269-419a38329a01.png)


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
- ```gcc```快速注释一行代码，选中区域```gc```可以注释选中区域
- ```space space```，进入符号操作模式，输入任意符号回车，即可将光标所在单词用此符号包裹，space为默认leader按键
- ```s/S``` 向上或者向下跳转单词，需要输入两个字符
- ```<Space>ff``` 打开当前目录文件搜索，还有fg等操作
- ```<F10>``` 自动更新ctags文件，会从当前文件的同级，向上查找10次
- 在项目根目录使用 ```ctags -R``` 创建tags文件后，可使用 ```Ctrl]``` 跳转到函数、变量定义，```Ctrl+o``` 跳回
- 在可视模式下 ```Ctrl+c``` 复制到系统粘贴板，普通或者编辑模式下，```Ctrl+v``` 从系统粘贴板获取数据粘贴
- ```gd``` 可在buffer内进行变量跳转
- ```K``` 或者 ```Shift+k``` 可以打开方法说明
- ```zR``` 展开所有折叠，```zM``` 收缩所有折叠，```zO``` 展开当前折叠下的所有折叠，```za``` 切换折叠状态，```zj``` 和 ```zk``` 可以向下或者向上跳转到折叠处
- vim-surround操作快捷键可查看其文档
- ```Alt+j``` 跳转下一个函数开头，```Alt+k``` 跳转上一个函数开头，同 ```]m``` 和 ```[m``` 

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



## 正在使用部分插件
> 这里只是显示部分使用插件，并不一定是全部的插件，其插件也有其他依赖项

- 标签、状态栏样式插件: [vim-airline](https://github.com/vim-airline/vim-airline)
- 便捷安装lsp服务: [lsp-install](https://github.com/williamboman/nvim-lsp-installer)
- 文件树目录: [nvim-tree](https://github.com/kyazdani42/nvim-tree.lua)
- 代码纠错提示插件: [lsp](https://github.com/neovim/nvim-lspconfig)
- 代码补全插件: [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- 包管理插件: [packer](https://github.com/wbthomason/packer.nvim)
- vim可选包管理: [vim-plug](https://github.com/junegunn/vim-plug)
- gcc批量注释
- rainbow彩虹括号: [rainbow](https://github.com/luochen1990/rainbow)
- css颜色匹配: [vim-css-color](https://github.com/ap/vim-css-color)
- 符号补全: [autopaiirs](https://github.com/windwp/nvim-autopairs)
- 快捷符号替换、添加: [vim-surround](https://github.com/tpope/vim-surround)


