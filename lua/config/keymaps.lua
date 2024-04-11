-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>mp", ":silent !osascript /absolute/path/to/file.applescript<cr>:MarkdownPreview<cr>", { desc = "markdown preview", remap = true, silent = true})
