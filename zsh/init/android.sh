#!/bin/zsh

android="$HOME/android-sdk-macosx"
android_path="$HOME/android-sdk-macosx/tools:$HOME/android-sdk-macosx/platform-tools"

add_to_path "$android" "$android_path"

export ANDROID_HOME="$android"
export JAVA_HOME="$(/usr/libexec/java_home)"
