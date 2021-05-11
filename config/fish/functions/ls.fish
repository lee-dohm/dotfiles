function ls --description 'Alias ls to exa, when appropriate'
  if command --search --quiet exa
    command exa $argv
  else
    command ls $argv
  end
end
