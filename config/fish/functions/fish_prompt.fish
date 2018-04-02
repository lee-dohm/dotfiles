function _prompt_dir_component
  _prompt_wrap_text (prompt_pwd) brblue
end

function _prompt_err_component --argument-names {error_code}
  if [ $error_code -ne 0 ]
    _prompt_wrap_text $error_code brred
  end
end

function _prompt_git_component
  if __fish_is_git_repository
    set --local sha (git rev-parse HEAD)
    set --local branch (git rev-parse --abbrev-ref HEAD)

    set --local info ''
    if [ $branch = HEAD ]
      if set --local ref (git show-ref --tags | grep $sha)
        set --local parts (string split / -- $ref)
        set info tag $parts[3]
      else
        set info detached $sha
      end
    else
      set info branch $branch
    end

    switch $info[1]
    case branch
      _prompt_wrap_text $info[2] green
    case tag
      _prompt_wrap_text $info[2] yellow
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
  set --local error_code $status

  echo -n (_prompt_git_component)
  echo -n (_prompt_dir_component)
  echo -n (_prompt_err_component $error_code)
  echo ' '
end
