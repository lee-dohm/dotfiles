function program-exists --argument-names {program}
  hash $program >/dev/null ^&1
end
