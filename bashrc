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

# bash aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# bash colors
if [ -f ~/.bash_colors ]; then
    . ~/.bash_colors
fi

# prompt
export PS1=$Blue$User' $(git branch &>/dev/null;\
if [ $? -eq 0 ]; then \
    echo "$(echo `git status` | grep "nothing to commit" > /dev/null 2>&1; \
    if [ "$?" -eq "0" ]; then \
        # clean repo, nothing to commit
        echo "'$Yellow$Path$Cyan'"$(__git_ps1 " (%s)"); \
    else \
        # changes to working tree
        echo "'$Yellow$Path$Red'"$(__git_ps1 " [%s]"); \
    fi) '$Reset'\n\$ "; \
else \
    # prompt when not in git repo
    echo "'$Reset$Path'\n\$ "; \
fi)'

# stop tilde expansion
_expand()
{
    return 0;
}

# vim as default editor
export EDITOR='vim'
