# bash aliases
if [ -f "$HOME/.bash_aliases" ]; then
  . "$HOME/.bash_aliases"
fi

# bash colors
if [ -f "$HOME/.bash_colors" ]; then
  . "$HOME/.bash_colors"
fi

# git bash completion
if [ -f "$(brew --prefix)/etc/bash_completion" ]; then
  . "$(brew --prefix)/etc/bash_completion"
fi

# git prompt
if [ -f /usr/local/etc/bash_completion.d/git-prompt.sh ]; then
  . /usr/local/etc/bash_completion.d/git-prompt.sh
fi

# enable ** recursive dir globbing
shopt -s globstar

# terminal colors
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# vim
export EDITOR="vim"

# gpg
export GPG_TTY="$(tty)"

# prompt
export PS1="\w \$ "

# stop tilde expansion
_expand() {
  return 0
}

# fix git typos
# i.e. turn gi t<cmd> into git <cmd>
gi() {
  args=("$@")
  args[0]="${args[0]/t/}"
  git "${args[@]}"
}
