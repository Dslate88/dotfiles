require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {
        "jsonls",
        "sumneko_lua",
        "marksman",
        "pyright",
        "black",
        "terraformls"
    },
    automatic_installation = true,
})


