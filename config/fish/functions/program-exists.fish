function program-exists --argument-names {program}
  hash $program > /dev/null ^ /dev/null
end
