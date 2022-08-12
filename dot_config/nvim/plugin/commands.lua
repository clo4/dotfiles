-- Use :Term to open a new terminal
vim.api.nvim_create_user_command("Term", ":vsp | terminal", { desc = "Open a new terminal in a split" })
