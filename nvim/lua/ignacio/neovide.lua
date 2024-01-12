
if vim.g.neovide then

    -- font
    -- vim.o.guifont = "Source Code Pro:h14"

    -- fix overall neovim scaling 
    vim.g.neovide_scale_factor = 0.5

    -- transparent background
    vim.g.neovide_transparency = 0.8
    vim.g.neovide_theme = 'dark'

    -- no need for da mouse
    vim.g.neovide_hide_mouse_when_typing = true

    -- some blur on floats? not working?
    vim.g.neovide_floating_blur_amount_x = 100.0
    vim.g.neovide_floating_blur_amount_y = 100.0

    vim.g.neovide_remember_window_size = true

    pcall(vim.cmd, "colorscheme " .. require("ignacio.colors").colorscheme)
end

