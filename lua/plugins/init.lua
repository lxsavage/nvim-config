local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-------------------------------------------------------------------------------
local plugins = {
    -- Cosmetic
    'morhetz/gruvbox',
    {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-icons' },
        config = function()
            require('plugins.lua-line')
        end
    },

    -- Navigation
    {
        'preservim/nerdtree',
        config = function()
            require('plugins.nerdtree')
        end
    },
    'nvim-lua/plenary.nvim',
    {
        'ThePrimeagen/harpoon',
        branch = 'harpoon2',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('plugins.harpoon')
        end
    },
    {
        'nvim-telescope/telescope.nvim',
        version = '0.1.4',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('plugins.telescope')
        end
    },

    -- Editing
    'tpope/vim-sleuth',
    'tpope/vim-surround',
    'tpope/vim-commentary',
    {
        'github/copilot.vim',
        lazy = false,
        init = function()
            require('plugins.copilot')
        end
    },
    {
        'williamboman/mason.nvim',
        config = function()
            require('mason').setup()
        end
    },
    {
        'williamboman/mason-lspconfig.nvim',
        dependencies = { 'williamboman/mason.nvim' }
    },
    {
        'neovim/nvim-lspconfig',
        dependencies = { 'williamboman/mason-lspconfig.nvim' },
        config = function()
            require('plugins.lspconfig')
        end
    },
    'p00f/clangd_extensions.nvim',
    {
        'mhartington/formatter.nvim',
        config = function()
            require('plugins.formatter')
        end
    },

    -- Highlighting
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        config = function()
            require('plugins.treesitter')
        end
    }
}

local opts = {
    checker = {
        enabled = true,
    },
    ui = {
        icons = {
            cmd = "⌘",
            config = "🛠",
            event = "📅",
            ft = "📂",
            init = "⚙",
            keys = "🗝",
            plugin = "🔌",
            runtime = "💻",
            require = "🌙",
            source = "📄",
            start = "🚀",
            task = "📌",
            lazy = "💤 ",
        },
    },
}

-------------------------------------------------------------------------------
require("lazy").setup(plugins, opts)
