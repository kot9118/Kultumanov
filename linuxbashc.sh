#!/bin/bash
	echo "Please input path to source directory"
		read source
	echo "Please input path to backup directory"
		read backup
	rsync -arbc --info=BACKUP,MISC,NAME2,REMOVE $source $backup --log-file=./backup.log
