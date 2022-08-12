local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

local lspconfig = require("lspconfig")

local on_attach = function(_, bufnr)
	local map = function(mode, keys, func, desc)
		if desc then
			desc = "LSP: " .. desc
		end

		vim.keymap.set(mode, keys, func, { buffer = bufnr, desc = desc })
	end

	map("n", "<leader>rn", vim.lsp.buf.rename, "rename")
	map("n", "<C-.>", vim.lsp.buf.code_action, "Code actions")
	map("n", "<C-f>", vim.lsp.buf.format, "Code formatting")
	map("n", "K", vim.lsp.buf.hover, "Hover Documentation")
	map("n", "gd", require("telescope.builtin").lsp_definitions, "go to definition")
	map("n", "gi", require("telescope.builtin").lsp_implementations, "go to implementation")
	map("n", "gt", require("telescope.builtin").lsp_type_definitions, "go to type")
	map("n", "gr", require("telescope.builtin").lsp_references, "go to references")
end

-- Basic language servers that don't need additional config
for _, lsp in ipairs({ "pyright", "eslint", "html", "cssls" }) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

lspconfig.tailwindcss.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	root_dir = lspconfig.util.root_pattern(
		"tailwind.config.js",
		"tailwind.config.ts",
		"postcss.config.js",
		"postcss.config.ts"
	),
})

require("rust-tools").setup({
	server = {
		on_attach = on_attach,
		standalone = false,
	},
	tools = {
		inlay_hints = {
			show_variable_name = true,
		},
		hover_actions = {
			border = "none",
		},
	},
})

lspconfig.denols.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = {
		"javascript",
		"javascriptreact",
		"javascript.jsx",
		"typescript",
		"typescriptreact",
		"typescript.tsx",
		"markdown",
		"json",
		"jsonc",
	},
	root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc", "mod.ts", "deps.ts", "deps"),
	single_file_support = false,
	init_options = {
		enable = true,
		unstable = true,
		lint = true,
	},
})

lspconfig.tsserver.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json"),
	single_file_support = false,
	init_options = {
		lint = true,
	},
})

local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

lspconfig.sumneko_lua.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	single_file_support = false,
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
				path = runtime_path,
			},
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			},
			telemetry = {
				enable = false,
			},
			format = {
				enable = true,
			},
		},
	},
})
