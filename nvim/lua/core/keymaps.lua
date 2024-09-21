local wk = require("which-key")

-- Swap to the most recent buffer
wk.add({
	{ "<leader><leader>", "<C-^>", desc = "Swap to Previous Buffer" },
}, { prefix = "<leader>" })

-- ===========================================================
-- General Mappings
-- ===========================================================
-- just remove these..use standard keys...
wk.add({
	{ "<leader>g", group = "general" }, -- Group definition

	{ "<leader>gww", ":w<cr>", desc = "Save File" },
	{ "<leader>gqq", ":wq<cr>", desc = "Save and Quit" },
	{ "<leader>gQ", ":q!<cr>", desc = "Force Quit" },
	{ "<leader>gso", ":so %<cr>", desc = "Source Current File" },
	{ "<leader>gcd", ":lcd %:p:h<CR>:pwd<CR>", desc = "Set Working Directory" },
	{ "<leader>g*r", ":%s/\\<<c-r><c-w>\\>//g<left><left>", desc = "Find and Replace Word" },
	{ "<leader>gyp", ":let @\" = expand('%:p')<cr>", desc = "Yank Buffer Path" },
	{ "<leader>g<S-j>", "<C-f>", desc = "Scroll Down" },
	{ "<leader>g<S-k>", "<C-b>", desc = "Scroll Up" },
}, { mode = "n" })

-- ===========================================================
-- Move Lines Efficiently in Normal Mode
-- ===========================================================
wk.add({
	{ "<leader>j", ":m+<cr>==", desc = "Move Line Down" },
	{ "<leader>k", ":m-2<cr>==", desc = "Move Line Up" },
}, { mode = "n" })

-- ===========================================================
-- Buffers Management
-- ===========================================================
wk.add({
	-- Group Definition
	{ "<leader>b", group = "buffers" },

	-- Buffer Commands
	{ "<leader>bn", ":enew<cr>", desc = "New Buffer" },
	{ "<leader>bd", ":bd<cr>", desc = "Delete Buffer" },
	{ "<leader>bs", ":w<cr>", desc = "Save Buffer" },
	{ "<leader>bl", ":ls<cr>", desc = "List Buffers" },
	{ "<leader>bp", ":bprevious<cr>", desc = "Previous Buffer" },
	{ "<leader>bn", ":bnext<cr>", desc = "Next Buffer" },
	{ "<leader>bb", ":b#<cr>", desc = "Alternate Buffer" },
	{ "<leader>ba", ":bufdo bd<cr>", desc = "Delete All Buffers" },
}, { prefix = "<leader>" })

-- ===========================================================
-- Explorers
-- ===========================================================
wk.add({
	{ "<leader>e", group = "explorers" },
	{ "<leader>ee", ":Lexplore<cr>", desc = "Open Explorer" },
	{ "<leader>er", ":Rexplore<cr>", desc = "Refresh Explorer" },
	{ "<leader>ed", ":Sex!<cr>", desc = "Open Explorer in Split" },
	{ "<leader>ev", ":Vexplore<cr>", desc = "Open Explorer Vertically" },
	{ "<leader>et", ":Texplore<cr>", desc = "Open Explorer in Tab" },
	{ "<leader>eu", ":Ex <C-r>=escape(expand('%:h'), ' ')<cr><cr>", desc = "Explore File Directory" },
}, { prefix = "<leader>" })

