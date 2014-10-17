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

# misc aliases
alias sshy='ssh -Y'
alias e='emacs -nw'
alias oc='/home/dcsommer/Documents/the-omega-project/omega_calc/obj/oc'

alias go='gnome-open'

# git
alias gb='git branch'
alias gsno='git show --name-only'
alias gri='git rebase -i'

# git aliases
git config --global alias.lg "log --color --graph \
--pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset \
%s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --"
