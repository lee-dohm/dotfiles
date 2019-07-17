function la --description 'List contents of directory, including hidden files in directory using long format'
  exa --all --binary --git --group --header --long $argv
end
