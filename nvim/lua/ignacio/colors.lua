
local M = {}
M.colorscheme = "gruvbox"

-- try to set colorscheme ^^
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. M.colorscheme)
if not status_ok then
    vim.notify("COLORS ERR: colorscheme " .. M.colorscheme .. " not found", 3)
    return
end

-- dark mode ( use "light" for light mode )
vim.o.background = "dark"

-- trasparent background for main windows, SignColumn and floats
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
-- too much transparent
--vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

-- floating windows transparency
vim.go.winblend = 10

return M
