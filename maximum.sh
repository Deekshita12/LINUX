#!/bin/bash 
echo "Enter Num1"
read x
echo "Enter Num2"
read y 
echo "Enter Num3"
read z
if [ $x -gt $y ] && [ $x -gt $z ] 
then 
echo "$x is maximum"
elif [ $y -gt $x ] && [ $y -gt $z ]
then 
echo "$y is maximum"
else 
echo "$z is maximum" 
fi
