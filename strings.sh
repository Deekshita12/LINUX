#!/bin/bash 
# Accepting two strings from users
echo "Enter the first string"
read str1
echo "Enter the second string"
read str2
if [ "$str1" = "$str2" ]
then 
echo "The two strings are the same."
else
echo "The two strings are not the same."
fi
