function g -d "Alias for git: use hub, if available, and defaults to short status when no args are given" --wraps git
  if [ (count $argv) -gt 0 ]
    command -sq hub; and command hub $argv; or command git $argv
  else
    command -sq hub; and command hub st; or command git st
  end
end
