local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)


-- Resize with arrows
keymap("n", "<A-Up>", ":resize +10<CR>", opts)
keymap("n", "<A-Down>", ":resize -10<CR>", opts)
keymap("n", "<A-Left>", ":vertical resize -10<CR>", opts)
keymap("n", "<A-Right>", ":vertical resize +10<CR>", opts)
-- Resize with arrows TERMINAL
keymap("t", "<A-Up>", "<C-\\><C-N>:resize +10<CR>a", opts)
keymap("t", "<A-Down>", "<C-\\><C-N>:resize -10<CR>a", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
--exit it
keymap("t", "<ESC><ESC>", "<C-\\><C-N>", term_opts)

------------------------------
-- My custom ones
------------------------------

-- visual yank dont change clipboard
keymap("v", "p", '"_dP', opts)

-- yank/paste from/to clipborad
keymap("v", "<leader>y", '"+y', opts)
keymap("n", "<leader>p", '"+p', opts)
keymap("v", "<leader>p", '"+p', opts)

-- select all, like CTRL+A
keymap("n", "<leader>A", 'ggVG', opts)

-- I wanna quit with any of those
vim.api.nvim_create_user_command('WQ', 'wq', {})
vim.api.nvim_create_user_command('Wq', 'wq', {})
vim.api.nvim_create_user_command('W', 'w', {})
vim.api.nvim_create_user_command('Q', 'q', {})

-- who needs this crap
keymap("n", 'Q', '<Nop>', opts)

-- macro starts with m
keymap("n", 'm', 'q', opts)
keymap("n", 'q', '<Nop>', opts)

--faster delete word
keymap("i", ";d", "<C-W>", opts)

-- <F3> give that TIMESTAMP baby
keymap("n", "<leader><F3>", ':r! date +"\\%Y-\\%m-\\%d \\%H:\\%M:\\%S"<CR>', opts)
keymap("n", "<F3>", ':r! date +"\\%Y-\\%m-\\%d \\%H:\\%M:\\%S"<CR>', opts)

-- Clear search highlighting with <leader> and c
keymap('n', '<leader>c', ':nohl<CR>', opts)

-- quick save and close
keymap('n', '<A-q>', ':wq<CR>', opts)

-- quick save and reload
keymap('n', '<leader><leader>so', ':w<CR>:so %<CR>', opts)

-- Telescope 
keymap("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
keymap("n", "<leader>g", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "<leader>o", "<cmd>Telescope oldfiles<cr>", opts)
keymap("n", "<leader><c-v>", "<cmd>Telescope registers<cr>", opts)
keymap("v", "<leader><c-v>", "dh<cmd>Telescope registers<cr>", opts)
-- TODO: old files from current dir

---- NvimTree ----
-- open file in nvim tree
keymap("n", "<A-1>", ":NvimTreeFindFileToggle<cr>", opts)

-- Float terminal
keymap("n", "<leader><leader>fo", ":FloatermNew --height=0.3 --wintype=split<cr>", opts)
keymap("n", "<leader><leader>fk", ":FloatermKill!<cr>", opts)
keymap("n", "<A-0>", ":FloatermToggle<cr>", opts)

keymap("t", "<A-0>", "<C-\\><C-N>:FloatermToggle<cr>", term_opts)
keymap("t", "<A-n>", "<C-\\><C-N>:FloatermNew --height=0.3 --wintype=split<cr>", opts)
keymap("t", "<A-l>", "<C-\\><C-N>:FloatermNext<cr>", term_opts)
keymap("t", "<A-h>", "<C-\\><C-N>:FloatermPrev<cr>", term_opts)

