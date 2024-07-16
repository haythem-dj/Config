vim.g.mapleader = ' '
local map = vim.api.nvim_set_keymap
map('n', '<C-h>', '<C-w>h', {noremap = true, silent = false})
map('n', '<C-l>', '<C-w>l', {noremap = true, silent = false})
map('n', '<C-j>', '<C-w>j', {noremap = true, silent = false})
map('n', '<C-k>', '<C-w>k', {noremap = true, silent = false})

vim.keymap.set('n', '<C-g>', require("telescope").extensions.live_grep_args.live_grep_args, { noremap = true })

map('n', '<C-f>', ':Telescope find_files<CR>', {noremap = true, silent = true})

map("i", "<TAB>", 'coc#pum#visible() ? coc#_select_confirm() : "<TAB>"', {silent = true, noremap = true, expr = true})
map("i", "<Enter>", 'coc#pum#visible() ? coc#_select_confirm() : "<Enter>"', {silent = true, noremap = true, expr = true})

map('n', '<C-t>', ':NERDTreeToggle<CR>', {noremap = true, silent = true})
map('n', '<C-h>', ':NERDTreeFocus<CR>', {noremap = true, silent = true})
map('n', '<C-n>', ':NERDTree<CR>', {noremap = true, silent = true})


map('v', '<', '<gv', {noremap = true, silent = false})
map('v', '>', '>gv', {noremap = true, silent = false})

map("n", "<C-u>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<cr>",
    {noremap = true, silent = true})
map("n", "<C-d>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<cr>",
    {noremap = true, silent = true})
