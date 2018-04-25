function project \
  --description 'Shortcut from anywhere to a project directory'

  if not set -q REPO_HOME
    echo 'REPO_HOME environment variable must be set to the directory where all projects are stored'
    return 1
  end

  set arg_count (count $argv)

  switch $arg_count
  case 0
    # No parameters, change to the repository home directory
    cd $REPO_HOME
  case 1
    # Single project supplied, change to the project repository directory
    set --local project $argv[1]
    set --local destination $REPO_HOME/$project

    if not [ -d $destination ]
      if not program-exists clone
        echo "The project, $project, does not exist in the repository home and the `clone` tool is not installed."
        return 1
      end

      clone $project
    end

    cd $destination
  case '*'
    # Multiple projects supplied, return an error
    echo "You can only specify one project directory, you specified $arg_count"
    return 2
  end
end
