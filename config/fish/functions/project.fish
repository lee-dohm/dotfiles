function project \
  --description 'Shortcut from anywhere to a project directory'

  if not set -q REPO_HOME
    echo 'REPO_HOME environment variable must be set to the directory where all projects are stored'
    return 1
  end

  set arg_count (count $argv)

  switch $arg_count
  case 0
    cd $REPO_HOME
  case 1
    cd $REPO_HOME/$argv[1]
  case '*'
    echo "You can only specify one project directory, you specified $arg_count"
    return 2
  end
end
