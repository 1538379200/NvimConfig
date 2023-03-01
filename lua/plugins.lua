vim.cmd [[packadd packer.nvim]]

return require('packer').startup({function()
  	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
	use 'neovim/nvim-lspconfig'
	use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
	use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
	use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
	use 'L3MON4D3/LuaSnip' -- Snippets plugin
    use {"hrsh7th/cmp-vsnip"}
    use {"hrsh7th/vim-vsnip"}
    use {"hrsh7th/cmp-buffer"}
    use {"hrsh7th/cmp-path"}
    use {"hrsh7th/cmp-cmdline"}
    use("quangnguyen30192/cmp-nvim-ultisnips")
    use {"honza/vim-snippets"}
    use {"SirVer/ultisnips"}
	use {
	    "williamboman/nvim-lsp-installer",
	}
	use {
	    'kyazdani42/nvim-tree.lua',
	    requires = {
	      'kyazdani42/nvim-web-devicons', -- 可选依赖,使目录树文件有好看图标
	    },
	    config = function() require'nvim-tree'.setup {} end
	}
	use {								-- gcc代码注释
	    'numToStr/Comment.nvim',
	    config = function()
	        require('Comment').setup()
	    end
	}
	use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.1',
	-- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
	}

	use {"akinsho/toggleterm.nvim", tag = '*', config = function()
	  require("toggleterm").setup()
	end}
	use {
	  'ggandor/leap.nvim',
	  config = function() require('leap').add_default_mappings()
	  end
	}

	-- 缩进线安装
	use "lukas-reineke/indent-blankline.nvim"

	-- tokyonight主题安装
	-- use 'folke/tokyonight.nvim'

	-- todo插件
	use {
	  "folke/todo-comments.nvim",
	  requires = "nvim-lua/plenary.nvim",
	  config = function()
	  require("todo-comments").setup {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	  }
	end
	}

    -- 替换statify的启动页
    use {
      'glepnir/dashboard-nvim',
      event = 'VimEnter',
      config = function()
        require('dashboard').setup {
            theme = 'hyper',
            config = {
              week_header = {
               enable = true,
              },
              shortcut = {
                { desc = ' Update', group = '@property', action = 'Lazy update', key = 'u' },
                {
                  desc = ' Files',
                  group = 'Label',
                  action = 'Telescope find_files',
                  key = 'f',
                },
                {
                  desc = ' Apps',
                  group = 'DiagnosticHint',
                  action = 'Telescope app',
                  key = 'a',
                },
                {
                  desc = ' dotfiles',
                  group = 'Number',
                  action = 'Telescope dotfiles',
                  key = 'd',
                },
              },
            },
        }
      end,
      requires = {'nvim-tree/nvim-web-devicons'}
    }

	-- 错误显示插件
	use {
	  "folke/trouble.nvim",
	  requires = "nvim-tree/nvim-web-devicons",
	  config = function()
		require("trouble").setup {
		  -- your configuration comes here
		  -- or leave it empty to use the default settings
		  -- refer to the configuration section below
		}
	  end
	}
	

	-- 标记显示插件
	use "chentoast/marks.nvim"
	
    -- github 主题配色
    -- use({
    --   'projekt0n/github-nvim-theme', tag = 'v0.0.7',
    -- -- or                            branch = '0.0.x'
    --   config = function()
    --     require('github-theme').setup({
    --       -- ...
    --     })
    --   end
    -- })

    -- lsp扩展美化插件
    use({
        "glepnir/lspsaga.nvim",
        branch = "main",
        config = function()
            require("lspsaga").setup({})
        end,
        requires = { {"nvim-tree/nvim-web-devicons"} }
    })

    -- treesitter 语言支持插件
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }

    -- 快捷设置分屏尺寸
    use('mrjones2014/smart-splits.nvim')

	use {'vim-airline/vim-airline'}
	use {'vim-airline/vim-airline-themes'}
	-- use {'mhinz/vim-startify'}
	-- use {'morhetz/gruvbox'}
	use {'cdelledonne/vim-cmake'}
	use {'karb94/neoscroll.nvim'}
	-- use {'thinca/vim-quickrun'}
	use {'luochen1990/rainbow'}
	use {'ap/vim-css-color'}
	use {'windwp/nvim-autopairs'}
	use {'tpope/vim-surround'}
    use {'1538379200/buffercontrol'}
    use {"1538379200/vim-switch-keyboard"}
    use {'akinsho/bufferline.nvim', tag = "v1.*", requires = 'nvim-tree/nvim-web-devicons'}
    
    -- markdown预览
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })

    -- 多光标插件
    use ({'mg979/vim-visual-multi', branch = 'master'})

    -- 悬浮命令行插件
    use({
      "folke/noice.nvim",
      config = function()
        require("noice").setup({
            -- add any options here
        })
      end,
      requires = {
        -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
        "MunifTanjim/nui.nvim",
        -- OPTIONAL:
        --   `nvim-notify` is only needed, if you want to use the notification view.
        --   If not available, we use `mini` as the fallback
        "rcarriga/nvim-notify",
        }
    })
    
    -- rust工具插件
    use 'neovim/nvim-lspconfig'
    use 'simrat39/rust-tools.nvim'
    -- Debugging
    use 'nvim-lua/plenary.nvim'
    use 'mfussenegger/nvim-dap'
    use {
        'saecki/crates.nvim',
        tag = 'v0.3.0',
        requires = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('crates').setup()
        end,
    }

    -- 主题
    -- use 'mhartington/oceanic-next'

    -- 主题
    use { "briones-gabriel/darcula-solid.nvim", requires = "rktjmp/lush.nvim" }
    end, 
config = {
	display = {
		open_fn = require('packer.util').float,
	}
}})

