-- Absolute line number with relative numbers above/below
vim.opt.number = true
vim.opt.relativenumber = true

-- Set highlight on search
vim.opt.hlsearch = false

-- Substitute always uses global flag
vim.opt.gdefault = true

-- Enable mouse mode
vim.opt.mouse = "a"

-- Case insensitive matches, until there's an upper-case letter
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Set colorscheme
vim.opt.termguicolors = true
vim.g.gruvbox_material_enable_italic = 0
vim.g.gruvbox_material_disable_italic_comment = 1
vim.g.gruvbox_material_sign_column_background = "none"
vim.g.gruvbox_material_palette = "original"
vim.cmd([[colorscheme gruvbox-material]])

-- Set completeopt to have a better completion experience
vim.opt.completeopt = { "menuone", "noselect" }

-- Show line and col
vim.opt.ruler = true

-- Show certain hidden characters
vim.opt.list = true
vim.opt.listchars = { tab = "→ ", lead = "·", trail = "·", nbsp = "•" }

-- Delete comment characters when joining lines
vim.opt.formatoptions:append("j")

-- Recognize numbered lists
vim.opt.formatoptions:append("n")

-- Read changes from disk
vim.opt.autoread = true

-- Highlight the line with the cursor on it
vim.opt.cursorline = true

-- Sane line wrapping settings
vim.opt.wrap = false
vim.opt.linebreak = true
vim.opt.showbreak = "↪"
vim.opt.breakindent = true
vim.opt.breakindentopt = "list:-1"

-- Sane tab settings
vim.opt.expandtab = false
vim.opt.smarttab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 0

-- Splits will open on the right/below instead of left/above
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Vertical diffs
vim.opt.diffopt:append("vertical")

-- 3 lines/cols buffer when scrolling
vim.opt.scrolloff = 3
vim.opt.sidescrolloff = 3

-- Always draw the sign column
vim.opt.signcolumn = "yes"

-- Decrease update time
vim.opt.updatetime = 1000

-- Wait 300ms for a sequence to complete
vim.opt.timeout = true
vim.opt.timeoutlen = 300

-- Ignore files matching these patterns while expanding a wildcard
vim.opt.wildignore = { "*.o", "*.obj", "*.bak", "*.exe", "*.pyc", ".DS_Store" }

-- Hide the welcome message
vim.opt.shortmess = "I"

-- Ask to write instead of failing when using :q
vim.opt.confirm = true

-- Use tree-sitter folds
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevelstart = 69

-- Display a window title
vim.opt.title = true

-- Use the + register for operations that would normally use _
vim.opt.clipboard = "unnamedplus"

-- Don't display the ~ chars at the end of the buffer
vim.opt.fillchars = { eob = " " }

-- Allows better syntax highlighting in these fenced languages
vim.g.markdown_fenced_languages = {
	"ts=typescript",
	"tsx=typescriptreact",
	"js=javascript",
	"jsx=javascriptreact",
}
