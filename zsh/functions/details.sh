#!/usr/bin/zsh

details ()
{
    echo "$@" | pbcopy;
    sleep 1;
    $@ | pbcopy
}
