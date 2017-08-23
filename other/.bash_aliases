#!/bin/bash

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# navigation shortcuts
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias .......='cd ../../../../../..'
alias ........='cd ../../../../../../..'

# misc aliases
alias sshy='ssh -Y'
alias e='emacs -nw'

# hg
alias hgca='hg commit --amend -M .'
alias hgsno='hg status --rev .~1:.'

# git
alias gb='git branch'
alias gsno='git show --name-only'
alias gri='git rebase -i'
alias gca='git commit -a --amend --no-edit'
alias gl='git lg'
alias gcom='git checkout origin/master'
alias gf='git fetch; git rebase origin/master'

# git aliases
git config --global alias.lg "log --color --graph \
--pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset \
%s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --"

# git setup stuff
function gitinit {
    mkdir $1
    cd $1
    git init
    git commit --allow-empty -m 'Initial empty commit'
}

alias clbin="curl -F 'clbin=<-' https://clbin.com | tee /dev/tty | xclip"
