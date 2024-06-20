require "nvchad.autocmds"
local autocmd = vim.api.nvim_create_autocmd
-- Restore Cursor Position
autocmd("BufReadPost", {
  command = [[if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]]
})


