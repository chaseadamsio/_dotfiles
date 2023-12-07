local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

	-- Override plugin definition options

	{
		"neovim/nvim-lspconfig",
		dependencies = {
			-- format & linting
			{
				"jose-elias-alvarez/null-ls.nvim",
				config = function()
					require("custom.configs.null-ls")
				end,
			},
		},
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end, -- Override to setup mason-lspconfig
	},

	-- override plugin configs
	{
		"williamboman/mason.nvim",
		opts = overrides.mason,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = overrides.treesitter,
	},

	{
		"nvim-tree/nvim-tree.lua",
		opts = overrides.nvimtree,
	},

	-- Install a plugin
	{
		"max397574/better-escape.nvim",
		event = "InsertEnter",
		config = function()
			require("better_escape").setup()
		end,
	},

	{
		"charludo/projectmgr.nvim",
		lazy = false,
	},

	{
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
	},

	{
		"epwalsh/obsidian.nvim",
		lazy = false,
		ft = "markdown",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		opts = {
			workspaces = {
				{
					name = "vault",
					path = "~/Users/chase/vault",
				},
			},
		},

		daily_notes = {
			template = "00 - Meta/01 - Templates/Template - Daily.md",
		},
	},

	{
		"NeogitOrg/neogit",
		lazy = false,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",
			"nvim-telescope/telescope.nvim",
			"sindrets/diffview.nvim",
			"ibhagwan/fzf-lua",
		},
		config = function()
			local neogit = require("neogit")
			neogit.setup({})
		end,
	},

	{
		"ruifm/gitlinker.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("gitlinker").setup()
		end,
	},

	{
		"APZelos/blamer.nvim",
		lazy = false,
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},

	{
		"renerocksai/telekasten.nvim",
		lazy = false,
		dependencies = {
			"nvim-lua/telescope.nvim",
		},
		config = function()
			local home = vim.fn.expand("~/vault")
			local template_dir = home .. "/" .. "00 - Meta/01 - Templates"
			require("telekasten").setup({
				home = home,
				dailies = home .. "/" .. "10 - Periodic",
				templates = template_dir,
				template_new_daily = template_dir .. "/" .. "Template - Daily.md",
				image_subdir = "00 - Meta/02 - Media",
				subdirs_in_links = false,
			})
		end,
	},
}

return plugins
