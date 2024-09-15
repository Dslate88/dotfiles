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

wk.register({
    e = {
        name = "+explorers",
        p = {":Explore<cr>", "Explore"},
        r = {":Rexplore<cr>", "Rexplore"},
        l = {":Lexplore<cr>", "Lexplore"},
        a = {":Lexplore %:p:h<cr>", "Lexplore Directory"},
    },
    t = {":tabnew<cr>", "New Tab"},
    w = {
        name = "+windows",
        s = {":split<cr>", "Horizontal Split"},
        v = {":vsplit<cr>", "Vertical Split"},
        j = {":wincmd j<cr>", "Window Down"},
        k = {":wincmd k<cr>", "Window Up"},
        l = {":wincmd l<cr>", "Window Right"},
        h = {":wincmd h<cr>", "Window Left"},
        c = {":close<cr>", "Close Window"},
    },
}, { prefix = "<leader>"})

-----------------------------------------------------------
-- toggle term
-----------------------------------------------------------
local tt_mappings = {
    name = "+terminal", -- name to display in popup
    t = { "<cmd>ToggleTerm<cr>", "Toggle Term" },
    a = { "<cmd>ToggleTermToggleAll<cr>", "Toggle All Terms" },
    n = { "<cmd>ToggleTerm direction=float<cr>", "New Floating Term" },
    p = { "<cmd>ToggleTerm direction=horizontal<cr>", "New Horizontal Term" },
    v = { "<cmd>ToggleTerm direction=vertical<cr>", "New Vertical Term" },
}
map("t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true })

wk.register(tt_mappings, { prefix = "<leader>t" })
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
-- my custom scripts
-----------------------------------------------------------
map("n", "<leader>ht", ":lua require('user.prompt_gen').execute()<cr>")
map("n", "<leader>ac", ":lua require('user.ai_tools.scripts.chat').execute()<CR>")
map("n", "<leader>ah", ":lua require('user.ai_tools.scripts.harpoon_list').execute()<CR>")

-- map("n", "<leader>hs", ":lua require('user.ai_tools.scripts.harpoon_list').execute()<cr>")

-----------------------------------------------------------
-- telescope shortcuts
-----------------------------------------------------------

local mappings = {
    f = {
        name = "+Telescope",
        f = { "<cmd>Telescope find_files<cr>", "Find Files" },
        g = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
        b = { "<cmd>Telescope buffers<cr>", "Buffers" },
        h = { "<cmd>Telescope help_tags<cr>", "Help Tags" },
        k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
        m = { "<cmd>Telescope marks<cr>", "Marks" },
        o = { "<cmd>Telescope oldfiles<cr>", "Old Files" },
        r = { "<cmd>Telescope registers<cr>", "Registers" },
        s = { "<cmd>Telescope git_status<cr>", "Git Status" },
        c = { "<cmd>Telescope commands<cr>", "Commands" },
        p = { "<cmd>Telescope projects<cr>", "Projects" },
        q = { "<cmd>Telescope quickfixhistory<cr>", "Quickfix History" }
    }
}

wk.register(mappings, { prefix = "<leader>" })
