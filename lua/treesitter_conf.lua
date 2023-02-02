require'nvim-treesitter.configs'.setup {
    -- 默认确定安装的语言服务
    ensure_installed = {"html", "markdown", "toml", "python", "lua", "vim"},
    -- 高亮显示
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    -- 启用增量选择，在可视化模式下，回车可以向外扩展选择，退格键收缩选择
    incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<CR>',
          node_incremental = '<CR>',
          node_decremental = '<BS>',
          scope_incremental = '<TAB>',
        }
    },
    -- 基于treesitter的格式化，选中可以使用 = 来快速进行格式化
    indent = {
        enable = true
    }
}
