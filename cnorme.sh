#!/bin/sh

norminette $@ |
while read line
do
	result=`echo $line | grep -e "^Norme: "`
	if [ -z "$result" ]
	then
		echo "\t$line" | sed s/Error/`printf "\033[31mError\033[39m/"` | sed s/Warning/`printf "\033[33mError\033[39m/"`
	else
		echo "$line"
	fi
done
