local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- local fns = require('core.functions')
-- local command = vim.api.nvim_create_user_command
-- command('GetSS', fns.get_screenshot, {desc = 'Get selected text'})

-----------------------------------------------------------
-- general
-----------------------------------------------------------

-- disable arrow keys
map("", "<up>", "<nop>")
map('', '<down>', '<nop>')
map('', '<left>', '<nop>')
map('', '<right>', '<nop>')

map("n", "<leader>ys", ":let @\"=system('source functions.sh; getss ' . @a)<cr>")
map("n", "<leader>yp", ":let @\" = expand('%:p')<cr>") -- Yank full path of active buffer
map("n", "<leader>*r", ":%s/\\<<c-r><c-w>\\>//g<left><left>") -- cursor find/replace all
map("n", "<leader>ww", ":w<cr>")
map("n", "<leader>Q", ":q!<cr>")
map("n", "<leader>qq", ":wq<cr>")
map("n", "<leader>so", ":so %<cr>")
map('n', '<Leader>cd', ':lcd %:p:h<CR>:pwd<CR>')

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

-- explorers/windows/tabs
map("n", "<leader>er", ":Rexplore<cr>")
map("n", "<leader>el", ":Lexplore<cr>")
map("n", "<leader>ev", ":Vexplore<cr>")
map("n", "<leader>tn", ":tabnew<cr>")
map("n", "<leader>ws", "<C-W><C-S>", { noremap = false, silent = true })
map("n", "<leader>wv", "<C-W><C-V>", { noremap = false, silent = true })
map("n", "<leader>wj", "<C-W><C-J>", { noremap = false, silent = true })
map("n", "<leader>wk", "<C-W><C-K>", { noremap = false, silent = true })
map("n", "<leader>wl", "<C-W><C-L>", { noremap = false, silent = true })
map("n", "<leader>wh", "<C-W><C-H>", { noremap = false, silent = true })
map("n", "<leader>wc", ":close<cr>", { noremap = false, silent = true })

-----------------------------------------------------------
-- vimwiki / markdown
-----------------------------------------------------------
map("n", "<leader>,wf", ":set filetype=markdown<cr>")
map("n", "<leader>,wp", ":MarkdownPreviewToggle<cr>")
map("n", "<Leader>,x", "<Plug>VimwikiIndex", { noremap = false, silent = true })
map("n", "<Leader>,t", "<Plug>VimwikiTabIndex", { noremap = false, silent = true })
map("n", "<Leader>,s", "<Plug>VimwikiUISelect", { noremap = false, silent = true })
map("n", "<Leader>,i", "<Plug>VimwikiDiaryIndex", { noremap = false, silent = true })
map("n", "<Leader>,wx", "<Plug>VimwikiMakeDiaryNote", { noremap = false, silent = true })
map("n", "<Leader>,wt", "<Plug>VimwikiTabMakeDiaryNote", { noremap = false, silent = true })
map("n", "<Leader>,wy", "<Plug>VimwikiMakeYesterdayDiaryNote", { noremap = false, silent = true })
map("n", "<Leader>,wm", "<Plug>VimwikiMakeTomorrowDiaryNote", { noremap = false, silent = true })

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

