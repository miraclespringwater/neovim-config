local opts = {
  noremap = true, --[[silent = true]]
}
local term_opts = { silent = true }
-- Shorten function name
local keymap = vim.api.nvim_set_keymap
-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- == Modes ==
-- normal_mode = "n"
-- insert_mode = "i"
-- visual_mode = "v"
-- visual_block_mode = "x",
-- term_mode = "t",
-- command_mode = "c"

---{{{ NORMAL }}}---
-- Better window/split navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
-- keep cursor in same place upon line deletion
keymap("n", "J", "mzJ`z", opts)
-- keep cursor in middle of page when navigating pages
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)
-- keep cursor in middle when navigating searches
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)
-- Open left hand explorer
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)
-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)
-- Navigate errors in quicklist (copen)
keymap("n", "<M-j>", "<cmd>cprev<CR>zz", opts)
keymap("n", "<M-k>", "<cmd>cnext<CR>zz", opts)
-- Navigate locations in location list (lopen)
--keymap("n", "<leader>h", "<cmd>lprev<CR>zz", opts)
--keymap("n", "<leader>l", "<cmd>lnext<CR>zz", opts)
keymap("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], opts)
keymap("n", "<leader>x", "<cmd>!chmod +x %<CR>", term_opts)
-- Navigate buffers (replaced by bufferline if loaded)
keymap("n", "L", ":bnext<CR>", opts)
keymap("n", "H", ":bprevious<CR>", opts)
-- Close current buffer, leave window open
keymap("n", "<leader>q", ":bp | sp | bn | bd <CR>", opts)
keymap("n", "<leader>Q", ":bp | sp | bn | bd!<CR>", opts)
-- Run RestNvim
keymap("n", "<leader>rr", "<Plug>RestNvim", opts)
keymap("n", "<leader>r<leader>r", "<Plug>RestNvimLast", opts)
keymap("n", "<leader>rp", "<Plug>RestNvimPreview", opts)
-- Enter new line at next character
keymap("n", "<leader>,<CR>", ":s/,/,\\r/ <CR>i", opts)
keymap("n", "<leader>}<CR>", ":s/}/\\r/ <CR>i", opts)
-- Save
keymap("n", "<C-s>", ":w<CR>", opts)

---{{{ INSERT }}}---
keymap("i", "<C-e>", "<plug>(emmet-expand-abbr)", { silent = true })
-- Save
keymap("i", "<C-s>", "<Esc>:w<CR>", opts)

---{{{ VISUAL }}}---
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
-- Move text up and down
keymap("v", "J", ":m .+1<CR>gv=gv", opts)
keymap("v", "K", ":m .-2<CR>gv=gv", opts)
-- Hold on to what was in clipboard
keymap("v", "p", '"_dP', opts)

---{{{ VISUAL BLOCK }}}---
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv=gv", opts)
keymap("x", "K", ":move '<-2<CR>gv=gv", opts)

---{{{ TERMINAL }}}---
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
-- Yanking (normal and visual mode)
keymap("n", "<leader>y", '"+y', opts)
keymap("v", "<leader>y", '"+y', opts)
keymap("x", "<leader>y", '"+y', opts)
keymap("n", "<leader>Y", '"+Y', opts)
-- Deleting (normal and visual mode)
keymap("n", "<leader>d", '"_d', opts)
keymap("v", "<leader>d", '"_d', opts)
