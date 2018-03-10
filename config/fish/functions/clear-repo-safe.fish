function clear-repo-safe --description "Clears the repository's bin safe status"
  rm -rf (git rev-parse --git-dir)/bin-safe
end
