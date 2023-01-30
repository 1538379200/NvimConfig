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

	-- 文件标签页
	-- use{'akinsho/bufferline.nvim',
	--   config = function()
	--     require("bufferline").setup{}
	--   end
	-- }

	-- 状态栏
	-- use{'windwp/windline.nvim',
	--   config = function()
	--     require('wlsample.basic')
	--   end
	-- }
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
