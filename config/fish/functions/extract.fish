#
# Borrowed from ttscoff
# https://github.com/ttscoff/fish_files/blob/master/functions/extract.fish
#

function extract -d 'Unarchive any file type'
  if test (count $argv) -ne 1
    echo "Error: No file specified."
    return 1
  end

  set -l f $argv

  if test -f $f
    switch $f
      case '*.tar.bz2'
        tar xvjf $f
      case '*.tar.gz'
        tar xvzf $f
      case '*.bz2'
        bunzip2 $f
      case '*.rar'
        unrar x $f
      case '*.gz'
        gunzip $f
      case '*.tar'
        tar xvf $f
      case '*.tbz2'
        tar xvjf $f
      case '*.tgz'
        tar xvzf $f
      case '*.zip'
        unzip $f
      case '*.Z'
        uncompress
      case '*.7z'
        7z x $f
      case '*'
        echo "`$f` cannot be extracted"
    end
  else
    echo "`$f` is not a valid file"
  end
end
