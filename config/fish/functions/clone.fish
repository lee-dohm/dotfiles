function __clone_exec --argument-names project
  if set --local result (string match --regex "https://github.com/([^/]+)/([^./]+)" $project)
  else if set --local result (string match --regex "git@github.com:([^/]+)/([^./]+)" $project)
  else if set --local result (string match --regex "([^/]+)/([^./]+)" $project)
  else
    echo "`$project` does not match a repository specification, cannot clone it"
    return 1
  end

  set --local owner $result[2]
  set --local repo $result[3]

  if not command --quiet --search gh
    echo "`gh` tool is not installed"

    return 1
  end

  if not test -d $REPO_HOME/$owner
    command mkdir -p $REPO_HOME/$owner
  end

  gh repo clone $owner/$repo $REPO_HOME/$owner/$repo
end

function clone --description "Clones GitHub repositories into the structure to which I've become accustomed"
  if not set --query REPO_HOME
    echo 'REPO_HOME environment variable is not set'

    return 1
  end

  for project in $argv
    __clone_exec $project
  end
end
