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
    use "sbdchd/neoformat"

    -- Simple plugins can be specified as strings
    use {"TimUntersberger/neogit",
        requires={"nvim-lua/plenary.nvim"}
	}

    -- TJ created lodash of neovim
    use "nvim-lua/plenary.nvim"
    use "nvim-lua/popup.nvim"
    use {"nvim-telescope/telescope.nvim",
        tag = "0.1.0",
        requires = {
            { "nvim-lua/plenary.nvim"},
            {"BurntSushi/ripgrep"}
        }
    }

    -- All the things
    use "neovim/nvim-lspconfig"
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/nvim-cmp"
    use {"tzachar/cmp-tabnine", run = "./install.sh" }
    use "onsails/lspkind-nvim"
    use "nvim-lua/lsp_extensions.nvim"
    use "glepnir/lspsaga.nvim"
    use "simrat39/symbols-outline.nvim"
    use "L3MON4D3/LuaSnip"
    use "saadparwaiz1/cmp_luasnip"

    -- Primeagen doesn"t create lodash
    use "ThePrimeagen/git-worktree.nvim"
    use "ThePrimeagen/harpoon"

    use "mbbill/undotree"

    -- Colorscheme section
    use "morhetz/gruvbox"
    use "folke/tokyonight.nvim"

    use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}


    use "nvim-treesitter/playground"
    use "romgrk/nvim-treesitter-context"

    use "mfussenegger/nvim-dap"
    use "rcarriga/nvim-dap-ui"
    use "theHamsta/nvim-dap-virtual-text"
end)
