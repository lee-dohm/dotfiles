function project \
  --description 'Shortcut from anywhere to a project directory' \
  --argument-names {project}

  cd $REPO_HOME/$project
end
