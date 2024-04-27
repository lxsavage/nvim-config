require('mason').setup()
require('mason-lspconfig').setup {
  ensure_installed = {
    'bashls',
    'clangd',
    'eslint',
    'html',
    'jsonls',
    'tsserver',
    'denols',
    'lua_ls',
    'pylsp',
    'taplo',
    'yamlls',
    'gopls',
    'angularls',
    'fsautocomplete',
    'ocamllsp'
  }
}

local lspconfig = require('lspconfig')
lspconfig.lua_ls.setup {
  settings = {
    Lua = {
      diagnostics = {
        globals = {
          'vim',
          'require'
        },
      },
    },
  }
}

lspconfig.pylsp.setup {}
lspconfig.gopls.setup {}
lspconfig.angularls.setup {}
lspconfig.fsautocomplete.setup {}
lspconfig.ocamllsp.setup {}

-- Start denols if the root has deno.json or deno.jsonc, otherwise use tsserver
-- if package.json is found
lspconfig.denols.setup {
  root_dir = lspconfig.util.root_pattern(
    'deno.json',
    'deno.jsonc',
    'import_map.json'
  )
}

lspconfig.tsserver.setup {
  root_dir = function(fname)
    if not lspconfig.util.root_pattern('deno.json', 'deno.jsonc',
      'import_map.json')(fname) then

      return lspconfig.util.root_pattern('package.json')(fname) or
        lspconfig.util.path.dirname(fname)
    end
  end,
  single_file_support = false
}

lspconfig.clangd.setup {
  cmd = { 'clangd', '--background-index' },
  show_parameter_hints = true,
  capabilities = {
    offsetEncoding = 'utf-8'
  }
}

-- Keybindings
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<C-p>', vim.diagnostic.goto_prev)
vim.keymap.set('n', '<C-f>', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', '<leader>gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<leader>sh', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<leader>waa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<leader>war', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<leader>wal', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<C-r><C-r>', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end
})
