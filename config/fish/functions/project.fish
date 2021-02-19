# Project management commands.
#
# * `project delete <repo spec>` -- Delete the project matching the repo spec unless there are unsynced changes
# * `project home` -- Navigate to the `REPO_HOME` directory
# * `project open <repo spec>` -- Change to the project matching the repo spec, cloning it from GitHub if necessary
# * `project refresh <repo spec>` -- Delete then open the project matching the repo spec
#
function project --description 'Shortcut from anywhere to a project directory'
  if not set --query REPO_HOME
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

    if not test -d $destination
      if not functions --query clone
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
