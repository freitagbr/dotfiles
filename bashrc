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

# reset
Reset="\[\033[0m\]"

# regular colors
Black="\[\033[0;30m\]"
Red="\[\033[0;31m\]"
Green="\[\033[0;32m\]"
Yellow="\[\033[0;33m\]"
Blue="\[\033[0;34m\]"
Purple="\[\033[0;35m\]"
Cyan="\[\033[0;36m\]"
White="\[\033[0;37m\]"

# bold
BBlack="\[\033[1;30m\]"
BRed="\[\033[1;31m\]"
BGreen="\[\033[1;32m\]"
BYellow="\[\033[1;33m\]"
BBlue="\[\033[1;34m\]"
BPurple="\[\033[1;35m\]"
BCyan="\[\033[1;36m\]"
BWhite="\[\033[1;37m\]"

# underline
UBlack="\[\033[4;30m\]"
URed="\[\033[4;31m\]"
UGreen="\[\033[4;32m\]"
UYellow="\[\033[4;33m\]"
UBlue="\[\033[4;34m\]"
UPurple="\[\033[4;35m\]"
UCyan="\[\033[4;36m\]"
UWhite="\[\033[4;37m\]"

# background
On_Black="\[\033[40m\]"
On_Red="\[\033[41m\]"
On_Green="\[\033[42m\]"
On_Yellow="\[\033[43m\]"
On_Blue="\[\033[44m\]"
On_Purple="\[\033[45m\]"
On_Cyan="\[\033[46m\]"
On_White="\[\033[47m\]"

# high intensty
IBlack="\[\033[0;90m\]"
IRed="\[\033[0;91m\]"
IGreen="\[\033[0;92m\]"
IYellow="\[\033[0;93m\]"
IBlue="\[\033[0;94m\]"
IPurple="\[\033[0;95m\]"
ICyan="\[\033[0;96m\]"
IWhite="\[\033[0;97m\]"

# bold high intensty
BIBlack="\[\033[1;90m\]"
BIRed="\[\033[1;91m\]"
BIGreen="\[\033[1;92m\]"
BIYellow="\[\033[1;93m\]"
BIBlue="\[\033[1;94m\]"
BIPurple="\[\033[1;95m\]"
BICyan="\[\033[1;96m\]"
BIWhite="\[\033[1;97m\]"

# high intensty backgrounds
On_IBlack="\[\033[0;100m\]"
On_IRed="\[\033[0;101m\]"
On_IGreen="\[\033[0;102m\]"
On_IYellow="\[\033[0;103m\]"
On_IBlue="\[\033[0;104m\]"
On_IPurple="\[\033[10;95m\]"
On_ICyan="\[\033[0;106m\]"
On_IWhite="\[\033[0;107m\]"

# prompt strings
User="\u"
Path="\w"

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
    fi) '$Reset'\n\$ "; \
else \
    # prompt when not in git repo
    echo "'$Reset$Path'\n\$ "; \
fi)'

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
