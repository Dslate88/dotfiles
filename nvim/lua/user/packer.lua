 vim.cmd([[
   augroup packer_user_config
     autocmd!
     autocmd BufWritePost packer.lua source <afile> | PackerCompile
   augroup end
 ]])

return require("packer").startup(function(use)
    use "wbthomason/packer.nvim"

    -- neogit
    use {"TimUntersberger/neogit",
        requires={"nvim-lua/plenary.nvim"},
        {'sindrets/diffview.nvim'}
	}

    -- fuzzy
    use {"nvim-telescope/telescope.nvim",
        tag = "0.1.0",
        requires = {
            {"nvim-lua/plenary.nvim"},
            {"BurntSushi/ripgrep"} --brew install ripgrep
        }
    }
    -- randos
    use { "folke/which-key.nvim" }
    use "sbdchd/neoformat"
    use "ThePrimeagen/harpoon"

    use "preservim/tagbar"  -- brew install universal-ctags
    use "numToStr/Comment.nvim"
    use {"nvim-lualine/lualine.nvim",
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use { "iamcco/markdown-preview.nvim",
        run = "cd app && npm install",
        ft = { "markdown" }
    }
    use "vimwiki/vimwiki"

    -- color schemes
    use "morhetz/gruvbox"
    use "folke/tokyonight.nvim"

    -- lsp
    use "neovim/nvim-lspconfig"
    use "williamboman/mason.nvim" --lsp server installer
    use "williamboman/mason-lspconfig.nvim"
    use "hashivim/vim-terraform"
    use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}

    -- auto completion
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-cmdline"
    use { "hrsh7th/nvim-cmp",
        requires = {
            { "hrsh7th/vim-vsnip" },
            { "hrsh7th/vim-vsnip-integ" },
        }
    }

    -- terminal float
    use {"akinsho/toggleterm.nvim", tag = '*', config = function()
      require("toggleterm").setup()
    end}

    -- snippets
    use "rafamadriz/friendly-snippets"

end)
