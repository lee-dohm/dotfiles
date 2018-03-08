function fish_title --description 'Sets the window title'
  set --local path (abbreviated_working_directory)
  echo "fish => $path"
end
