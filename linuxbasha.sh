#!/bin/bash
	if [[ "$1" = "--all" ]]; then
	sl=$(ip route | grep -Ev 'default' | awk '{print $1}')
            for sn in $sl; do
		nmap -sn --open $sn | grep "Nmap scan report for" | awk '{print $5 $6}'
            done
	elif [[ "$1" = "--target" ]]; then
		netstat -tlnp
	elif [[ "$1" = "--help" ]]; then
		echo -e 'Please choise an option:\n --all - diplays the IP addresses and symlbolic names of all hosts in the current subnet\n --target - displays a list of open TCP ports'
	else
		echo 'Try --help for more information'
	fi
