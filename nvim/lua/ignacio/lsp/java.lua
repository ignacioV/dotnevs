local M = {}

function Start_jdt()
  require("jdtls").start_or_attach(require("ignacio.lsp.settings.jdtls_conf").get_config())
end
local function after_start()
  require("ignacio.functions").cdGitRoot()
end

M.setup = function()
    vim.api.nvim_create_autocmd({ "FileType"}, {
        pattern = "java",
        callback = function()
            Start_jdt()
            --require("ignacio.functions").cdGitRoot()
            after_start()
        end,
        desc = "Start java language server"
    })

-- vim.keymap.set('n', 'l', nvim_api.node.open.edit, opts)
-- vim.keymap.set('n', 'h', nvim_api.node.navigate.parent_close, opts)
end

M.java_keymaps = function()
    local keymap = vim.keymap.set

    keymap("n", "<leader>r", ":lua vim.notify('Refactor ignored<cr>')", { silent = true })
    keymap("n", "<leader>ro", ":lua require'jdtls'.organize_imports()<cr>", { silent = true })
    keymap("n", "<leader>rv", ":lua require'jdtls'.extract_variable()<cr>", { silent = true })
    keymap("v", "<leader>rv", "<Esc>:lua require'jdtls'.extract_variable(true)<cr>", { silent = true })
    keymap("n", "<leader>rc", ":lua require'jdtls'.extract_constant()<cr>", { silent = true })
    keymap("v", "<leader>rc", "<Esc>:lua require'jdtls'.extract_constant(true)<cr>", { silent = true })
    keymap("v", "<leader>rm", "<Esc>:lua require'jdtls'.extract_method(true)<cr>", { silent = true })

--    vim.cmd [[
--    command! -buffer -nargs=? -complete=custom,v:lua.require'jdtls'._complete_compile     JdtCompile lua require('jdtls').compile(<f-args>)
--    command! -buffer -nargs=? -complete=custom,v:lua.require'jdtls'._complete_set_runtime JdtSetRuntime lua require('jdtls').set_runtime(<f-args>)
--    command! -buffer JdtUpdateConfig lua require('jdtls').update_project_config()
--    command! -buffer JdtJol lua require('jdtls').jol()
--    command! -buffer JdtBytecode lua require('jdtls').javap()
--    command! -buffer JdtJshell lua require('jdtls').jshell()
--    ]]
end

return M
