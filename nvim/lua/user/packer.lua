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
    use "neovim/nvim-lspconfig"
    use "ThePrimeagen/harpoon"
    use "morhetz/gruvbox"
    use "folke/tokyonight.nvim"
    use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}

    use "preservim/tagbar"

end)
