# Colorized ls output
set --export CLICOLOR 1
set --export LSCOLORS Exfxcxdxbxegedabagacad

# Ensure the HOSTNAME environment variable is set so that `rcm` works properly
if [ -z $HOSTNAME ]
  set --export HOSTNAME (hostname -s)
end

for init in (ls ~/.config/fish/init)
  source ~/.config/fish/init/$init
end