-- ===========================================================
--  Windows Management
-- ===========================================================
wk.add({
	{ "<leader>w", group = "windows" },
	{ "<leader>ws", ":split<cr>", desc = "Split Horizontally" },
	{ "<leader>wv", ":vsplit<cr>", desc = "Split Vertically" },
	{ "<leader>wh", "<C-w>h", desc = "Window Left" },
	{ "<leader>wj", "<C-w>j", desc = "Window Down" },
	{ "<leader>wk", "<C-w>k", desc = "Window Up" },
	{ "<leader>wl", "<C-w>l", desc = "Window Right" },
	{ "<leader>ww", "<C-w>w", desc = "Other Window" },
	{ "<leader>wq", ":q<cr>", desc = "Close Window" },
	{ "<leader>wc", ":close<cr>", desc = "Close Window" },
	{ "<leader>wo", ":only<cr>", desc = "Keep Only Current Window" },
	{ "<leader>w=", "<C-w>=", desc = "Balance Windows" },
	{ "<leader>w+", ":resize +5<cr>", desc = "Increase Height" },
	{ "<leader>w-", ":resize -5<cr>", desc = "Decrease Height" },
	{ "<leader>w>", ":vertical resize +5<cr>", desc = "Increase Width" },
	{ "<leader>w<", ":vertical resize -5<cr>", desc = "Decrease Width" },
}, { prefix = "<leader>" })

