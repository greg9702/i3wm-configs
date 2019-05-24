#!/usr/bin/env bash

status=$(python2 /home/greg9702/.config/i3/Python_Server_scripts/isup.py)
if [ $status -eq 1 ] ; then
  touch /tmp/abc2
	ps -ef | grep python | grep -v grep | awk '{print $2}' | xargs kill
else
    pushd /home/greg9702/Server; python2 $HOME/.config/i3/Python_Server_scripts/SimpleHTTPServer.py
fi
