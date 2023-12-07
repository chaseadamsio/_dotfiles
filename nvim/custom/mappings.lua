---@type MappingsTable
local M = {}

M.disabled = {
	n = {
		["<leader>b"] = "",
	},
}

M.general = {
	n = {
		[";"] = { ":", "enter command mode", opts = { nowait = true } },
		["<leader>bn"] = { "<cmd>bnext<CR>", "Next Buffer" },
		["<leader>bb"] = { "<cmd>bprevious<CR>", "Previous Buffer" },
		["<leader>bf"] = { "<cmd>new<CR>", "New Buffer" },
		["<leader>bca"] = { "<cmd>up | bd | e#<CR>", "Close All Buffers" },
	},
	v = {
		[">"] = { ">gv", "indent" },
	},
}

M.obsidian = {
	n = {
		["gf"] = {
			function()
				if require("obsidian").util.cursor_on_markdown_link() then
					require("obsidian").util.follow_link()
				else
					vim.cmd("normal! gf")
				end
			end,
		},
	},
}

M.telekastan = {
	n = {
		["<leader>zp"] = { "<cmd>Telekasten panel<CR>", "Notes" },
		["<leader>zg"] = { "<cmd>Telekasten search_notes<CR>", "Search Notes" },
		["<leader>zf"] = { "<cmd>Telekasten find_notes<CR>", "Find Notes" },
		["<leader>zd"] = { "<cmd>Telekasten goto_today<CR>", "Goto Today" },
		["<leader>zz"] = { "<cmd>Telekasten follow_link<CR>", "Follow Link" },
		["<leader>zn"] = { "<cmd>Telekasten new_note<CR>", "New Note" },
	},

	i = {
		["[["] = { "<cmd>Telekasten insert_link<CR>" },
	},
}

M.neogit = {
	n = {
		["<leader>gg"] = { "<cmd> Neogit<CR>", "neogit" },
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

M.telescope = {
	n = {
		["<leader>fs"] = {
			function()
				require("telescope.builtin").lsp_document_symbols()
			end,
			"Document Symbols",
			{ expr = true },
		},
		["<leader>fS"] = {
			function()
				require("telescope.builtin").lsp_workspace_symbols()
			end,
			"Workspace Symbols",
			{ expr = true },
		},
	},
}

return M
