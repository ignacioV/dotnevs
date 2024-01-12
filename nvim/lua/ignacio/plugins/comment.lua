local status_ok, comment = pcall(require, "Comment")
if not status_ok then
    vim.notify("comment is not installed", 3)
    return
end

comment.setup({
    toggler = { line = '<C-/>' },
    opleader = { line = '<C-/>' },
})

