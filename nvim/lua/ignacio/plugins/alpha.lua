
local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
    vim.notify("alpha is not installed", 3)
    return
end

-- local status_ok_db, dashboard = pcall(require, "alpha.themes.startify")
-- if not status_ok_db then
--     vim.notify("alpha startify is not installed", 3)
--     return
-- end

local status_ok_db, dashboard = pcall(require, "alpha.themes.dashboard")
if not status_ok_db then
    vim.notify("alpha dashboard is not installed", 3)
    return
end

local status_ok_fortune, fortune = pcall(require, "alpha.fortune")
if not status_ok_fortune then
    vim.notify("alpha fortune is not installed", 3)
    return
end

dashboard.section.header.val = {
    [[                               __                ]],
    [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
    [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
    [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
    [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
    [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
}


dashboard.section.buttons.val = {
    dashboard.button( "e", "  > New file" , ":ene <BAR> startinsert <CR>"),
    dashboard.button( "f", "  > Find file", ":Telescope find_files<CR>"),
    dashboard.button( "r", "  > Recent"   , ":Telescope oldfiles<CR>"),
    dashboard.button( "s", "  > Settings" , ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
    dashboard.button( "q", "󰅚  Quit NVIM" , ":qa<CR>"),
}

dashboard.section.footer.val = fortune
dashboard.config.opts.noautocmd = true
vim.cmd[[autocmd User AlphaReady echo 'ready']]

alpha.setup(dashboard.config)
