function prompt_dir_component
  prompt_wrap_text (abbreviated_working_directory) brblue
end

function prompt_err_component
  if [ $argv[1] -ne 0 ]
    prompt_wrap_text $argv[1] brred
  end
end

function prompt_git_component
  if git rev-parse --git-dir > /dev/null ^ /dev/null
    prompt_wrap_text (git rev-parse --abbrev-ref HEAD) green
  end
end

function prompt_wrap_text --argument-names {text,color}
  set_color normal
  echo -n "["
  set_color --bold $color
  echo -n $text
  set_color normal
  echo -n "]"
end

function fish_prompt
  set --local real_status $status
  set --local err (prompt_err_component $real_status)
  set --local git (prompt_git_component)
  set --local dir (prompt_dir_component)
  echo "$git$dir$err "
end
