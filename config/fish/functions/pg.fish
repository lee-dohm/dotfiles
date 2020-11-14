function pg --description 'Helper for Postgres'
  set --local command $argv[1]

  switch $command
    # Gets the status of the running Postgres server, if any
    case '' status
      pg_ctl status

    # Emits the major version number of the installed Postgres engine
    # Used to determine the proper data directory location
    case major-version
      postgres --version | cut -f 3 -d " " | cut -f 1 -d "."

    # Starts the Postgres server with my default configuration
    # See `config/fish/init/postgres.fish` for settings
    case start
      if test -z $PGDATA
        echo "Environment variable PGDATA must be set to start Postgres server"
        return 1
      end

      if test -z $POSTGRES_LOG
        echo "Environment variable POSTGRES_LOG must be set to start Postgres server"
        return 1
      end

      pg_ctl start --log $POSTGRES_LOG

    # Stops the running Postgres server, if any
    case stop
      pg_ctl stop

    # Default if an unrecognized subcommand is given
    case '*'
      echo "Command '$command' not recognized"
      return 1
  end
end
