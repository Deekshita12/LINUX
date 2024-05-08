#!/bin/bash

if [ $# -eq 0 ]
then
echo "Error: Please provide a number as a command line argument."
exit 1
fi

input_number=$1

reverse=0

while [ "$input_number" -gt 0 ]
do
digit=$((input_number % 10))
reverse=$((reverse * 10 + digit))
input_number=$((input_number / 10))
done

echo "Reversed Number: $reverse"
