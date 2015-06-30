#!/bin/sh

# No arguments: "atom ."
# With arguments: Acts like "atom $@"
e() {
    if [ $# -gt 0 ]; then
        atom "$@"
    else
        atom .
    fi
}

ed() {
    if [ $# -gt 0 ]; then
        atom --dev "$@"
    else
        atom --dev .
    fi
}

es() {
    if [ $# -gt 0 ]; then
        atom --safe "$@"
    else
        atom --safe .
    fi
}
