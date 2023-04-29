require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {
        "jsonls",
        "marksman",
        "lua-ls",
        "pyright",
        "terraformls"
    },
    automatic_installation = true,
})


