function ll --description 'List contents of directory using long format'
  if command --search --quiet exa
    exa --binary --git --group --header --long $argv
  else
    command ls -lhF $argv
  end
end
