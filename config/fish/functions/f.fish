#
# Borrowed from ttscoff
# https://github.com/ttscoff/fish_files/blob/master/functions/f.fish
#

function f -d "Open directory in Finder"
  open -F (fallback $argv ".")
end
