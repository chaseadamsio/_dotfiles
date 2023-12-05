---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
  },
  v = {
    [">"] = { ">gv", "indent" },
  },
}

M.neogit = {
  n = {
    ["<leader>gj"] = { "<cmd> Neogit<CR>", "neogit" },
  },
}

M.projectMgr = {
  n = {
    ["<leader>fp"] = { "<cmd> ProjectMgr<CR>", "Open Projects" },
  },
}

M.copilot = {
  i = {
    ["<C-l>"] = {
      function()
        vim.fn.feedkeys(vim.fn["copilot#Accept"](), "")
      end,
      "Copilot Accept",
      { replace_keycoddes = true, nowait = true, silent = true, expr = true, noremap = true },
    },
  },
}

-- more keybinds!

return M
