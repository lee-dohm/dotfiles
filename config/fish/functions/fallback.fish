#
# Borrowed from ttscoff
# https://github.com/ttscoff/fish_files/blob/master/functions/fallback.fish
#

function fallback -d 'Allow a fallback value for variable'
  if test (count $argv) = 1
    echo $argv
  else
    echo $argv[1..-2]
  end
end
