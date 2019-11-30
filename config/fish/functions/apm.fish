function apm --description 'Allows any installed apm channel to be called using `apm`'
  if program-exists apm
    command apm $argv
  else
    set --local apm ''

    if program-exists apm-beta
      set apm apm-beta
    else
      set apm apm-nightly
    end

    $apm $argv
  end
end
