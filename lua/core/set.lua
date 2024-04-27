-- Tabs
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Formatting
-- vim.opt.textwidth = 120

-- Visual
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.wrap = false
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 8
vim.opt.updatetime = 50
vim.opt.colorcolumn = '80'

-- Set color scheme, and enable background transparency
vim.cmd.colorscheme('gruvbox')
vim.cmd("highlight Normal ctermbg=none")
