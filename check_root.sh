#!/bin/bash

checkuser()
{
	if [ $(whoami) == root ]
	then 
		echo "Helloooo!! welcome to machine"
		exit 1 

	fi 

	echo "Helllooo $(whoami), You dont have permissions to run"
	exit 0 
}
checkuser
