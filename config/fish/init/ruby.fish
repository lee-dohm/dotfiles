if program-exists rbenv
  status --is-interactive; and source (rbenv init -|psub)

  alias b='bundle'
  alias be='bundle exec'
end
