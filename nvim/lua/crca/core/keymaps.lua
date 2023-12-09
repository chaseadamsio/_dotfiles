local wk = require("which-key")
wk.register({
  b = {
    -- buffer
    name = "[b]uffer",
    x = { "<cmd>bd<CR>", "close" },
    p = { "<cmd>bp<CR>", "previous" },
    n = { "<cmd>bn<CR>", "next" },
  },
  e = {
    name = "[e]rror",
    s = { "<cmd>TroubleToggle document_diagnostics<cr>", "show errors" },
  },
  f = {
    -- find
    name = "[f]ind",
    f = { "<cmd>Telescope find_files<CR>", "find file" },
    a = { "<cmd>Telescope find_files follow=true no_ignore=true hidden=true <CR>", "find all" },
    w = { "<cmd>Telescope live_grep<CR>", "live grep" },
    p = { "<cmd>ProjectMgr<CR>", "find project" },
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
}, { prefix = "<leader>" })

wk.register({
  ["<C-n>"] = { "<cmd>NvimTreeToggle<CR>", "Toggle Nvim Tree" },
  ["<C-l>"] = {
    function()
      vim.fn.feedkeys(vim.fn["copilot#Accept"](), "")
    end,
    "copilot accept",
  },
}, { mode = "i" })

wk.register({
  ["<leader>/"] = {
    function()
      require("Comment.api").toggle.linewise.current()
    end,
    "toggle comment",
  },
  ["<C-n>"] = { "<cmd>NvimTreeToggle<CR>", "Toggle Nvim Tree" },
}, { mode = "n" })

wk.register({
  ["<leader>/"] = {
    "<ESC><cmd> lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
    "toggle comment",
  },
}, { mode = "v" })
