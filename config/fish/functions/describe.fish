#
# Borrowed from ttscoff
# https://github.com/ttscoff/fish_files/blob/master/functions/describe.fish
#

function describe --description 'Show description for function'
  set --local d (functions --details --verbose $argv)

  echo (set_color --dim brblue)"$d[1]:$d[3] ($d[2])"(set_color normal)
  echo (set_color --bold white)"> $d[5]"(set_color normal)
end
