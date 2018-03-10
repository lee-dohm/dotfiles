if program-exists nodenv
  status --is-interactive; and source (nodenv init -|psub)

  set --export PATH $PATH /usr/local/lib/node_modules
  set --export PATH .git/bin-safe/../../node_modules/bin $PATH
end
