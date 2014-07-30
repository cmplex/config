#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ ${-} = *i* ]] || return

shopt -s checkwinsize

# ls aliases
alias ls='ls --color=auto'
alias l='ls'
alias la='ls -a'
alias ll='ls -l'
alias s='du -hs'

# grep aliases
alias rgrep='grep --color -R'
alias igrep='grep -i'

# other handy shell aliases
alias s='du -hs'

# shell prompt
export PS1="\[$(tput setaf 5)\]\u\[$(tput setaf 7)\]@\[$(tput setaf 5)\]\h \[$(tput bold)\]\[$(tput setaf 6)\]\W \[$(tput setaf 7)\]> \[$(tput sgr0)\]"
