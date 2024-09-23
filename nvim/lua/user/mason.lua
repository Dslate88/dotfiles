require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		"jsonls",
		"marksman",
		"lua_ls",
		"pyright",
		-- "terraformls",
		-- "black", -- run MasonInstall black manually
		"tflint",
		"ts_ls", -- typescript
		"eslint",
		-- "prettier", -- manual :MasonInstall prettier
		-- "stylua", -- manual :MasonInstall stylua
		-- "eslint-lsp", -- manual :MasonInstall eslint-lsp
	},
	automatic_installation = true,
})
