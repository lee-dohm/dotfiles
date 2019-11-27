function program-exists \
  --argument-names {program} \
  -d 'Returns true if the command or program exists, false otherwise'

  command -sq $program
end
