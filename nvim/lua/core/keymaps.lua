local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end


-- Change leader to a space
vim.g.mapleader = ' '

-----------------------------------------------------------
-- Neovim shortcuts
-----------------------------------------------------------

-- Disable arrow keys
map("", "<up>", "<nop>")
map('', '<down>', '<nop>')
map('', '<left>', '<nop>')
map('', '<right>', '<nop>')

-- Telescope
map("n", "<leader>ff", ":Telescope find_files<cr>")
map("n", "<leader>fg", ":Telescope live_grep<cr>")

--harpoon
map("n", "<leader>hu", ":lua require('harpoon.ui').toggle_quick_menu()<cr>")
map("n", "<leader>ha", ":lua require('harpoon.mark').add_file()<cr>")
--add leader ctrl [1/2/3/4/5] for quick access to needed files
--OR instead of that use the nav_next & nav_prev
--the send to terminal command will be great for rapid testing of code `gottoTerminal`
