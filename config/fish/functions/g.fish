function g --wraps git
  set --local git_command ""

  if hash hub > /dev/null ^ /dev/null
    set git_command hub
  else
    set git_command git
  end

  if [ (count $argv) -gt 0 ]
    eval $git_command $argv
  else
    eval $git_command st
  end
end
