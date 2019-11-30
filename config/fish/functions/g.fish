function g --description 'Alias for git: use hub, if available, and defaults to short status when no args are given' --wraps git
  set --local command ''

  if command --search --quiet hub
    set command hub
  else
    set command git
  end

  if test (count $argv) -gt 0
    command $command $argv
  else
    command $command st
  end
end
