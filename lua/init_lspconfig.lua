-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)	-- 将update_capabilities 改成替换的 default_capabilities 
local lspconfig = require('lspconfig')
-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { 'pyright', 'gopls', 'vimls', 'lua_ls', 'sqlls', 'taplo', 'yamlls', 'jsonls'}
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    -- on_attach = my_custom_on_attach,
    capabilities = capabilities,
  }
end
local cmp_ultisnips_mappings = require("cmp_nvim_ultisnips.mappings")
-- luasnip setup
local luasnip = require 'luasnip'
-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
  -- snippet = {
  --   expand = function(args)
  --     luasnip.lsp_expand(args.body)
  --   end,
  -- },
    snippet = {
            expand = function(args)
              vim.fn["UltiSnips#Anon"](args.body)
            end,
          },
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    -- ['<Space>'] = cmp.mapping.close(),
    ["<C-z>"] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
    ["<C-CR>"] = cmp.mapping(
            function(fallback)
                -- cmp_ultisnips_mappings.expand(fallback)
                cmp_ultisnips_mappings.compose{"expand"}(fallback)
            end,
            {"i", "s", }
        ),
    ["<C-Tab>"] = cmp.mapping(
      function(fallback)
        -- cmp_ultisnips_mappings.expand_or_jump_forwards(fallback)
        cmp_ultisnips_mappings.jump_forwards(fallback)
      end,
      { "i", "s", --[[ "c" (to enable the mapping in command mode) ]] }
    ),
    ["<C-S-Tab>"] = cmp.mapping(
      function(fallback)
        cmp_ultisnips_mappings.jump_backwards(fallback)
      end,
      { "i", "s", --[[ "c" (to enable the mapping in command mode) ]] }
    ),
  }),
  sources = {
    { name = 'nvim_lsp' },
    -- { name = 'vsnip' },
    { name="ultisnips"},
    { name = 'path' },
    { name = 'buffer' },
    { name = "crates" },
  },
}
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})
cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' }
      }, {
        {
          name = 'cmdline',
          option = {
            ignore_cmds = { 'Man', '!' }
          }
        }
      })
    })
