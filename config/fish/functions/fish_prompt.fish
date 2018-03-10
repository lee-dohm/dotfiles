function _prompt_dir_component
  _prompt_wrap_text (abbreviated_working_directory) brblue
end

function _prompt_err_component --argument-names {real_status}
  if [ $real_status -ne 0 ]
    _prompt_wrap_text $real_status brred
  end
end

function _prompt_git_component
  if git rev-parse --git-dir >/dev/null ^&1
    set --local sha (git rev-parse HEAD)
    set --local ref (git show-ref --tags --heads | grep $sha; or echo '')

    set --local parts ''
    if [ -n $ref ]
      set parts (string split / -- $ref)
    else
      set parts null detached $sha
    end

    switch $parts[2]
    case heads
      _prompt_wrap_text $parts[3] green
    case tags
      _prompt_wrap_text $parts[3] yellow
    case detached
      _prompt_wrap_text (git rev-parse --short $sha) brred
    end
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
