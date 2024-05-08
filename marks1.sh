#!/bin/bash

calculate_class() {
if (( $(echo "$average_marks >= 75" | bc -l) ))
then
echo "Distinction"
elif (( $(echo "$average_marks >= 60" | bc -l) && $(echo "$average_marks < 75" | bc -l) ))
then
echo "First Class"
elif (( $(echo "$average_marks >= 50" | bc -l) && $(echo "$average_marks < 60" | bc -l) ))
then
echo "Second Class"
elif (( $(echo "$average_marks >= 35" | bc -l) && $(echo "$average_marks < 50" | bc -l) ))
then
echo "Third Class"
else
echo "Failed"
fi
}

echo -n "Enter marks for Physics: "
read physics_marks

echo -n "Enter marks for Chemistry: "
read chemistry_marks

echo -n "Enter marks for Mathematics: "
read math_marks

total_marks=$((physics_marks + chemistry_marks + math_marks))



average_marks=$(echo "scale=2; $total_marks / 3" | bc)


echo "Total Marks: $total_marks"
echo "Average Marks: $average_marks"

# Checking if any course has les >35 marks
if [ "$physics_marks" -lt 35 ] || [ "$chemistry_marks" -lt 35 ] || [ "$math_marks" -lt 35 ]
then
echo "Failed"
else
    
class=$(calculate_class)
echo "Class: $class"
fi
