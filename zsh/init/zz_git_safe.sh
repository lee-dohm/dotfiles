#!/bin/zsh

#
# Uses `zz` prefix to ensure it gets loaded last. This allows it to override the PATH with the
# project-local `bin` directory, so that bundler binstubs can take precedence over globally-
# available Gems. This allows me to stop having to type `be rake` everywhere and just type `rake`.
#

# mark-repo-binsafe in the root of repositories you trust
export PATH=".git/bin-safe/../../bin:$PATH"

clear-repo-binsafe() {
  rm -rf "$(git rev-parse --show-toplevel)/.git/bin-safe"
}

mark-repo-binsafe() {
  mkdir "$(git rev-parse --show-toplevel)/.git/bin-safe"
}
