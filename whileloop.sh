#!/bin/bash

if [ $# -eq 0 ]
then 
	echo "Error : Please provide number on command line"
	exit 1 
fi

input_no=$1

rev=0

while [ "input_no" -ge 0 ]; do
	digit=$((input_no % 10))
	rev=$((input_no*10+digit))
	input_no=$((input_no/ 10))
	done
echo "Reversed no: $rev"
