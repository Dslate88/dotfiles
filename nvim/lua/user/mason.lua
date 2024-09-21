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
		-- "stylua", -- manual install this
	},
	automatic_installation = true,
})
