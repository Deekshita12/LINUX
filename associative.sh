#!/bin/bash	
declare -A arr=( [name]=Deeksh [city]=mumbai [hobby]=sleeping )
arr[roll_no]=24
for key in ${!arr[@]}
do 
    	echo -n "key: $key"
	echo " value: ${arr[$key]}"
done
echo " value: ${arr[name]}"
echo " value: ${arr[city]}"
echo " value: ${arr[hobby]}"
echo
unset arr[hobby]
echo
#for key in ${!arr[@]}
#do 
#    	echo -n "key: $key"
#	echo " value: ${arr[$key]}"
#done
echo ${arr[*]}
#echo
#unset arr
