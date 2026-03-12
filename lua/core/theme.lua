-- Visual
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.wrap = false
vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.scrolloff = 8
vim.opt.updatetime = 50
vim.opt.colorcolumn = '80'

-- Set color scheme
vim.o.background = 'dark'
vim.o.termguicolors = true
vim.cmd.colorscheme('gruvbox')

vim.g.gruvbox_italic = 1


-- Enable background transparency
vim.cmd [[
  highlight Normal guibg=none
  highlight NonText guibg=none
  highlight Normal ctermbg=none
  highlight NonText ctermbg=none
]]

-- Workaround - fix inverted status line
-- vim.api.nvim_set_hl(0, "StatusLine", { reverse = false })
-- vim.api.nvim_set_hl(0, "StatusLineNC", { reverse = false })
-- vim.cmd("AirlineRefresh")
