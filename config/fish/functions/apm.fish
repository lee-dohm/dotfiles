function apm --description 'Allows any installed apm channel to be called using `apm`'
  set --local apm_command ''

  if program-exists apm
    set apm_command apm
  else if program-exists apm-beta
    set apm_command apm-beta
  else
    set apm_command apm-nightly
  end

  set --local exec_command $apm_command (string escape -- $argv)

  eval "$exec_command"
end
