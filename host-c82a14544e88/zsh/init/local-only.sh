#!/bin/bash

local_only="$HOME/Source/local-only"
local_only_bin="$local_only/bin"

add_to_path "$local_only" "$local_only_bin"

# Perform any local-specific initializations
for init in $local_only/init/*; do
  source "$init"
done
