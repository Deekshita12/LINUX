#!/bin/bash

#define an array
linux_flavors=("Ubuntu" "Debian" "Fedora" "Manjaro" "Linux Mint" "CentOS" "Kali Linux")

#user to take index input
echo -n "Enter index of the Linux OS you want to display:"
read index

if [ "$index" -ge 0 ] && [ "$index" -lt "${#linux_flavors[@]}" ]; then
	echo "Linux OS flavour at index $index: ${linux_flavors[index]}"
else
	echo " Error: Index out of range " 
fi 
