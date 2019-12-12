function program-exists \
  --argument-names {program} \
  --description 'Returns true if the command or program exists, false otherwise'

  command --quiet --search $program
end
