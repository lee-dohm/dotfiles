function project \
  --description 'Shortcut from anywhere to a project directory' \
  --argument-names project

  if not set -q REPO_HOME
    echo 'REPO_HOME environment variable must be set to the directory where all projects are stored'
    exit 1
  end

  cd $REPO_HOME/$project
end
