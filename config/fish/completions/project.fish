function _project_dirs
  string replace -r "$REPO_HOME/(.*)/" '$1' $REPO_HOME/*/*/
end

complete --command project --arguments '(_project_dirs)'
