-- Seus atalhos gerais e nativos do Neovim
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Tecla Líder (Leader)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modos:
--   normal_mode = "n"
--   insert_mode = "i"
--   visual_mode = "v"

-- Exemplo dos atalhos que você provavelmente já tem:
map("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
map("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
map("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })
map("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })

-- NORMAL MODE
map("n", "<leader>cw", "<cmd>edit ~/.config/wezterm/wezterm.lua<cr>")

map("n", "<leader>w", "<Cmd>w<Cr>", 	{ desc = "Salvar" })
map("n", "<leader>W", "<Cmd>wa<Cr>", 	{ desc = "Salvar tudo" })
map("n", "<leader>q", "<Cmd>q<Cr>", 	{ desc = "Fechar janela atual", silent = true })
map("n", "<leader>Q", "<Cmd>q!<Cr>", 	{ desc = "Sair sem salvar", silent = true })

map("n", "<leader>e", "<Cmd>Explore<Cr>", { desc = "Abrir Explore" })
map("n", "<space>bn", "<Cmd>bnext<Cr>", { desc = "Buffer seguinte" })
map("n", "<space>bp", "<Cmd>bprevious<Cr>", { desc = "Buffer anterior" })
map("n", "<space>bb", "<Cmd>buffers<Cr>", { desc = "Buffers lista" })
map("n", "<space>bd", "<Cmd>bdelete<Cr>", { desc = "Buffers deletar" })

-- INSERT MODE
map("i", "jj", "<Esc>", { desc = "Sair do modo insert" , silent = true })
map("i", "jk", "<Cr>", { desc = "Querba de linha", silent = true })


