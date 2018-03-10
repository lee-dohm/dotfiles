function _project_dirs
  string replace -r "$REPO_HOME/(.*)/" '$1' $REPO_HOME/*/*/
end

complete -c project -a '(_project_dirs)'
