require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {
        "jsonls",
        "marksman",
        "lua_ls",
        "pyright",
        -- "terraformls", -- rm for now, confirm trust later
        "tflint",
        -- "black", -- run MasonInstall black manually
    },
    automatic_installation = true,
})


