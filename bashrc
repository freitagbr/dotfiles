# bashrc
# Brandon Freitag, 2018

# load shell scripts
load() {
  if [ -f "$1" ]; then
    . "$1"
  fi
}

# enable ** recursive dir globbing
shopt -s globstar

# terminal
export TERM=xterm-256color

# terminal colors
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# vim
export EDITOR="vim"

# gpg
export GPG_TTY="$(tty)"

# go
export GOPATH="$HOME/src/go"
export GOROOT=/usr/local/opt/go/libexec
export PATH="$GOROOT/bin:$PATH"

# rust
export PATH="$HOME/.cargo/bin:$PATH"

# haskell
export PATH="$HOME/.cabal/bin:$PATH"

# bash aliases
load "$HOME/.bash_aliases"

# bash colors
load "$HOME/.bash_colors"

# homebrew api token
load "$HOME/.homebrew_api_token"

# git bash completion
load "$(brew --prefix)/etc/bash_completion"

# git prompt
load /usr/local/etc/bash_completion.d/git-prompt.sh

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# prompt
export PS1='$(git branch &>/dev/null;\
if [ $? -eq 0 ]; then \
    echo "$(echo `git status` | grep "nothing to commit" > /dev/null 2>&1; \
    if [ "$?" -eq "0" ]; then \
        # clean repo, nothing to commit
        echo "'$Yellow$Path$Green'"$(__git_ps1 " (%s)"); \
    else \
        # changes to working tree
        echo "'$Yellow$Path$Red'"$(__git_ps1 " [%s]"); \
    fi) '$Reset'\$ "; \
else \
    # prompt when not in git repo
    echo "'$Path' \$ "; \
fi)'

# stop tilde expansion
_expand() {
  return 0;
}

# fix git typos
# i.e. turn gi t<cmd> into git <cmd>
gi() {
  args=("$@")
  args[0]="${args[0]/t/}"
  git "${args[@]}"
}
