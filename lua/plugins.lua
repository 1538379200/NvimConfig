vim.cmd [[packadd packer.nvim]]

return require('packer').startup({function()
  	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
	use 'neovim/nvim-lspconfig'
	use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
	use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
	use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
	use 'L3MON4D3/LuaSnip' -- Snippets plugin
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
	use 'folke/tokyonight.nvim'

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
	
	-- rnvimr 悬浮的文件树系统
	use "kevinhwang91/rnvimr"

	-- 标记显示插件
	use "chentoast/marks.nvim"
	
    -- github 主题配色
    use({
      'projekt0n/github-nvim-theme', tag = 'v0.0.7',
    -- or                            branch = '0.0.x'
      config = function()
        require('github-theme').setup({
          -- ...
        })
      end
    })

    -- 快捷设置分屏尺寸
    use('mrjones2014/smart-splits.nvim')

	use {'vim-airline/vim-airline'}
	use {'vim-airline/vim-airline-themes'}
	use {'mhinz/vim-startify'}
	use {'morhetz/gruvbox'}
	use {'cdelledonne/vim-cmake'}
	use {'karb94/neoscroll.nvim'}
	use {'thinca/vim-quickrun'}
	use {'luochen1990/rainbow'}
	use {'ap/vim-css-color'}
	use {'windwp/nvim-autopairs'}
	use {'tpope/vim-surround'}
end, 
config = {
	display = {
		open_fn = require('packer.util').float,
	}
}})

