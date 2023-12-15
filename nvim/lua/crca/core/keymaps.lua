local wk = require("which-key")
wk.register({
  b = {
    -- buffer
    name = "[b]uffer",
    x = {
      name = "close",
      a = { "<cmd>BufferCloseAllButCurrent<CR>", "close all but current" },
      x = { "<cmd>BufferClose<CR>", "close" },
    },
    p = { "<cmd>bp<CR>", "previous" },
    n = { "<cmd>bn<CR>", "next" },
  },
  e = {
    name = "[e]rror",
    s = { "<cmd>TroubleToggle document_diagnostics<cr>", "show errors" },
    n = {
      function()
        require("trouble").next({ skip_groups = true, jump = true })
      end,
      "next error",
    },
    p = {
      function()
        require("trouble").previous({ skip_groups = true, jump = true })
      end,
      "previous error",
    },
  },
  f = {
    -- find
    name = "[f]ind",
    f = { "<cmd>Telescope find_files<CR>", "find file" },
    a = { "<cmd>Telescope find_files follow=true no_ignore=true hidden=true <CR>", "find all" },
    g = { "<cmd>Telescope live_grep<CR>", "live grep" },
    w = { "<cmd>ProjectMgr<CR>", "find workspace" },
    b = { "<cmd>Telescope buffers<CR>", "find buffers" },
    s = { "<cmd>Telescope lsp_document_symbols<CR>", "find symbols" },
    S = { "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>", "find workspace symbols" },
  },
  g = {
    -- git
    name = "[g]it",
    s = { "<cmd>Neogit<CR>", "Neogit" },
    y = {
      "<cmd>lua require'gitlinker'.get_buf_range_url('n')<cr>",
      "Git Link",
    },
  },
  h = {
    name = "[h]elp",
  },
  l = {
    name = "[l]sp",
    r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "rename", { expr = true } },
    a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "code action" },
    g = {
      name = "[g]oto",
      d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "definition" },
      D = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "declaration" },
      i = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "implementation" },
      t = { "<cmd>lua vim.lsp.buf.type_definition()<CR>", "type definition" },
    },
  },
  t = {
    name = "[t]ab",
    o = { "<cmd>tabnew<CR>", "new" },
    p = { "<cmd>tabprevious<CR>", "previous" },
    n = { "<cmd>tabnext<CR>", "next" },
    x = { "<cmd>tabclose<CR>", "close" },
    f = { "<cmd>tabnew %<CR>", "new tab" },
  },
  w = {
    -- window
    name = "[w]indow",
    v = { "<cmd>vsplit<CR>", "vertical split" },
    s = { "<cmd>split<CR>", "horizontal split" },
  },
  n = {
    -- nvim tree
    name = "[n]vim tree",
    t = { "<cmd>NvimTreeToggle<CR>", "toggle" },
    r = { "<cmd>NvimTreeRefresh<CR>", "refresh" },
    f = { "<cmd>NvimTreeFindFile<CR>", "find file" },
  },
}, { prefix = "<leader>" })

wk.register({
  ["<C-l>"] = {
    function()
      vim.fn.feedkeys(vim.fn["copilot#Accept"](), "")
    end,
    "copilot accept",
  },
}, { mode = "i" })

wk.register({
  ["<C-n>"] = { "<cmd>NvimTreeFocus<CR>", "Focus Nvim Tree" },
  ["<C-b>"] = { "<cmd>NvimTreeToggle<CR>", "Toggle Nvim Tree" },
}, { mode = "i" })

wk.register({
  ["<C-n>"] = { "<cmd>NvimTreeFocus<CR>", "Focus Nvim Tree" },
  ["<C-b>"] = { "<cmd>NvimTreeToggle<CR>", "Toggle Nvim Tree" },
}, { mode = "n" })

wk.register({
  ["<leader>/"] = {
    function()
      require("Comment.api").toggle.linewise.current()
    end,
    "toggle comment",
  },
}, { mode = "n" })

wk.register({
  ["<leader>/"] = {
    "<ESC><cmd> lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
    "toggle comment",
  },
}, { mode = "v" })
