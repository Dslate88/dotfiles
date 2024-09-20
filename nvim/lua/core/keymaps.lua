local wk = require("which-key")

-- ===========================================================
-- General Mappings
-- ===========================================================
wk.add({
    { "<leader>yp", ":let @\" = expand('%:p')<cr>", desc = "Yank Full Path of Active Buffer" },
    { "<leader>*r", ":%s/\\<<c-r><c-w>\\>//g<left><left>", desc = "Find and Replace Word Under Cursor" },
    { "<leader>ww", ":w<cr>", desc = "Save File" },
    { "<leader>Q", ":q!<cr>", desc = "Force Quit" },
    { "<leader>qq", ":wq<cr>", desc = "Save and Quit" },
    { "<leader>so", ":so %<cr>", desc = "Source Current File" },
    { "<leader>cd", ":lcd %:p:h<CR>:pwd<CR>", desc = "Set Working Directory to Active Buffer" },
    { "<leader><S-j>", "<C-f>", desc = "Scroll Down" },
    { "<leader><S-k>", "<C-b>", desc = "Scroll Up" },
}, { mode = "n" })

-- ===========================================================
-- Move Lines Efficiently in Normal Mode
-- ===========================================================
wk.add({
    { "<leader>j", ":m+<cr>==", desc = "Move Line Down" },
    { "<leader>k", ":m-2<cr>==", desc = "Move Line Up" },
}, { mode = "n" })

-- ===========================================================
-- Move Lines Efficiently in Visual Mode
-- ===========================================================
wk.add({
    { "<leader>j", ":m'>+<cr>gv=gv", desc = "Move Line Down (Visual)", mode = "v" },
    { "<leader>k", ":m-2<cr>gv=gv", desc = "Move Line Up (Visual)", mode = "v" },
}, { mode = "v" })

-- ===========================================================
-- Buffers Management
-- ===========================================================
wk.add({
    -- Group Definition
    { "<leader>b", group = "buffers" },

    -- Buffer Commands
    { "<leader>bB", ":enew<cr>", desc = "New Buffer" },
    { "<leader>bq", ":bp <bar> bd! #<cr>", desc = "Close Active Buffer" },
    { "<leader>ba", ":bufdo bd!<cr>", desc = "Close All Buffers" },
    { "<leader>b<Tab>", ":bnext<cr>", desc = "Next Buffer" },
    { "<leader>b<S-Tab>", ":bprevious<cr>", desc = "Previous Buffer" },
    { "<leader>b<leader>", "<c-^>", desc = "Cycle Last 2 Buffers" },
}, { prefix = "<leader>" })

-- ===========================================================
-- Explorers and Windows Management
-- ===========================================================
wk.add({
    -- Explorers Group
    { "<leader>e", group = "explorers" },
    { "<leader>ep", ":Explore<cr>", desc = "Explore" },
    { "<leader>er", ":Rexplore<cr>", desc = "Re-explore" },
    { "<leader>el", ":Lexplore<cr>", desc = "Left-Explore" },
    { "<leader>ea", ":Lexplore %:p:h<cr>", desc = "Lexplore Directory" },

    -- Windows Group
    { "<leader>w", group = "windows" },
    { "<leader>ws", ":split<cr>", desc = "Horizontal Split" },
    { "<leader>wv", ":vsplit<cr>", desc = "Vertical Split" },
    { "<leader>wj", ":wincmd j<cr>", desc = "Window Down" },
    { "<leader>wk", ":wincmd k<cr>", desc = "Window Up" },
    { "<leader>wl", ":wincmd l<cr>", desc = "Window Right" },
    { "<leader>wh", ":wincmd h<cr>", desc = "Window Left" },
    { "<leader>wc", ":close<cr>", desc = "Close Window" },
}, { prefix = "<leader>" })

-- ===========================================================
-- Toggle Terminal
-- ===========================================================
wk.add({
    -- Group Definition
    { "<leader>t", group = "terminal" },

    -- Terminal Commands
    { "<leader>tt", "<cmd>ToggleTerm<cr>", desc = "Toggle Terminal" },
    { "<leader>ta", "<cmd>ToggleTermToggleAll<cr>", desc = "Toggle All Terminals" },
    { "<leader>tn", "<cmd>ToggleTerm direction=float<cr>", desc = "New Floating Terminal" },
    { "<leader>tp", "<cmd>ToggleTerm direction=horizontal<cr>", desc = "New Horizontal Terminal" },
    { "<leader>tv", "<cmd>ToggleTerm direction=vertical<cr>", desc = "New Vertical Terminal" },
}, { prefix = "<leader>" })

-- ===========================================================
-- Tabs Management
-- ===========================================================
wk.add({
    -- Group Definition
    { "<leader>T", group = "tabs" },

    -- Tab Commands
    { "<leader>Tn", ":tabnew<cr>", desc = "New Tab" },
}, { prefix = "<leader>" })

-- ===========================================================
-- Netrw
-- ===========================================================
wk.add({
    { "<leader><buffer><tab>", "mf", desc = "Mark File in Netrw", mode = "n" },
}, { prefix = "<leader>" })

