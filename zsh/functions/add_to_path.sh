#!/bin/bash

# Appends an entry to the `PATH` iff the path exists.
#
# One argument - Checks to see if the path exists, appends it if it does.
# Two arguments - Checks to see if the first argument exists, appends the second if it does.
add_to_path() {
    if [[ -e "$1" ]]; then
        if [[ -n "$2" ]]; then
            export PATH="$PATH:$2"
        else
            export PATH="$PATH:$1"
        fi
    fi
}
