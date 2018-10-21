#!/usr/bin/env bash

status=$(python2 /home/greg9702/.config/i3/Python_Server_scripts/isup.py)
if [ $status -eq 1 ] ; then
  touch /tmp/abc2
    server_pid=$(top -b -n 1 | grep [p]ython$ | awk '{print $1}')
    kill -9 $server_pid
else
    pushd /home/greg9702/Server; python -m SimpleHTTPServer 8000
fi
