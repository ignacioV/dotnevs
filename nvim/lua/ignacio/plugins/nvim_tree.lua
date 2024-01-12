-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`

local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
    vim.notify("nvim-tree is not installed", 3)
    return
end

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local function on_attach(bufnr)
    local api = require "nvim-tree.api"

    local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    -- default mappings
    api.config.mappings.default_on_attach(bufnr)

    -- custom mappings
    vim.keymap.set('n', '?',     api.tree.toggle_help,                  opts('Help'))
    vim.keymap.set('n', 'l',     api.node.open.edit,                    opts('Open'))
    vim.keymap.set('n', 'h',     api.node.navigate.parent_close,        opts('Close'))
    vim.keymap.set('n', '<C-p>', api.tree.change_root_to_node,          opts('CD'))

end

nvim_tree.setup({
    on_attach = on_attach,
    sync_root_with_cwd = true,
    renderer = {
        indent_width = 0
    }
})
