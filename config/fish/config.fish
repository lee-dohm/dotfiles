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

# Configure Homebrew before doing the other init scripts
# /usr/local is used on Intel Macs
# /opt/homebrew is used on Apple Silicon Macs
if test -e /usr/local/bin/brew
  eval (/usr/local/bin/brew shellenv)
end

if test -e /opt/homebrew/bin/brew
  eval (/opt/homebrew/bin/brew shellenv)
end

for init in (command ls ~/.config/fish/init)
  source ~/.config/fish/init/$init
end
