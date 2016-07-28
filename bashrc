# terminal colors
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# git bash completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

# git prompt
if [ -f /usr/local/etc/bash_completion.d/git-prompt.sh ]; then
    . /usr/local/etc/bash_completion.d/git-prompt.sh
fi

# nvm
if [ -f `brew --prefix nvm`/nvm.sh ]; then
    . `brew --prefix nvm`/nvm.sh
fi

# go
export GOPATH=$HOME/src/go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOROOT/bin

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
export PS1=$Blue$User' $(git branch &>/dev/null;\
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
    echo "'$Reset$Path' \$ "; \
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
