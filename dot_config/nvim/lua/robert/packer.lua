local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = vim.fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	vim.cmd([[packadd packer]])
	print("Installing Packer - close and reopen nvim")
end

local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

packer.startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- Git commands
	use("tpope/vim-fugitive")

	-- Directory viewer
	use("justinmk/vim-dirvish")

	-- Git signs in signcolumn
	use({ "lewis6991/gitsigns.nvim", requires = { "nvim-lua/plenary.nvim" } })

	-- Comment plugin
	use("numToStr/Comment.nvim")

	-- My preferred colorscheme
	use("sainnhe/gruvbox-material")

	-- Treesitter integration
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

	-- More textobjects using treesitter queries
	use("nvim-treesitter/nvim-treesitter-textobjects")

	-- Language server config
	use("neovim/nvim-lspconfig")

	-- Completion UI
	use("hrsh7th/nvim-cmp")

	-- LSP completions
	use("hrsh7th/cmp-nvim-lsp")

	-- Snippet support
	use("L3MON4D3/LuaSnip")

	-- Snippet completions
	use("saadparwaiz1/cmp_luasnip")

	-- Signature UI
	use("ray-x/lsp_signature.nvim")

	-- Improved rust-analyzer integration
	use("simrat39/rust-tools.nvim")

	-- Fast statusline
	use("nvim-lualine/lualine.nvim")

	-- Icons for telescope/lualine/etc
	use("kyazdani42/nvim-web-devicons")

	-- Finishes quotes, brackets, etc.
	use("windwp/nvim-autopairs")

	-- Finishes XML-like tags
	use("windwp/nvim-ts-autotag")

	-- Detect indentation
	use("tpope/vim-sleuth")

	-- Surround text with pairs
	use("kylechui/nvim-surround")

	-- Language-server integration for non-language-server programs
	use("jose-elias-alvarez/null-ls.nvim")

	-- Progress UI
	use("j-hui/fidget.nvim")

	-- Fuzzy finder
	use("nvim-telescope/telescope.nvim")

	-- Fast search program from telescope
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

	-- Use telescope for builtin picker UI
	use({ "nvim-telescope/telescope-ui-select.nvim" })

	-- Functions that became a dependency of basically every plugin in existence
	use("nvim-lua/plenary.nvim")

	-- Preview for Markdown
	use({ "iamcco/markdown-preview.nvim", run = vim.fn["mkdp#util#install"] })
	if PACKER_BOOTSTRAP then
		packer.sync()
	end
end)
