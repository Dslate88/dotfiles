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

-- Disable arrow keys
map("", "<up>", "<nop>")
map('', '<down>', '<nop>')
map('', '<left>', '<nop>')
map('', '<right>', '<nop>')

-- Yank full path of active file
map("n", "<leader>yp", ":let @\" = expand('%:p')<cr>")

-----------------------------------------------------------
-- Neovim shortcuts
-----------------------------------------------------------


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

