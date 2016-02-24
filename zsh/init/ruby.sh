#!/bin/zsh

# Ensure rbenv gets loaded if it is available
if [[ -d $HOME/.rbenv ]]; then
    export PATH=$PATH:$HOME/.rbenv/bin
    eval "$(rbenv init - --no-rehash)"
fi

alias b='bundle'
alias be='bundle exec'
