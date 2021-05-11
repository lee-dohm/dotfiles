function cat --description 'Alias cat to bat, when appropriate'
  if command --search --quiet bat
    bat $argv
  else
    cat $argv
  end
end
