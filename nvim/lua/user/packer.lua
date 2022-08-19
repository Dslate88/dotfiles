 vim.cmd([[
   augroup packer_user_config
     autocmd!
     autocmd BufWritePost packer.lua source <afile> | PackerCompile
   augroup end
 ]])

return require("packer").startup(function(use)
    use "wbthomason/packer.nvim"

    use {"TimUntersberger/neogit",
        requires={"nvim-lua/plenary.nvim"}
	}
    use {"nvim-telescope/telescope.nvim",
        tag = "0.1.0",
        requires = {
            {"nvim-lua/plenary.nvim"},
            {"BurntSushi/ripgrep"} --brew install ripgrep
        }
    }
    -- randos
    use {
      "folke/which-key.nvim",
      config = function()
        require("which-key").setup {}
      end
    }
    use "sbdchd/neoformat"
    use "ThePrimeagen/harpoon"
    use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
    use "preservim/tagbar"  -- brew install universal-ctags
    use "numToStr/Comment.nvim"
    use {"nvim-lualine/lualine.nvim",
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    -- color schemes
    use "morhetz/gruvbox"
    use "folke/tokyonight.nvim"

    -- lsp
    use "neovim/nvim-lspconfig"
    use "williamboman/mason.nvim" --lsp server installer
    use "williamboman/mason-lspconfig.nvim"
    use "hashivim/vim-terraform"

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
