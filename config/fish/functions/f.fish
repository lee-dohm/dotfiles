#
# Borrowed from ttscoff
# https://github.com/ttscoff/fish_files/blob/master/functions/f.fish
#

function f -d "Open directory in Finder"
  if test (uname -s) = "Darwin"
    open -F (fallback $argv ".")
  else
    echo "Error: f function only supported on macOS"
    return 1
  end
end
