--this is broke, but the autocommand is running
-- vim.g.neoformat_python_autopep8 = {"exe": "black", "args": ["-"], "replace": 1, "stdin": 1}

-- Example configuration for Prettier and ESLint
vim.g.neoformat_try_node_exe = 1

-- Set formatters for JavaScript and TypeScript
vim.g.neoformat_enabled_javascript = {'prettier', 'eslint'}
vim.g.neoformat_enabled_typescript = {'prettier', 'eslint'}
