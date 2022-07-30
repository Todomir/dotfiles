local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here
	use("wbthomason/packer.nvim") -- Have packer manage itself
	use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
	use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins
	use("windwp/nvim-autopairs") -- Autopairs, integrates with both cmp and treesitter
	use("numToStr/Comment.nvim") -- Easily comment stuff
	use({
		"yamatsum/nvim-nonicons",
		requires = { "kyazdani42/nvim-web-devicons" },
	})
	use("kyazdani42/nvim-tree.lua")
	use("akinsho/bufferline.nvim")
	use("moll/vim-bbye")
	use("nvim-lualine/lualine.nvim")
	use("akinsho/toggleterm.nvim")
	use("ahmedkhalf/project.nvim")
	use("lewis6991/impatient.nvim")
	use("lukas-reineke/indent-blankline.nvim")
	use("goolord/alpha-nvim")
	use("antoinemadec/FixCursorHold.nvim") -- This is needed to fix lsp doc highlight
	use("folke/which-key.nvim")
	use({ "stevearc/dressing.nvim", event = "BufReadPre" })
	use({
		"ThePrimeagen/refactoring.nvim",
		module = { "refactoring", "telescope" },
		keys = { [[<leader>r]] },
		wants = { "telescope.nvim" },
		config = function()
			require("refactoring").setup({})
		end,
	})
	use({
		"m-demare/hlargs.nvim",
		requires = { "nvim-treesitter/nvim-treesitter" },
	})
	-- Colorschemes
	use("rktjmp/lush.nvim")
	use("folke/tokyonight.nvim")
	use("olimorris/onedark.nvim")
	use({
		"catppuccin/nvim",
		as = "catppuccin",
	})

	-- cmp plugins
	use("hrsh7th/nvim-cmp") -- The completion plugin
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("saadparwaiz1/cmp_luasnip") -- snippet completions
	use("hrsh7th/cmp-nvim-lsp")
	use("github/copilot.vim") -- github copilot

	use({
		"tzachar/cmp-tabnine",
		run = "./install.sh",
		event = "InsertEnter",
		requires = "hrsh7th/nvim-cmp",
	}) -- tabnine completion
	use({
		"weilbith/nvim-code-action-menu",
		cmd = "CodeActionMenu",
	})
	use({
		"windwp/nvim-ts-autotag",
		event = "InsertEnter",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	})

	-- snippets
	use("L3MON4D3/LuaSnip") --snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

	-- LSP
	use("neovim/nvim-lspconfig") -- enable LSP
	use("williamboman/nvim-lsp-installer") -- simple to use language server installer
	use("tamago324/nlsp-settings.nvim") -- language server settings defined in json for
	use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters
	use({
		"jose-elias-alvarez/nvim-lsp-ts-utils",
		requires = "nvim-lua/plenary.nvim",
	}) -- extra utils for typescript development

	use("nvim-telescope/telescope.nvim")

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("nvim-treesitter/nvim-treesitter-textobjects")
	use("nvim-treesitter/playground")
	use("JoosepAlviste/nvim-ts-context-commentstring")
	use("p00f/nvim-ts-rainbow")
	use({
		"norcalli/nvim-colorizer.lua",
		cmd = "ColorizerToggle",
		config = function()
			require("colorizer").setup()
		end,
	})

	-- Git
	use("lewis6991/gitsigns.nvim")

	-- Navigation
	use({
		"karb94/neoscroll.nvim",
		opt = true,
		config = function()
			require("neoscroll").setup()
		end,
	})
	use({
		"phaazon/hop.nvim",
		branch = "v1",
		config = function()
			require("user.hop").setup()
		end,
		event = "BufRead",
	})
	use({
		"Pocco81/TrueZen.nvim",
		cmd = {
			"TZAtaraxis",
			"TZMinimalist",
			"TZFocus",
		},
		config = function()
			require("user.zen").setup()
		end,
	})
	use({
		"folke/twilight.nvim",
		config = function()
			require("user.twilight").setup()
		end,
	})

	use("nathom/filetype.nvim")
	use("tpope/vim-surround")

	-- workspaces
	use("metakirby5/codi.vim")

	-- misc
	use("psliwka/termcolors.nvim")

	-- Flutter
	use({
		"akinsho/flutter-tools.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("user.flutter").setup()
		end,
	})

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
