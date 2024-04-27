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

-----------------------------------------------------------------------------------------------------------------------
local plugins = {
    -- Cosmetic
    {
        'vim-airline/vim-airline',
        config = function()
            require('plugins.vim-airline')
        end
    },
    'vim-airline/vim-airline-themes',
    'morhetz/gruvbox',

    -- Navigation
    {
        'preservim/nerdtree',
        config = function()
            require('plugins.nerdtree')
        end
    },
    -- {
    --     'nvim-tree/nvim-tree.lua',
    --     config = function()
    --         require('plugins.nvimtree')
    --     end
    -- },
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
    'github/copilot.vim',
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

-----------------------------------------------------------------------------------------------------------------------
require("lazy").setup(plugins, opts)
