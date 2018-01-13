#!/usr/bin/env zsh

function notify {
  title=${1:-"🎉  Finished! 🎉 "}
  msg=${2:-"Your command is finished!"}
  osascript -e "display notification \"$msg\" with title \"$title\" sound name \"Default\""
}
