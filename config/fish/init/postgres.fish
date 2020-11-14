if program-exists postgres
  set --local pg_version (pg major-version)

  set --export PGDATA /usr/local/var/postgres/$pg_version
  set --export POSTGRES_LOG $PGDATA/postgres.log
end
