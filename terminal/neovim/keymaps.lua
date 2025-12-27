-- Remap 'kj' to Escape in insert mode
vim.keymap.set("i", "kj", "<Esc>", { desc = "Exit insert mode" })

-- Remap 'jk' to Escape in insert mode
vim.keymap.set("i", "jk", "<Esc>", { desc = "Exit insert mode" })
--
-- Remap 'gb' to C-o in normal mode
vim.keymap.set("n", "gb", "<C-o>", { desc = "Go back" })
