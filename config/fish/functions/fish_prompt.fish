function __prompt_dir_component
  __prompt_wrap_text (prompt_pwd) brblue
end

function __prompt_err_component --argument-names error_code
  if [ $error_code -ne 0 ]
    __prompt_wrap_text $error_code brred
  end
end

function __prompt_git_has_head
  git rev-parse HEAD &> /dev/null
end

function __prompt_git_component_no_commits
  # Display "no commits yet" in red when the repository has just been initialized but no initial
  # commit has been made
  __prompt_wrap_text 'no commits yet' brred
end

function __prompt_git_component_with_commits
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
    # Display the branch name in green when we're on a branch
    __prompt_wrap_text $info[2] green
  case tag
    # Display the tag name in yellow when we're not on a branch but on a tag
    __prompt_wrap_text $info[2] yellow
  case detached
    # Display the SHA in red when we're not on a branch or a tag
    __prompt_wrap_text (git rev-parse --short $sha) brred
  end
end

function __prompt_git_component
  if __fish_is_git_repository
    if __prompt_git_has_head
      __prompt_git_component_with_commits
    else
      __prompt_git_component_no_commits
    end
  end
end

function __prompt_wrap_text --argument-names text color
  set_color normal
  echo -n "["
  set_color --bold $color
  echo -n $text
  set_color normal
  echo -n "]"
end

function fish_prompt
  set --local error_code $status

  echo -n (__prompt_git_component)
  echo -n (__prompt_dir_component)
  echo -n (__prompt_err_component $error_code)
  echo ' '
end
