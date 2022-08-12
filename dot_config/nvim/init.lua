-- Use <space> for <leader> and <localleader>
-- Has to be done first because keymaps created with <leader>
-- before mapleader is set will use the old mapleader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- plugins yay
require("robert.packer")

-- This is some stupid load order bullshit
require("robert.disable_builtins")
