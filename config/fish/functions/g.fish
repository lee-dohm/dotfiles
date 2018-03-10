function g --wraps git
  set --local git_command ''

  if program-exists hub
    set git_command hub
  else
    set git_command git
  end

  if [ (count $argv) -gt 0 ]
    set --local exec_command $git_command (string escape -- $argv)

    eval "$exec_command"
  else
    eval "$git_command st"
  end
end
