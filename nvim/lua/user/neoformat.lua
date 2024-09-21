vim.g.neoformat_try_node_exe = 1
vim.g.neoformat_enabled_javascript = {'prettier', 'eslint'}
vim.g.neoformat_enabled_typescript = {'prettier', 'eslint'}

-- vim.g.neoformat_lua_stylua = {
--     exe = 'stylua',
--     args = {'-'},
--     replace = 1,
--     stdin = 1
-- }
-- -- Lua formatter configuration
-- vim.g.neoformat_lua_stylua = {
--     exe = 'stylua',
--     args = { '--stdin-filepath', '%:p', '-' },
--     replace = 1,
--     stdin = 1
-- }
vim.g.neoformat_enabled_lua = {'stylua'}
