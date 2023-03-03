require("nvim-tree").setup {
    view = {
        width = 50,
    },
    renderer = {
        icons = {
            show = {
                git = false,
            },
        },
    },
    -- view = {
    --     float = {
    --         enable = true,
    --         quit_on_focus_loss = true,
    --         open_win_config = {
    --         relative = "editor",
    --         border = "rounded",
    --         width = 30,
    --         height = 30,
    --         row = 1,
    --         col = 1,
    --         },
    --     },
    -- }
}
