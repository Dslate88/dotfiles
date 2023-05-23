local wk = require("which-key")

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end


-----------------------------------------------------------
-- general
-----------------------------------------------------------

-- disable arrow keys
map("", "<up>", "<nop>")
map('', '<down>', '<nop>')
map('', '<left>', '<nop>')
map('', '<right>', '<nop>')

map("n", "<leader>yp", ":let @\" = expand('%:p')<cr>") -- Yank full path of active buffer
map("n", "<leader>*r", ":%s/\\<<c-r><c-w>\\>//g<left><left>") -- cursor find/replace all
map("n", "<leader>ww", ":w<cr>")
map("n", "<leader>Q", ":q!<cr>")
map("n", "<leader>qq", ":wq<cr>")
map("n", "<leader>so", ":so %<cr>")
map('n', '<Leader>cd', ':lcd %:p:h<CR>:pwd<CR>') -- set wd to active buffer
map("n", "<S-j>", "<C-f>") -- scroll down
map("n", "<S-k>", "<C-b>") -- scroll up

-----------------------------------------------------------
-- move lines efficiently
-----------------------------------------------------------
map("n", "<leader>k", ":m-2<cr>==")
map("n", "<leader>j", ":m+<cr>==")
map("v", "<leader>k", ":m-2<cr>gv=gv")
map("v", "<leader>j", ":m'>+<cr>gv=gv")

-----------------------------------------------------------
-- buffers
-----------------------------------------------------------
map("n", "<leader>B", ":enew<cr>")
map("n", "<leader>bq", ":bp <bar> bd! #<cr>")
map("n", "<leader>ba", ":bufdo bd!<cr>")

map("n", "<leader><Tab>", ":bnext<cr>")
map("n", "<leader><S-Tab>", ":bprevious<cr>")
map("n", "<leader><leader>", "<c-^>")

wk.register({
    b = {
        name = "+buffers",
        B = { ":enew<cr>", "New buffer" },
        q = { ":bp <bar> bd! #<cr>", "Close active buffer" },
        a = { ":bufdo bd!<cr>", "Close all buffers" },
        ["<Tab>"] = { ":bnext<cr>", "Next buffer" },
        ["<S-Tab>"] = { ":bprevious<cr>", "Previous buffer" },
        ["<leader>"] = { "<c-^>", "Cycle last 2 buffers" },
    },
}, { prefix = "<leader>" })

-----------------------------------------------------------
-- explorers/windows/tabs
-----------------------------------------------------------
map("n", "<leader>ep", ":Explore<cr>")
map("n", "<leader>er", ":Rexplore<cr>")
map("n", "<leader>el", ":Lexplore<cr>")
map("n", "<leader>ea", ":Lexplore %:p:h<cr>")
map("n", "<leader>tn", ":tabnew<cr>")
map("n", "<leader>ws", "<C-W><C-S>", { noremap = false, silent = true })
map("n", "<leader>wv", "<C-W><C-V>", { noremap = false, silent = true })
map("n", "<leader>wj", "<C-W><C-J>", { noremap = false, silent = true })
map("n", "<leader>wk", "<C-W><C-K>", { noremap = false, silent = true })
map("n", "<leader>wl", "<C-W><C-L>", { noremap = false, silent = true })
map("n", "<leader>wh", "<C-W><C-H>", { noremap = false, silent = true })
map("n", "<leader>wc", ":close<cr>", { noremap = false, silent = true })

-----------------------------------------------------------
-- toggle term
-----------------------------------------------------------
map("t", "<Esc>", "<C-\\><C-n>") -- enable escape key in terminal mode
map("n", "<leader>tt", ":ToggleTerm<cr>")
map("n", "<leader>ta", ":ToggleTermToggleAll<cr>")
map("n", "<leader>tw", ":TermExec direction=vertical size=90 cmd=\"clear && task ls\"<cr>")
map("n", "<leader>tg", ":2TermExec direction=vertical size=90 cmd=\"source ~/.bash_profile\"<cr>")
map("n", "<leader>tl", ":3TermExec direction=horizontal size=10 cmd=\"source ~/.bash_profile\"<cr>")
map("v", "<leader>ts", ":ToggleTermSendVisualLines<cr>")


-----------------------------------------------------------
-- netrw
-----------------------------------------------------------
map("n", "<buffer><tab>","mf", { noremap = true, silent = true })


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
map("n", "<Leader>,wh", "<Plug>Vimwiki2HTML", { noremap = false, silent = true })

-----------------------------------------------------------
-- neogit
-----------------------------------------------------------
map("n", "<leader>ng", ":Neogit<cr>")

-----------------------------------------------------------
-- neoformat
-----------------------------------------------------------
map("n", "<leader>nf", ":Neoformat<cr>")

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

-----------------------------------------------------------
-- copilot
-- note: control + j is mapped in copilot.lua to accept the suggestion
-----------------------------------------------------------
map("n", "<leader>cp", ":Copilot panel<cr>")
map("n", "<leader>ce", ":Copilot enable<cr>")
map("n", "<leader>cd", ":Copilot disable<cr>")

