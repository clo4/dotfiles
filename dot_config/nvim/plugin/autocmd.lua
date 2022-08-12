-- Highlight the yanked region briefly
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", {
	clear = true,
})
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})

-- If the file's parent directory doesn't exist, create it first
local mkdirp_on_write = vim.api.nvim_create_augroup("MkdirpOnWrite", {
	clear = true,
})
vim.api.nvim_create_autocmd("BufWritePre", {
	callback = function()
		local dir = vim.fn.expand("<afile>:p:h")
		if vim.fn.isdirectory(dir) == 0 then
			vim.fn.mkdir(dir, "p")
		end
	end,
	group = mkdirp_on_write,
	pattern = "*",
})
