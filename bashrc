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

# '\e[0;30m' # Black - Regular
# '\e[0;31m' # Red
# '\e[0;32m' # Green
# '\e[0;33m' # Yellow
# '\e[0;34m' # Blue
# '\e[0;35m' # Purple
# '\e[0;36m' # Cyan
# '\e[0;37m' # White
# '\e[1;30m' # Black - Bold
# '\e[1;31m' # Red
# '\e[1;32m' # Green
# '\e[1;33m' # Yellow
# '\e[1;34m' # Blue
# '\e[1;35m' # Purple
# '\e[1;36m' # Cyan
# '\e[1;37m' # White
# '\e[4;30m' # Black - Underline
# '\e[4;31m' # Red
# '\e[4;32m' # Green
# '\e[4;33m' # Yellow
# '\e[4;34m' # Blue
# '\e[4;35m' # Purple
# '\e[4;36m' # Cyan
# '\e[4;37m' # White
# '\e[40m'   # Black - Background
# '\e[41m'   # Red
# '\e[42m'   # Green
# '\e[43m'   # Yellow
# '\e[44m'   # Blue
# '\e[45m'   # Purple
# '\e[46m'   # Cyan
# '\e[47m'   # White
# '\e[0m'    # Text Reset

# bash prompt
export PS1='\[\e[0;34m\]\u \[\e[0m\]> \[\e[0;32m\]\W\[\e[0;33m\]$(__git_ps1 " (%s)")\n\[\e[0m\]\$ '

# bash aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# stop tilde expansion
_expand()
{
    return 0;
}

# vim as default editor
export EDITOR='vim'
