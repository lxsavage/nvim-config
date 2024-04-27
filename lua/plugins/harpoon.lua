local harpoon = require('harpoon')
local hList = harpoon:list()

harpoon:setup()

vim.keymap.set('n', '<leader>ap', function() hList:prepend() end)
vim.keymap.set('n', '<leader>ae', function() hList:append() end)

vim.keymap.set('n', '<leader>rh', function() hList:removeAt(1) end)
vim.keymap.set('n', '<leader>rj', function() hList:removeAt(2) end)
vim.keymap.set('n', '<leader>rk', function() hList:removeAt(3) end)
vim.keymap.set('n', '<leader>rl', function() hList:removeAt(4) end)

vim.keymap.set('n', '<C-e>', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set('n', '<C-h>', function() hList:select(1) end)
vim.keymap.set('n', '<C-j>', function() hList:select(2) end)
vim.keymap.set('n', '<C-k>', function() hList:select(3) end)
vim.keymap.set('n', '<C-l>', function() hList:select(4) end)


