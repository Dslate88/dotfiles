-----------------------------------------------------------
-- general
-----------------------------------------------------------
-- keymap fn
local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- templates
-- map("", "<leader>listen", "action")


-- disable arrow keys
map("", "<up>", "<nop>")
map('', '<down>', '<nop>')
map('', '<left>', '<nop>')
map('', '<right>', '<nop>')

map("n", "<leader>yp", ":let @\" = expand('%:p')<cr>") -- Yank full path of active buffer
map("n", "<leader>*r", ":%s/\\<<c-r><c-w>\\>//g<left><left>") -- cursor find/replace all
map("n", "<leader>wr", ":w<cr>")
map("n", "<leader>q", ":q!<cr>")
map("n", "<leader>so", ":so %<cr>")

-- move lines efficiently
map("n", "<leader>k", ":m-2<cr>==")
map("n", "<leader>j", ":m+<cr>==")
map("v", "<leader>k", ":m-2<cr>gv=gv")
map("v", "<leader>j", ":m'>+<cr>gv=gv")

-- buffers
map("n", "<leader>B", ":enew<cr>") -- new
map("n", "<leader>bq", ":bp <bar> bd! #<cr>") -- close active
map("n", "<leader>ba", ":bufdo bd!<cr>") -- close all

map("n", "<leader><Tab>", ":bnext<cr>") -- next
map("n", "<leader><S-Tab>", ":bprevious<cr>") -- prev
map("n", "<leader><leader>", "<c-^>") -- cycle last 2

-- explorers
map("n", "<leader>er", ":Rexplore<cr>") -- netrw
map("n", "<leader>el", ":Lexplore<cr>") -- netrw
map("n", "<leader>ev", ":Vexplore<cr>") -- netrw

-- autoclose tags (NOT WORKING, NEED
-- https://github.com/nanotee/nvim-lua-guide pattern for inoremap found here
-- map("n", "[", "[]<Left>", { inoremap = true, silent = true }) --

-----------------------------------------------------------
-- vimwiki / markdown
-----------------------------------------------------------
map("n", "<leader>wf", ":set filetype=markdown<cr>") -- hacky but needed for now
map("n", "<leader>wp", ":MarkdownPreviewToggle<cr>") -- hacky but needed for now

-----------------------------------------------------------
-- neogit
-----------------------------------------------------------
map("n", "<leader>ng", ":Neogit<cr>")

-----------------------------------------------------------
-- lspconfig shortcuts
-----------------------------------------------------------
map("n", "<leader>e", ":lua vim.diagnostic.open_float()<cr>")
map("n", "<leader>K", ":lua vim.lsp.buf.hover()<cr>")

-----------------------------------------------------------
-- harpoon shortcuts
-----------------------------------------------------------
map("n", "<leader>hu", ":lua require('harpoon.ui').toggle_quick_menu()<cr>")
map("n", "<leader>ha", ":lua require('harpoon.mark').add_file()<cr>")

map("n", "<leader>hn", ":lua require('harpoon.ui').nav_next()<cr>")
map("n", "<leader>hp", ":lua require('harpoon.ui').nav_prev()<cr>")

-----------------------------------------------------------
-- telescope shortcuts
-----------------------------------------------------------
map("n", "<leader>ff", ":Telescope find_files<cr>")
map("n", "<leader>fg", ":Telescope live_grep<cr>")
map("n", "<leader>fb", ":Telescope buffers<cr>")
map("n", "<leader>fh", ":Telescope help_tags<cr>")
map("n", "<leader>fk", ":Telescope keymaps<cr>")
map("n", "<leader>ft", ":Telescope treesitter<cr>")

-----------------------------------------------------------
--tagbar shortcuts
-----------------------------------------------------------
map("n", "<leader>tb", ":TagbarToggle<cr>")

