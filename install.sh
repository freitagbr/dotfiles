#!/usr/bin/env bash

bashrc='bashrc'

if [[ `uname` == "Linux" ]]; then
  bashrc='bash_profile'
fi

for file in *; do
  case $file in
    install\.sh|LICENSE|README\.md) ;;
    bashrc) cp $file ~/.$bashrc ;;
    *) cp $file ~/.$file;;
  esac
done
