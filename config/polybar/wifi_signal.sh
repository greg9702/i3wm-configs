#!/bin/bash

nmcli dev wifi | awk {'print $7'} | head -2 | tail -1
