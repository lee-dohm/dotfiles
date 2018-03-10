function _prompt_dir_component
  _prompt_wrap_text (abbreviated_working_directory) brblue
end

function _prompt_err_component
  if [ $argv[1] -ne 0 ]
    _prompt_wrap_text $argv[1] brred
  end
end

function _prompt_git_component
  if git rev-parse --git-dir > /dev/null ^ /dev/null
    _prompt_wrap_text (git rev-parse --abbrev-ref HEAD) green
  end
end

function _prompt_wrap_text --argument-names {text,color}
  set_color normal
  echo -n "["
  set_color --bold $color
  echo -n $text
  set_color normal
  echo -n "]"
end

function fish_prompt
  set --local real_status $status
  set --local err (_prompt_err_component $real_status)
  set --local git (_prompt_git_component)
  set --local dir (_prompt_dir_component)
  echo "$git$dir$err "
end
