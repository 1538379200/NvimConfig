require("nvim-lsp-installer").setup({
    -- local servers = { 'pyright', 'gopls', 'vimls', 'sumneko_lua', 'rust_analyzer', 'sqlls', 'taplo', 'yamlls', 'jsonls'}
    ensure_installed = { 'pyright', 'gopls', 'vimls', 'sumneko_lua', 'sqlls', 'yamlls', 'jsonls'}
    -- automatic_installation = true
})
