function la --description 'List contents of directory, including hidden files, using long format'
  if command --quiet --search exa
    exa --all --binary --git --group --header --long $argv
  else
    command ls -lhaF $argv
  end
end
