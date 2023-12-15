return {
  "nvim-tree/nvim-tree.lua",
  cmd = { "NvimTreeToggle", "NvimTreeFocus" },
  config = function()
    require("nvim-tree").setup({
      sync_root_with_cwd = true,
    })
  end,
}
