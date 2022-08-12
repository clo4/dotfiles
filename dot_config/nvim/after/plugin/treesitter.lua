require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"lua",
		"typescript",
		"tsx",
		"javascript",
		"rust",
		"go",
		"python",
		"sql",
		"html",
	},
	highlight = { enable = true },
	indent = { enable = true },
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<C-Space>",
			node_incremental = "<C-Space>",
			node_decremental = "<C-Backspace>",
		},
	},
	autotag = {
		enable = true,
		filetypes = { "html", "xml", "javascriptreact", "typescriptreact" },
	},
})
