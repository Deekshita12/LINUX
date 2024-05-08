#!/bin/bash
# Add age 
echo -n "Enter your age:"
read age 

#Check eligibility 
if [ "$age -ge 18" ] 
then 
echo "You are eligible for voting"
else 
echo "You are not eligible for voting"
fi
