#!/bin/bash
echo "Enter first no:"
read x
echo "Enter second no:"
read y
echo "Enter third no:"
read z
if [ $x -ge $y ] && [ $x -ge $z ]  
	then
		echo " $x is greater "
elif [ $y -ge $x ] && [ $y -ge $z ]  
	then
		echo " $y is greater "
else 
		echo " $z is greater "
fi		

