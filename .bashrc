#
# ~/.bashrc
#
export EDITOR=/usr/bin/vim
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

alias vi='vim'

if command -v tmux>/dev/null; then
    [[ ! $TERM =~ screen ]] && [ -z $TMUX ] && exec tmux
fi

if [[ "$(tty)" = "/dev/tty1" ]]; then
	pgrep i3 || exec startx
fi

export DOTNET_ROOT=/opt/dotnet
