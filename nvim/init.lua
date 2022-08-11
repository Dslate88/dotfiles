-- vim.cmd("set termguicolors")


require("user/packer")
require("core/options")
require("core/colors")
require("core/autocmd")
require("core/keymaps")


require("user/neogit")
require("user/telescope") --needs live_grep config still
require("user/lsp")

--require("user/neoformat")--see bugs in lua file
require("user/cmp")
require("user/mason")
require("user/comment")
require("user/lualine")
require("user/treesitter")

