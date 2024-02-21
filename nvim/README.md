## install neovim
- brew install neovim

## create symlink between gh repo & ~/.config
- run `ln -s ~/github/dotfiles/nvim /Users/home/.config/nvim`

## Packer: plugin manager for neovim
- follow [packer](https://github.com/wbthomason/packer.nvim) quickstart guide
- specifically, the git clone of `wbthomason/packer.nvim` to a local `packpath`

## install plugins for nvim with packer
- run `nvim .` (using nvim version:v0.9.0)
- run `:PackerInstall` <!-- This collects the gh repo specified in packer.lua and installs -->

## Packer.lua additional dependencies
- brew install ripgrep (needed for Telescope)

## NerdFont
- https://github.com/tonsky/FiraCode
- install, update iterm2 with profile text preference to point to FiraCode

## nvim-treesitter
- might have to run `pacadd nvim-treesitter`
