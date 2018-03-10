function fish_title --description 'Sets the window title'
  set --local path (prompt_pwd)
  echo "fish => $path"
end
