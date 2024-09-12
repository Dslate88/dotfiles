local null_ls = require("null-ls")

local builtins = null_ls.builtins

null_ls.setup({
  sources = {
    builtins.diagnostics.eslint_d,  -- Use eslint_d for faster linting
    builtins.code_actions.eslint,   -- Enable ESLint code actions
  },
})
