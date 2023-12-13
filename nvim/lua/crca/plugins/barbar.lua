return {
  "romgrk/barbar.nvim",
  dependencies = {
    "lewis6991/gitsigns.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  init = function()
    vim.g.barbar_auto_setup = false
  end,
  config = function()
    require("barbar").setup()

    vim.api.nvim_set_keymap("n", "<leader>b,", "<cmd>BufferPrevious<CR>", { noremap = true })
    vim.api.nvim_set_keymap("n", "<leader>b.", "<cmd>BufferNext<CR>", { noremap = true })
    vim.api.nvim_set_keymap("n", "<leader>b1", "<cmd>BufferGoto 1<CR>", { noremap = true })
    vim.api.nvim_set_keymap("n", "<leader>b2", "<cmd>BufferGoto 2<CR>", { noremap = true })
    vim.api.nvim_set_keymap("n", "<leader>b3", "<cmd>BufferGoto 3<CR>", { noremap = true })
    vim.api.nvim_set_keymap("n", "<leader>b4", "<cmd>BufferGoto 4<CR>", { noremap = true })
    vim.api.nvim_set_keymap("n", "<leader>b5", "<cmd>BufferGoto 5<CR>", { noremap = true })
    vim.api.nvim_set_keymap("n", "<leader>b6", "<cmd>BufferGoto 6<CR>", { noremap = true })
    vim.api.nvim_set_keymap("n", "<leader>b7", "<cmd>BufferGoto 7<CR>", { noremap = true })
    vim.api.nvim_set_keymap("n", "<leader>b8", "<cmd>BufferGoto 8<CR>", { noremap = true })
    vim.api.nvim_set_keymap("n", "<leader>b9", "<cmd>BufferGoto 9<CR>", { noremap = true })
    vim.api.nvim_set_keymap("n", "<leader>b0", "<cmd>BufferLast<CR>", { noremap = true })
  end,
}
