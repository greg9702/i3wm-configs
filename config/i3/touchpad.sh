#!/bin/bash

#dev_id stores id of Touchpad prop
#nscrollen_id stores id of Natural Scrolling Enabled prop
#tapen_id stores id of Tapping Enabled prop       

dev_id=$(xinput | grep Touch | cut -d= -f2 | cut -f1)
nscrollen_id=$(xinput list-props $dev_id | grep "Natural Scrolling Enabled (" | cut -d"(" -f2 | cut -d")" -f1)
tapen_id=$(xinput list-props $dev_id | grep "Tapping Enabled (" | cut -d"(" -f2 | cut -d")" -f1)

#echo $dev_id
#echo $nscrollen_id
#echo $tapen_id

xinput set-prop $dev_id $nscrollen_id 1
xinput set-prop $dev_id $tapen_id 1
