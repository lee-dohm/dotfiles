#!/bin/zsh

if [[ $(uname) == "Linux" ]]; then
    android="$HOME/android-sdk"
    export JAVA_HOME="/usr/lib/jvm/java-1.7.0-openjdk-amd64"
else
    android="$HOME/android-sdk-macosx"
    export JAVA_HOME="$(/usr/libexec/java_home 2> /dev/null)"
fi

android_path="$android/tools:$android/platform-tools"

if [[ -d "$android" ]]; then
    export ANDROID_HOME="$android"
    add_to_path "$android" "$android_path"

    alias stayon="adb shell svc power stayon true"
fi
