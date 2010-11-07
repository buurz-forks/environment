export HISTCONTROL=ignoredups
shopt -s histappend

shopt -s checkwinsize

[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

TERM=xterm-256color

format_git_branch() {
    if [ -n "$(__gitdir)" ]; then
        if [ "`git stash list`" ]; then
            local stash=" (s`git stash list | wc -l`)"
        fi
        local branch=`git current-branch`
        if [ "$branch" -a "$branch" != 'master' ]; then
            echo " $branch$stash"
        else
            echo "$stash"
        fi
    fi
}

PS1="\[\e[0;34m\]\w\[\e[0m\]\$(format_git_branch) ➜ "
if [ "$SSH_CLIENT" ]; then
    PS1="\h $PS1"
fi

eval "`dircolors -b`"
alias ls='ls --color=auto'
alias grep='grep --color=auto'

if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

if [ -d ~/Скрипты ]; then
    SCRIPT_DIR='~/Скрипты'
else
    SCRIPT_DIR='~/scripts'
fi

PATH="$PATH:$SCRIPT_DIR"

if [[ -d ~/Разработка ]]; then CDPATH='.:~/Разработка'; fi


alias ll='ls -lh'
alias la='ls -A'
alias ps?='ps -A | grep '
alias ..='cd ..'
alias св='cd'

export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

if [ -d ~/.gem/ ]; then
    alias rake1.9.2='~/.gem/ruby/1.9.2/bin/rake'
    PATH="$PATH:~/.gem/ruby/1.8/bin:~/.gem/ruby/1.9.2/bin"
fi
