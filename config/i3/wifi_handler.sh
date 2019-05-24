#!/bin/bash

# dmenu_run - show system menu

# echo -e "first\nsecond\nthird" | dmenu
#	show first two three in dmenu
#echo -e "one\ntwo\nthree" | dmenu -l 3
#echo $(nmcli radio wifi) | dmenu
#dmenu_run -fn "-xos4-terminus-medium-r-*-*-14-*"

#############################################

wifi_state=$(nmcli radio wifi)


if [ "$wifi_state" == "disabled" ]
then
	action=$(echo -e  "WIFI" "$wifi_state\nenable" | dmenu -l 20)
fi

if [ "$wifi_state" == "enabled" ]
then
	action=$(echo -e  "WIFI" "$wifi_state\ndisable\nshow networks" | dmenu -l 20)
fi

if [ "$action" == "enable" ]
then
	nmcli radio wifi on
fi

if [ "$action" == "disable" ]
then
	nmcli radio wifi off
fi

if [ "$action" == "show networks" ]
then

	chosen=""
	chosen=$(echo -e "$(nmcli dev wifi)" |  dmenu -l 10)
	chosen_SSID=$(echo -e $chosen | awk -F "Infra" '{print $1}' | sed 's/ *$//')
	echo $chosen
	echo "$chosen_SSID"

	#conn_state=""
	connected_to=$(nmcli -t -f active,ssid dev wifi | egrep '^yes' | cut -d':' -f2)

	#if [ "$chosen_SSID" != connected_to ]
	#then
	#	conn_state="disc"
	#else
	#	conn_state="con"
	#fi

	operation=$(echo -e "$chosen\nconnect\ndisconnect" | dmenu -l 3)

	#if [ "$conn_state" == "con" ]
	#then
	#operation=$(echo -e "$chosen\ndisconnect" | dmenu -l 3)
	#fi

	if [ "$chosen" != "" ] #TODO fix this
	then

		if [ "$operation" == "connect" ]
		then
		try=$(nmcli dev wifi con "$chosen_SSID" | awk '{print $1}')
		echo $try
			if [ "$try" == "Error:" ];
			then
			pass=$(echo -e "Enter password" | dmenu -l 2)
			echo $pass
			nmcli dev wifi con "$chosen_SSID" password "$pass"
			fi
		fi

		if [ "$operation" == "disconnect" ]
		then
		nmcli con down id "$connected_to"
		fi
	fi
fi
