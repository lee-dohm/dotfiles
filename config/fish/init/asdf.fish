if program-exists asdf; and test (uname -s) = "Darwin"
  set --export PATH $PATH $HOME/.asdf/shims
end
