vim.g.mapleader = " "

vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

-- In visual mode, use J and K to move highlighted text up and down
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- Join lines without moving cursor
vim.keymap.set('n', 'J', 'mzJ`z')

-- Keep cursor in place when half-page jumping
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- Keep cursor in middle when navigating searches
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Split window
vim.keymap.set('n', '<leader>sh', '<C-w>s')
vim.keymap.set('n', '<leader>sv', '<C-w>v')

-- Window navigation
vim.keymap.set('n', '<leader>wk', '<C-w><Up>')
vim.keymap.set('n', '<leader>wj', '<C-w><Down>')
vim.keymap.set('n', '<leader>wh', '<C-w><Left>')
vim.keymap.set('n', '<leader>wl', '<C-w><Right>')

vim.keymap.set('n', '<leader>wc', '<C-w>c')
