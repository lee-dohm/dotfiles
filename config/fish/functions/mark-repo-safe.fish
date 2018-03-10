function mark-repo-safe --description "Marks the repository's bin directory safe for PATH inclusion"
  mkdir (git rev-parse --git-dir)/bin-safe
end
