-- vim.cmd([[
--   augroup packer_user_config
--     autocmd!
--     autocmd BufWritePost packer.lua source <afile> | PackerCompile
--   augroup end

--   augroup fmt
--      autocmd!
--     autocmd BufWritePre * undojoin | Neoformat
--   augroup end
-- ]])

return require("packer").startup(function(use)
    use "wbthomason/packer.nvim"

    use {"TimUntersberger/neogit",
        requires={"nvim-lua/plenary.nvim"}
	}
    use {"nvim-telescope/telescope.nvim",
        tag = "0.1.0",
        requires = {
            {"nvim-lua/plenary.nvim"},
            {"BurntSushi/ripgrep"}
        }
    }
    use "sbdchd/neoformat"
    use "ThePrimeagen/harpoon"
    use "morhetz/gruvbox"
    use "folke/tokyonight.nvim"
    use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
    use "preservim/tagbar"

    -- lsp
    use "neovim/nvim-lspconfig"
    use "williamboman/mason.nvim" --lsp server installer
    use "williamboman/mason-lspconfig.nvim"

    -- auto completion
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-cmdline"
    use "hrsh7th/nvim-cmp"
    use "saadparwaiz1/cmp_luasnip"

    -- snippets
    use "L3MON4D3/LuaSnip"
    -- use "rafamadriz/friendly-snippets"

end)
