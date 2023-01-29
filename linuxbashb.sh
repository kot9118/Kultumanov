#!/bin/bash
	if [[ -n "$1" && "$#" == 1 ]]; then
		fname=$1
		echo "Most requests from ip:"
			awk '{print $1}' $fname | sort | uniq -c | sort -nr | head -n 1 | awk '{print $2}'
		echo -e 'Most requested page:'
			awk '{print $7}' $fname | sort | uniq -c | sort -nr | head -n 1 | awk '{print $2}'
		echo -e 'Number of requests from each ip:'
			awk '{print $1}' $fname | sort | uniq -c | sort -nr
		echo -e 'List of non-existent pages:'
			grep '404' $fname | cut -d ' ' -f 7 | sort | uniq -c | sort -nr
		echo -e 'Time of most requests:'
			awk '{print $4}' $fname | sort | uniq -c | sort -nr | head -n 1
		echo -e 'List of search bots:'
			cat $fname | awk '{$2=$3=$4=$5=$6=$7=$8=$9=$10=$11=""; $0=$0; $1=$1; print}' | sort | uniq | grep bot
	else
		echo "Please choose file"	
	fi