-- ===========================================================
-- Toggle Terminal
-- ===========================================================
wk.add({
	{ "<leader>t", group = "terminal" },

	-- Terminal Commands
	{ "<leader>tt", "<cmd>ToggleTerm<cr>", desc = "Toggle Terminal" },
	{ "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "Floating Terminal" },
	{ "<leader>th", "<cmd>ToggleTerm size=10 direction=horizontal<cr>", desc = "Horizontal Terminal" },
	{ "<leader>tv", "<cmd>ToggleTerm size=80 direction=vertical<cr>", desc = "Vertical Terminal" },
	{ "<leader>tg", "<cmd>lua _LAZYGIT_TOGGLE()<cr>", desc = "LazyGit Terminal" },
	{ "<leader>tn", "<cmd>lua _NODE_TOGGLE()<cr>", desc = "Node REPL Terminal" },
	{ "<leader>tp", "<cmd>lua _PYTHON_TOGGLE()<cr>", desc = "Python REPL Terminal" },
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
	-- Group Definition
	{ "<leader>n", group = "netrw" },

	-- Netrw Commands
	{ "<leader>ne", ":Lexplore<cr>", desc = "Open Netrw" },
	{ "<leader>nn", ":Ex<cr>", desc = "Explore Current Directory" },
	{ "<leader>nu", "-", desc = "Parent Directory" },
	{ "<leader>nh", "gh", desc = "Toggle Hidden Files" },
	{ "<leader>ns", "S", desc = "Sort Files" },
	{ "<leader>nf", "%", desc = "New File" },
	{ "<leader>nd", "D", desc = "Delete File" },
	{ "<leader>nr", "R", desc = "Rename File" },
	{ "<leader>nm", "mf", desc = "Mark File" },
	{ "<leader>nc", "mc", desc = "Copy Marked Files" },
	{ "<leader>nv", "mb", desc = "Move Marked Files" },
}, { prefix = "<leader>" })

-- ===========================================================
-- Vimwiki / Markdown
-- ===========================================================
wk.add({
	{ "<leader>v", group = "vimwiki" },

	-- Vimwiki Commands
	{ "<leader>vf", ":set filetype=markdown<cr>", desc = "Set Filetype Markdown" },
	{ "<leader>vp", ":MarkdownPreviewToggle<cr>", desc = "Toggle Preview" },
	{ "<leader>vi", "<Plug>VimwikiIndex", desc = "Vimwiki Index" },
	{ "<leader>vt", "<Plug>VimwikiTabIndex", desc = "Vimwiki Tab Index" },
	{ "<leader>vs", "<Plug>VimwikiUISelect", desc = "UI Select" },
	{ "<leader>vd", "<Plug>VimwikiDiaryIndex", desc = "Diary Index" },
	{ "<leader>vn", "<Plug>VimwikiMakeDiaryNote", desc = "New Diary Note" },
	{ "<leader>vT", "<Plug>VimwikiTabMakeDiaryNote", desc = "New Diary Note in Tab" },
	{ "<leader>vy", "<Plug>VimwikiMakeYesterdayDiaryNote", desc = "Yesterday's Note" },
	{ "<leader>vm", "<Plug>VimwikiMakeTomorrowDiaryNote", desc = "Tomorrow's Note" },
	{ "<leader>vh", "<Plug>Vimwiki2HTML", desc = "Convert to HTML" },
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
	{ "<leader>F", group = "formatting" },

	-- Formatting Commands
	{ "<leader>Ff", ":Neoformat<cr>", desc = "Format File" },
	{ "<leader>Fa", ":%Neoformat<cr>", desc = "Format All" },
}, { prefix = "<leader>" })

-- ===========================================================
-- LSP Config Shortcuts
-- ===========================================================
wk.add({
	{ "<leader>l", group = "lsp" },

	-- LSP Commands
	{ "<leader>lh", ":lua vim.lsp.buf.hover()<cr>", desc = "Hover Docs" },
	{ "<leader>ld", ":lua vim.diagnostic.open_float()<cr>", desc = "Show Diagnostics" },
	{ "<leader>lr", ":lua vim.lsp.buf.rename()<cr>", desc = "Rename Symbol" },
	{ "<leader>lf", ":lua vim.lsp.buf.format()<cr>", desc = "Format Document" },
	{ "<leader>la", ":lua vim.lsp.buf.code_action()<cr>", desc = "Code Action" },
	{ "<leader>ln", ":lua vim.diagnostic.goto_next()<cr>", desc = "Next Diagnostic" },
	{ "<leader>lp", ":lua vim.diagnostic.goto_prev()<cr>", desc = "Prev Diagnostic" },
}, { prefix = "<leader>" })

-- ===========================================================
-- Harpoon Shortcuts
-- ===========================================================
wk.add({
	{ "<leader>h", group = "harpoon" },

	-- Harpoon Commands
	{ "<leader>ha", ":lua require('harpoon.mark').add_file()<cr>", desc = "Add Mark" },
	{ "<leader>hu", ":lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "Toggle Menu" },
	{ "<leader>hn", ":lua require('harpoon.ui').nav_next()<cr>", desc = "Next Mark" },
	{ "<leader>hp", ":lua require('harpoon.ui').nav_prev()<cr>", desc = "Prev Mark" },
	{ "<leader>h1", ":lua require('harpoon.ui').nav_file(1)<cr>", desc = "Go to Mark 1" },
	{ "<leader>h2", ":lua require('harpoon.ui').nav_file(2)<cr>", desc = "Go to Mark 2" },
	{ "<leader>h3", ":lua require('harpoon.ui').nav_file(3)<cr>", desc = "Go to Mark 3" },
	{ "<leader>h4", ":lua require('harpoon.ui').nav_file(4)<cr>", desc = "Go to Mark 4" },
}, { prefix = "<leader>" })

-- ===========================================================
-- Custom Scripts
-- ===========================================================
wk.add({
	{ "<leader>a", group = "ai_tools" },

	-- AI Tools Commands
	{ "<leader>ac", ":lua require('user.ai_tools.scripts.chat').execute()<CR>", desc = "AI Chat" },
	{ "<leader>al", ":lua require('user.ai_tools.scripts.harpoon_list').execute()<CR>", desc = "Harpoon List" },
	{ "<leader>ap", ":lua require('user.prompt_gen').execute()<cr>", desc = "Generate Prompt" },
}, { prefix = "<leader>" })

-- ===========================================================
-- Telescope Shortcuts
-- ===========================================================
wk.add({
	{ "<leader>f", group = "find" },

	-- Telescope Commands
	{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
	{ "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
	{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find Buffers" },
	{ "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Find Help" },
	{ "<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "Find Keymaps" },
	{ "<leader>fm", "<cmd>Telescope marks<cr>", desc = "Find Marks" },
	{ "<leader>fo", "<cmd>Telescope oldfiles<cr>", desc = "Find Recent Files" },
	{ "<leader>fd", "<cmd>Telescope lsp_definitions<cr>", desc = "Find Definitions" },
	{ "<leader>fr", "<cmd>Telescope lsp_references<cr>", desc = "Find References" },
	{ "<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Find Symbols" },
	{ "<leader>ft", "<cmd>Telescope treesitter<cr>", desc = "Find Treesitter" },
}, { prefix = "<leader>" })
