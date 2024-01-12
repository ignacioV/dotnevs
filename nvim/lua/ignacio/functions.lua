local M = {}

-- change nvim root to git root
local function get_git_root()
    local dot_git_path = vim.fn.finddir(".git", ".;")
    return vim.fn.fnamemodify(dot_git_path, ":h")
end
vim.api.nvim_create_user_command("CdGitRoot", function()
    vim.api.nvim_set_current_dir(get_git_root())
end, {})

-- for exporting
M.cdGitRoot = function()
    local git_root = get_git_root()
    vim.cmd("silent! cd ".. git_root)
end

return M;
