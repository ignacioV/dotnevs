local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  vim.notify("LSP init ERR: lspconfig not found", 3)
  return
end

require "ignacio.lsp.mason"
require("ignacio.lsp.handlers").setup()
require("ignacio.lsp.java").setup()
require("ignacio.lsp.java").java_keymaps()
-- require "user.lsp.null-ls"
