
require('nvim-tree').setup {
    on_attach = function()
        local api = require('nvim-tree.api')

        -- Open/close tree
        vim.keymap.set('n', '<leader>nt', function()
            if api.tree.is_open() then
                api.tree.close()
            else
                api.tree.open()
            end
        end)
    end
}
