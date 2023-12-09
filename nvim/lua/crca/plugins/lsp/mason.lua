return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    require("mason").setup {
      config = function()
        require "formatter.config"
      end,
    }
    require("mason-lspconfig").setup()

    local servers = {
      lua_ls = {
        Lua = {
          workspace = { checkThirdParty = false },
          telemetry = { enable = false },
          diagnostics = {
            -- This suppressing the warning where 'vim' is a undefined global
            globals = { "vim" },
          },
        },
      },
      tsserver = {
        typescript = {
          format = { enable = false },
          telemetry = { enable = false },
        },
        javascript = {
          format = { enable = false },
          telemetry = { enable = false },
        },
      },
      rust_analyzer = {
        rust = {
          all_features = true,
          cargo = {
            loadOutDirsFromCheck = true,
          },
          procMacro = {
            enable = true,
          },
        },
      },
    }

    local mason_lspconfig = require "mason-lspconfig"

    mason_lspconfig.setup {
      ensure_installed = vim.tbl_keys(servers),
    }

    -- [[ Configure LSP ]]
    local on_attach = function() end

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

    mason_lspconfig.setup_handlers {
      function(server_name)
        require("lspconfig")[server_name].setup {
          capabilities = capabilities,
          on_attach = on_attach,
          settings = servers[server_name],
          filetypes = (servers[server_name] or {}).filtypes,
        }
      end,
    }
  end,
}
