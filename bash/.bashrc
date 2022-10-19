#!/bin/bash

# general
alias c="clear"
alias ls="ls -G"
alias lsa="ls -all"
alias cdg="cd ~/github"

# git
alias gits="git status"
alias gitd="git diff"
alias gitcm="git commit -m "
alias gita="git add "

# terraform
alias ta="terraform apply"
alias tp="terraform plan"
alias td="terraform destroy"

# taskwarrior
alias wl="clear && task ls"
alias wa="clear && task active"

# terminal
export TERM="xterm-256color"
PS1='\[\e[0;33m\]\u\[\e[0m\]@\[\e[0;32m\]\h\[\e[0m\]:\[\e[0;34m\]\w\[\e[0m\]\$ '

# homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# node
export NVM_DIR="$HOME/.nvm"
source $(brew --prefix nvm)/nvm.sh

# vim
set -o vi
alias sbp="source ~/.bash_profile"
alias vbp="vim ~/github/.dotfiles/bash/.bashrc"
alias vss="vim ~/OneDrive/Documents/screen_shots/."
alias vim="nvim"
alias vkm="vim ~/github/.dotfiles/nvim/lua/core/keymaps.lua"
alias v="nvim ."

# aws
alias adi="
aws ec2 describe-instances \
    --filters Name=instance-state-name,Values=running \
    --query 'Reservations[*].Instances[*}.{Instance:InstanceId,Name:Tags[?Key==\'Name\']|[0].Value,PriIp:PrivateIpAddress,PubDns:PublicDnsAddress,key:KeyName}' \
    --output table
"
