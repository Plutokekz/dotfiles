local map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}

map('n', '<leader>e', ':NvimTreeOpen<CR>', opts)
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-l>', '<C-w>l', opts)
map('n', '<C-i>', '<S-Insert>', opts)
map('n', '<C-t>', ':tabnew<CR>', opts)

