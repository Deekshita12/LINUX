#!/bin/bash

#define an array
linux_flavors=( "Ubuntu" "Debian" "Fedora" "Manjaro" "Linux Mint" "CentOS" "Kali Linux" )

#user to take index input
echo -n "Enter index of the Linux OS you want to display:"
read index

if [ "$index" -ge 0 ] && [ "$index" -lt "${#linux_flavors[@]}" ]; then
	echo "Linux OS flavour at index $index: ${linux_flavors[index]}"
else
	echo " Error: Index out of range " 
fi 

#Enter the start location
echo " Enter the start location "
read start

#enter the last location
echo  " Enter the last location"
read  last

#start and last locations are appropriate
if [ "$start" -lt 0 ] || [ "$last" -ge "${#linux_flavors[@]}" ] || [ "$start" -gt "$last" ]; then 
	echo "Start or last location is inappropriate"
	exit 1
fi

echo "Linux OS flavours start from index $index ; start $start to last $last:"
for ((i=start ; i<=last ; i++)); do
	echo " ${linux_flavors[index]}[$i] : ${linux_flavors[i]}"
done

