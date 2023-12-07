-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true

vim.cmd("filetype plugin on")

-- enable blamer
vim.g.blamer_enabled = true
vim.g.blamer_delay = 500