-- ===========================================================
-- Vimwiki / Markdown
-- ===========================================================
wk.add({
    -- Group Definition
    { "<leader>,w", group = "vimwiki" },

    -- Vimwiki Commands
    { "<leader>,wf", ":set filetype=markdown<cr>", desc = "Set Filetype to Markdown" },
    { "<leader>,wp", ":MarkdownPreviewToggle<cr>", desc = "Toggle Markdown Preview" },
    { "<leader>,x", "<Plug>VimwikiIndex", desc = "Vimwiki Index" },
    { "<leader>,t", "<Plug>VimwikiTabIndex", desc = "Vimwiki Tab Index" },
    { "<leader>,s", "<Plug>VimwikiUISelect", desc = "Vimwiki UI Select" },
    { "<leader>,i", "<Plug>VimwikiDiaryIndex", desc = "Vimwiki Diary Index" },
    { "<leader>,wx", "<Plug>VimwikiMakeDiaryNote", desc = "Make Diary Note" },
    { "<leader>,wt", "<Plug>VimwikiTabMakeDiaryNote", desc = "Make Diary Note in Tab" },
    { "<leader>,wy", "<Plug>VimwikiMakeYesterdayDiaryNote", desc = "Make Yesterday Diary Note" },
    { "<leader>,wm", "<Plug>VimwikiMakeTomorrowDiaryNote", desc = "Make Tomorrow Diary Note" },
    { "<leader>,wh", "<Plug>Vimwiki2HTML", desc = "Convert to HTML" },
}, { prefix = "<leader>" })

-- ===========================================================
-- Neogit
-- ===========================================================
wk.add({
    { "<leader>ng", ":Neogit<cr>", desc = "Open Neogit" },
}, { prefix = "<leader>" })

-- ===========================================================
-- Neoformat
-- ===========================================================
wk.add({
    { "<leader>nf", ":Neoformat<cr>", desc = "Format Code" },
}, { prefix = "<leader>" })

-- ===========================================================
-- LSP Config Shortcuts
-- ===========================================================
wk.add({
    { "<leader>K", ":lua vim.lsp.buf.hover()<cr>", desc = "Hover Documentation" },
    { "<leader>d", ":lua vim.diagnostic.open_float()<cr>", desc = "Open Diagnostics" },
}, { prefix = "<leader>" })

-- ===========================================================
-- Harpoon Shortcuts
-- ===========================================================
wk.add({
    -- Group Definition
    { "<leader>h", group = "harpoon" },

    -- Harpoon Commands
    { "<leader>hu", ":lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "Toggle Harpoon Menu" },
    { "<leader>ha", ":lua require('harpoon.mark').add_file()<cr>", desc = "Add File to Harpoon" },
    { "<leader>hn", ":lua require('harpoon.ui').nav_next()<cr>", desc = "Next Harpoon File" },
    { "<leader>hp", ":lua require('harpoon.ui').nav_prev()<cr>", desc = "Previous Harpoon File" },
}, { prefix = "<leader>" })

-- ===========================================================
-- Custom Scripts
-- ===========================================================
wk.add({
    -- Group Definition
    { "<leader>a", group = "ai_tools" },

    -- AI Tools Commands
    { "<leader>ac", ":lua require('user.ai_tools.scripts.chat').execute()<CR>", desc = "AI Chat" },
    { "<leader>ah", ":lua require('user.ai_tools.scripts.harpoon_list').execute()<CR>", desc = "Harpoon File List" },
    { "<leader>ht", ":lua require('user.prompt_gen').execute()<cr>", desc = "Custom Prompt Generation" },
}, { prefix = "<leader>" })

-- ===========================================================
-- Telescope Shortcuts
-- ===========================================================
wk.add({
    -- Group Definition
    { "<leader>f", group = "Telescope" },

    -- Telescope Commands
    { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
    { "<leader>fc", "<cmd>Telescope commands<cr>", desc = "Commands" },
    { "<leader>fd", "<cmd>Telescope lsp_definitions<cr>", desc = "LSP Definitions" },
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
    { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help Tags" },
    { "<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
    { "<leader>fm", "<cmd>Telescope marks<cr>", desc = "Marks" },
    { "<leader>fo", "<cmd>Telescope oldfiles<cr>", desc = "Old Files" },
    { "<leader>fp", "<cmd>Telescope lsp_type_definitions<cr>", desc = "LSP Type Definitions" },
    { "<leader>fq", "<cmd>Telescope quickfix<cr>", desc = "Quickfix" },
    { "<leader>fqh", "<cmd>Telescope quickfixhistory<cr>", desc = "Quickfix History" },
    { "<leader>fr", "<cmd>Telescope lsp_references<cr>", desc = "LSP References" },
    { "<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document Symbols" },
    { "<leader>ft", "<cmd>lua require('telescope.builtin').treesitter()<cr>", desc = "Treesitter" },
}, { prefix = "<leader>" })

