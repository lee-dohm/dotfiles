#!/bin/zsh

# Ensure rbenv gets loaded if it is available
if ! hash rbenv 2> /dev/null ; then
    if [[ -d $HOME/.rbenv ]]; then
        export PATH=$PATH:$HOME/.rbenv/bin
        eval "$(rbenv init - --no-rehash)"
    fi
fi

alias b='bundle'
alias be='bundle exec'
