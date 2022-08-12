-- Make Y behave consistently, like D and C
vim.keymap.set("n", "Y", "y$", { silent = true })

-- Paste without overwriting the unnamed register
vim.keymap.set("v", "P", '"_dP', { silent = true })

-- dD deletes all the characters in the line without removing the line itself
vim.keymap.set("n", "dD", "0D", { desc = "Delete all the characters in the line" })

-- Space does nothing in normal or visual mode
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Left/right navigate recent buffers
vim.keymap.set("n", "<Left>", "<cmd>bprevious<cr>", { silent = true })
vim.keymap.set("n", "<Right>", "<cmd>bnext<cr>", { silent = true })

-- Arrow key no-ops in visual/normal mode
vim.keymap.set("v", "<Left>", "<Nop>", { silent = true })
vim.keymap.set("v", "<Right>", "<Nop>", { silent = true })
vim.keymap.set({ "n", "v" }, "<Up>", "<Nop>", { silent = true })
vim.keymap.set({ "n", "v" }, "<Down>", "<Nop>", { silent = true })

-- j/k respect wrapped lines
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Delete a buffer without deleting the split
vim.keymap.set("n", "<leader>bd", "<cmd>bp|bd #<cr>", { desc = "Delete buffer without closing pane" })

-- Telescope mappings
vim.keymap.set("n", "<leader>f", require("telescope.builtin").find_files, { desc = "Find files by name" })
vim.keymap.set("n", "<leader>g", require("telescope.builtin").live_grep, { desc = "Find files with grep" })
vim.keymap.set("n", "<leader>b", require("telescope.builtin").buffers, { desc = "Find buffers" })
vim.keymap.set("n", "<leader>d", require("telescope.builtin").diagnostics, { desc = "Find diagnostics" })
vim.keymap.set("n", "<leader>o", require("telescope.builtin").jumplist, { desc = "View jumplist" })

-- Diagnostic pairs
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "dn", vim.diagnostic.goto_next)
vim.keymap.set("n", "dp", vim.diagnostic.goto_prev)

-- View diagnostic information
vim.keymap.set("n", "ge", vim.diagnostic.open_float)

-- Hit escape twice to exit the terminal
vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")
