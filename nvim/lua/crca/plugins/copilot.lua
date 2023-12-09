return {
  "github/copilot.vim",
  lazy = false,
  config = function()
    -- Mapping tab is already used by NvChad https://azamuddin.com/en/blog/050623-setting-up-copilot-on-nvchad
    vim.g.copilot_no_tab_map = true
    vim.g.copilot_assume_mapped = true
    vim.g.copilot_tab_fallback = ""
    -- The mapping is set to other key, see custom/lua/mappings
    -- or run <leader>ch to see copilot mapping section
  end,
}
