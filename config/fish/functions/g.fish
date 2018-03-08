function g --wraps git
  if hash hub > /dev/null ^ /dev/null
    if [ (count $argv) -gt 0 ]
      hub $argv
    else
      hub st
    end
  else
    if [ (count $argv) -gt 0 ]
      git $argv
    else
      git st
    end
  end
end
