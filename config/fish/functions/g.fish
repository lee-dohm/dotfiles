function g --description 'Alias for git: defaults to short status when no args are given' --wraps git
  if test (count $argv) -eq 0
    git st
  else
    git $argv
  end
end
