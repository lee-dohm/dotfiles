if hash hub 2>/dev/null; then
    # Alias `hub` as `git`
    eval "$(hub alias -s)"
fi

alias ga='git add'
alias gg='git l'
alias guf='git update-fork'
