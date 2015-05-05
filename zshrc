#!/bin/zsh

setopt promptsubst

# load our own completion functions
fpath=(~/.zsh/completion $fpath)

# completion
autoload -U compinit && compinit

# Use case-insensitive completion matches
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# load custom executable functions
for function in ~/.zsh/functions/*; do
    source "$function"
done

# makes color constants available
autoload -U colors && colors

# history settings
setopt hist_ignore_all_dups inc_append_history
HISTFILE=~/.zhistory
HISTSIZE=4096
SAVEHIST=4096

# awesome cd movements from zshkit
setopt autocd autopushd pushdminus pushdsilent pushdtohome cdablevars
DIRSTACKSIZE=5

# Enable extended globbing
setopt extendedglob

# Allow [ or ] whereever you want
unsetopt nomatch

# handy keybindings
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
bindkey "^R" history-incremental-search-backward
bindkey "^P" history-search-backward
bindkey "^Y" accept-and-hold
bindkey "^N" insert-last-word

# ensure dotfiles bin directory is loaded first
export PATH="$HOME/.bin:/usr/local/bin:/usr/local/sbin:$PATH"

# aliases
[[ -f ~/.aliases ]] && source ~/.aliases

# Use colorized ls
if [[ $(uname -s) == 'Darwin' ]]; then
    export CLICOLOR=1
    export LSCOLORS='Exfxcxdxbxegedabagacad'
else
    alias ls='ls --color=auto'
fi

# Ensure the HOSTNAME environment variable is set so that `rcm` works properly
if [[ -z "$HOSTNAME" ]]; then
    export HOSTNAME=$(hostname -s)
fi

# Don't autocorrect arguments
unsetopt correct_all

SEGMENT_START='['
SEGMENT_END=']'

# Draws a segment of the prompt if the given content is non-empty.
prompt_segment() {
    if [[ -n $1 ]]; then
        echo -n "$SEGMENT_START$1%{%f%b%k%}$SEGMENT_END"
    fi
}

# Builds the complete prompt
build_prompt() {
    exit=$?

    if [[ -n "$SSH_CONSOLE" ]] || [[ -n "$SSH_TTY" ]]; then
        prompt_segment "%B%F{yellow}ssh:#{$HOSTNAME}"
    fi
    prompt_segment "$(git_prompt_info)"
    prompt_segment "%B%F{blue}%~"
    if [[ $exit -gt 0 ]]; then
        prompt_segment "$(exit_code)"
    fi

    echo -n " "
}

# Adds an indicator of where the HEAD is in the graph.
#
# If HEAD is on a branch, the branch name is output in green. If HEAD is
# on a tag, the tag name is output in yellow. If HEAD is on neither a
# branch nor a tag, the short SHA is output in yellow.
git_prompt_info() {
    ref=$(git symbolic-ref HEAD 2> /dev/null)
    if [[ -n $ref ]]; then
        echo "%{$fg_bold[green]%}${ref#refs/heads/}"
    else
        tag=$(git branch --no-color 2> /dev/null |
                  sed -e '/^[^*]/d' -e "s/* (detached from \(.*\))/\1/")

        if [[ -n $tag ]]; then
            echo "%{$fg_bold[yellow]%}${tag}"
        fi
    fi
}

exit_code() {
    echo -n "%(?..${fg_bold[red]}%?)"
}

export PROMPT='%{%f%b%k%}$(build_prompt)'

# Perform any app-specific initializations
for init in $HOME/.zsh/init/*.sh; do
    source "$init"
done
