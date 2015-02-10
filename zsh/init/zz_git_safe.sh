#!/bin/zsh

#
# Uses `zz` prefix to ensure it gets loaded last. This allows it to override the PATH with the
# project-local `bin` directory, so that bundler binstubs can take precedence over globally-
# available Gems. This allows me to stop having to type `be rake` everywhere and just type `rake`.
#

# mkdir .git/safe in the root of repositories you trust
export PATH=".git/safe/../../bin:$PATH"
