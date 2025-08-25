#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
fastfetch

eval "$(starship init bash)"
source /usr/share/nvm/init-nvm.sh

alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'
