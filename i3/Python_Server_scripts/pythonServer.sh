#!/bin/bash

status=$(python2 isup.py)
cd ~/Server
if [ $status -eq 1 ] ; then
    server_pid=$(top -b -n 1 | grep python$ | awk '{print $1}')
    kill -2 $server_pid
else
    python -m SimpleHTTPServer 8000
fi
