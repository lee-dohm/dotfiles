function abbreviated_working_directory --description 'Outputs a shortened version of the working directory'
  pwd | sed -E "s|$HOME|~|"
end
