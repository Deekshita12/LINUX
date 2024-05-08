#!/bin/bash 
total_marks=$(( $1 + $2 + $3 ))
average_marks=$(( $total_marks / 3 ))
calculate_marks()
if [ $average_marks -gt75 ] 
then 
echo "Distinction"
elif [ $average_marks -gt60 ]
then 
echo "First Class"
elif [ $average_marks -gt50 ]
then 
echo "Second Class"
elif [ $average_marks -gt35 ]
then 
echo "Third Class"
else 
echo "Failed"
fi

# Entering marks of three subjects
determine_class()
echo "Enter marks for Physics"
read physics 
echo "Enter marks for Chemistry"
read chemistry 
echo "Enter marks for Mathematics"
read Mathemetics 

# Check if any subject >35 
if [ $physics -lt35 ] && [ $chemistry -lt35 ] && [ $mathematics -lt35] 
then 
echo "Failed"
else 
calculate_marks $physics $chemsitry $mathematics 
echo "Total Marks: $total_marks"
echo "Average Marks: $average_marks"
determine_class
fi  
