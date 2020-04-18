#
# ~/.bash_profile
#

if [[ "$(tty)" = "/dev/tty1" ]]; then
	pgrep i3 || exec startx
fi

PATH=$PATH:~/.local/bin
