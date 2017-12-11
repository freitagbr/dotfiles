# enable ** recursive dir globbing
shopt -s globstar

# terminal
export TERM=xterm-256color

# terminal colors
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# go
export GOPATH=$HOME/src/go
export GOROOT=/usr/local/opt/go/libexec
export PATH="$GOROOT/bin:$PATH"

# rust
export PATH="$HOME/.cargo/bin:$PATH"

# haskell
export PATH="$HOME/.cabal/bin:$PATH"

# git bash completion
GIT_BASH_COMPLETION=`brew --prefix`/etc/bash_completion
if [ -f $GIT_BASH_COMPLETION ]; then
    . $GIT_BASH_COMPLETION
fi

# git prompt
GIT_PROMPT=/usr/local/etc/bash_completion.d/git-prompt.sh
if [ -f $GIT_PROMPT ]; then
    . $GIT_PROMPT
fi

# nvm
export NVM_DIR="/Users/${USER}/.nvm"
[ -s "${NVM_DIR}/nvm.sh" ] && \. "${NVM_DIR}/nvm.sh"

# bash aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# bash colors
if [ -f ~/.bash_colors ]; then
    . ~/.bash_colors
fi

# homebrew api token
if [ -f ~/.homebrew_api_token ]; then
    . ~/.homebrew_api_token
fi

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
    args[0]=${args[0]/t/}
    git "${args[@]}"
}

# vim as default editor
export EDITOR='vim'
