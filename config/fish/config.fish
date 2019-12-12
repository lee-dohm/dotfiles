# Colorized ls output
set --export CLICOLOR 1
set --export LSCOLORS Exfxcxdxbxegedabagacad

# Ensure the HOSTNAME environment variable is set so that `rcm` works properly
if ! set --query HOSTNAME
  set --export HOSTNAME (hostname -s)
end

if status --is-interactive
  set --global fish_user_abbreviations

  abbr --add ex 'exercism'
  abbr --add gg 'git graph'
  abbr --add guf 'git update-fork'
  abbr --add p 'project'
end

set --global fish_prompt_pwd_dir_length 0

for init in (command ls ~/.config/fish/init)
  source ~/.config/fish/init/$init
end
