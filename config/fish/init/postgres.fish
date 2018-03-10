if program-exists postgres
  set --export PGDATA /usr/local/var/postgres/10.0
  set --export POSTGRES_LOG $PGDATA/postgres.log

  alias pg-start="pg_ctl start --log $POSTGRES_LOG"
  alias pg-status="pg_ctl status"
  alias pg-stop="pg_ctl stop"
end
