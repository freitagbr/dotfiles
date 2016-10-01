#!/usr/bin/env bash

bashrc='bash_profile'

if [[ `uname` == "Linux" ]]; then
  bashrc='bashrc'
fi

for file in *; do
  case $file in
    install\.sh|update\.sh|LICENSE|README\.md) ;;
    bashrc) cp $file ~/.$bashrc ;;
    *) cp $file ~/.$file;;
  esac
done
