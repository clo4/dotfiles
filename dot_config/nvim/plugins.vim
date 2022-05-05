" This file handles plugin management and configuration.

call plug#begin(stdpath('data') . '/plugged')

" Pluggable repeating (necessary for vim-surround)
Plug 'tpope/vim-repeat'

" Surround motions and objects with characters
Plug 'tpope/vim-surround'

" Improvements to netrw
Plug 'tpope/vim-vinegar'

" Git commands
Plug 'tpope/vim-fugitive'

" Add comments easily
Plug 'tpope/vim-commentary'

" A nice theme, based on gruvbox
Plug 'sainnhe/gruvbox-material'

" The normal status line is fine, but it's boring...
Plug 'itchyny/lightline.vim'

" Show git statuses in the sign column
Plug 'airblade/vim-gitgutter'

" Allow project-local configuration
Plug 'ii14/exrc.vim'

" Markdown preview using Glow
Plug 'ellisonleao/glow.nvim', {'branch': 'main'}

" Tree-sitter configuration
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }

" LSP shit
Plug 'neovim/nvim-lspconfig'	" Easy-ish LSP config
Plug 'hrsh7th/nvim-cmp'		 " Autocompletions
Plug 'hrsh7th/cmp-nvim-lsp'	 " nvim-lsp completion provider
Plug 'windwp/nvim-autopairs'	" Automatic bracket pairs
"Plug 'simrat39/rust-tools.nvim' " Enhanced Rust support

" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

call plug#end()


" Theme settings (must be before 'colorscheme')
let g:gruvbox_material_enable_italic = 0
let g:gruvbox_material_disable_italic_comment = 1
let g:gruvbox_material_sign_column_background = 'none'
let g:gruvbox_material_palette = 'original'
silent! colorscheme gruvbox-material

" Configure lightline with gruvbox
let g:lightline = {}
let g:lightline.colorscheme = 'gruvbox_material'

" Bindings for Glow
nnoremap <leader>mp :Glow<Return>

" Bindings for telescope
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<Return>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<Return>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<Return>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<Return>

" Mark exrc files as trusted when saving them
augroup trust_exrc
	autocmd!
	autocmd BufWritePost .exrc nested silent ExrcTrust
augroup end

" Valid exrc file names
let g:exrc#names = ['.vimrc', '.exrc', '.nvimrc']

""""""""""""""""""""""""""""""""""""""""""""""""""

" Configure NeoVim Lua stuff (LSP, tree-sitter, etc).
lua << EOF

-- Set up language servers

local lspconfig = require 'lspconfig'

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local on_attach = function(client, bufnr)
	local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
	local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

	-- Enable completion triggered by <c-x><c-o>
	buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

	-- Mappings.
	local opts = {
		noremap = true,
		silent=true
	}

	-- See `:help vim.lsp.*` for documentation on any of the below functions
	buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<Return>', opts)
	buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<Return>', opts)
	buf_set_keymap('n', 'gh', '<cmd>lua vim.lsp.buf.hover()<Return>', opts)
	buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<Return>', opts)
	buf_set_keymap('n', 'ge', '<cmd>lua vim.diagnostic.open_float()<Return>', opts)
	buf_set_keymap('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<Return>', opts)
	buf_set_keymap('i', '<C-s>', '<cmd>lua vim.lsp.buf.signature_help()<Return>', opts)
	buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<Return>', opts)
	buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<Return>', opts)
	buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<Return>', opts)
	buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<Return>', opts)
	buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<Return>', opts)
	buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<Return>', opts)
	buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<Return>', opts)
	buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<Return>', opts)
	buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<Return>', opts)
	buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<Return>', opts)
	buf_set_keymap('n', '<space>fo', '<cmd>lua vim.lsp.buf.formatting()<Return>', opts)

end

-- Some servers are simple enough to initialize automatically
local servers = { 'pyright', 'vimls' }
for _, ls in ipairs(servers) do
	lspconfig[ls].setup {
		on_attach = on_attach,
		capabilities = capabilities,
	}
end

lspconfig.rust_analyzer.setup({
	on_attach=on_attach,
	settings = {
		["rust-analyzer"] = {
			assist = {
				importGranularity = "module",
				importPrefix = "self",
			},
			cargo = {
				loadOutDirsFromCheck = true
			},
			procMacro = {
				enable = true
			},
		}
	}
})

lspconfig.denols.setup {
	on_attach = on_attach,
	capabilities = capabilities,
	root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
	init_options = {
		enable = true,
		unstable = true,
		lint = true,
	}
}

lspconfig.tsserver.setup {
	on_attach = on_attach,
	capabilities = capabilities,
	root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json"),
	init_options = {
		lint = true,
	}
}

-- Set up nvim-cmp

local cmp = require 'cmp'

cmp.setup {
	mapping = {
		['<C-p>'] = cmp.mapping.select_prev_item(),
		['<C-n>'] = cmp.mapping.select_next_item(),
		['<C-d>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.close(),
		-- This is disabled because nvim-autopairs provides a better mapping
		-- ['<Return>'] = cmp.mapping.confirm {
		--	behavior = cmp.ConfirmBehavior.Replace,
		--	select = true,
		-- },
		['<Tab>'] = function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			--elseif luasnip.expand_or_jumpable() then
			--	luasnip.expand_or_jump()
			else
				fallback()
			end
		end,
		['<S-Tab>'] = function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			--elseif luasnip.jumpable(-1) then
			--	luasnip.jump(-1)
			else
				fallback()
			end
		end,
	},
	sources = {
		{ name = 'nvim_lsp' },
		--{ name = 'buffer' },
	}
}

-- Set up nvim-treesitter

local ts = require 'nvim-treesitter.configs'

ts.setup {
	ensure_installed = {
		'javascript',
		'typescript',
		'jsdoc',
		'json',
		'jsonc',
		'css',
		'html',
		'go',
		'rust',
		'vim',
		'python',
		'fish',
		'bash',
		'lua',
	},
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
	},
	incremental_selection = {
		enable = true,
	},
}

-- Set up rust-tools

--local rusttools = require 'rust-tools'
--rusttools.setup {}

-- Set up autopairs

local autopairs = require 'nvim-autopairs'
autopairs.setup {}

-- This MUST be after nvim-cmp is set up
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on(
	'confirm_done',
	cmp_autopairs.on_confirm_done {
		map_char = {
			tex = '{'
		},
	}
)

EOF
