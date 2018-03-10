function fish_title --description 'Sets the window title'
  set --local path (abbreviated-working-directory)
  echo "fish => $path"
end
