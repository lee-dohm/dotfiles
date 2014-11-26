#!/bin/zsh

if hash postgres 2>/dev/null; then
    export PGDATA=/usr/local/var/postgres
    export POSTGRES_LOG=$PGDATA/postgres.log

    alias pg-start="pg_ctl start --log $POSTGRES_LOG"
    alias pg-status="pg_ctl status"
    alias pg-stop="pg_ctl stop"
fi
