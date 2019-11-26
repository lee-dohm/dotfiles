function g -d "Alias for git: use hub, if available, and defaults to short status when no args are given" --wraps git
  set --local args (fallback $argv "st")

  if command -sq hub
    command hub $args
  else
    command git $args
  end
end
