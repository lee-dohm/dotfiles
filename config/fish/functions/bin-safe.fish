function __bin-safe_echo --no-scope-shadowing
  set -q _flag_query; or echo $argv
end

function bin-safe --description 'Shows or changes the bin-safe state of the git repository'
  set --local options (fish_opt -s q -l query)
  argparse $options -- $argv

  if not __fish_is_git_repository
    __bin-safe_echo 'Not a Git repository'
    return 3
  end

  set --local safe_cmd ''
  if set -q argv[1]
    set safe_cmd $argv[1]
    set -e argv[1]
  end

  set --local git_dir (git rev-parse --git-dir)
  set --local safe_dir $git_dir/bin-safe

  switch $safe_cmd
  case clear
    rm -rf $safe_dir
  case set
    mkdir -p $safe_dir
  case '*'
    if [ -d $safe_dir ]
      __bin-safe_echo 'Repository is bin-safe'
      return 0
    else
      __bin-safe_echo 'Repository is not bin-safe'
      return 1
    end
  end
end
