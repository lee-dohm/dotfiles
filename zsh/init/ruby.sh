# Ensure rbenv gets loaded if it is available
if ! hash rbenv 2> /dev/null ; then
    if [[ -d $HOME/.rbenv ]]; then
        export PATH=$PATH:$HOME/.rbenv/bin
        eval "$(rbenv init - --no-rehash)"
    fi
fi

if ! hash ruby 2> /dev/null ; then
    alias b='bundle'
    alias be='bundle exec'
    alias bi='bundle install'
    alias bre='bundle exec'
fi
