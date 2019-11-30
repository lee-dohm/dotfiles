function du --description 'Display disk use information, excluding git repo metadata'
  command du -h -I ".git" $argv
end
