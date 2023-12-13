-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- FZF / File Previewer
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.5',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	-- Color Scheme (can apply from any repo)
	use({
		'loctvl842/monokai-pro.nvim',
		as = 'monokai-pro',
		config = function()
			vim.cmd('colorscheme monokai-pro')
		end
	})

	-- Only syntax coloring. NOT AN LSP
	use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

	-- Easier file marking
	use "nvim-lua/plenary.nvim" -- don't forget to add this one if you don't have it yet!
	use {
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		requires = { {"nvim-lua/plenary.nvim"} }
	}

	-- Allows you to see, rollback to, adjust, etc.. changes that have been made in buffer similar to git hist/chlg
	use "mbbill/undotree"

	-- Allows movement between BOTH vim & tmux panes with crtl + h/j/k/l
	use "christoomey/vim-tmux-navigator"

	-- LSP (goodbye coc.nvim :( <3)
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		requires = {
			--- Uncomment these if you want to manage LSP servers from neovim
			{'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'},

			-- LSP Support
			{'neovim/nvim-lspconfig'},
			-- Autocompletion
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'L3MON4D3/LuaSnip'},
		}
	}

     use {
         "aznhe21/actions-preview.nvim",
         config = function()
             vim.keymap.set({ "v", "n" }, "<leader>c", require("actions-preview").code_actions)
         end,
     }
end)
