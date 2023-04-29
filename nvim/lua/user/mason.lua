require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {
        "jsonls",
        "lua_ls",
        "marksman",
        "pyright",
        "black",
        "terraformls"
    },
    automatic_installation = true,
})


