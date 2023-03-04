-- Disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- Empty setup using defaults
require("nvim-tree").setup()

vim.keymap.set("n", "<Leader>pt", "<cmd>NvimTreeToggle")
