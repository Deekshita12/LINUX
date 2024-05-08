#!/bin/bash

#declaring the arrays
arr1=("Asia" "Europe" "Africa")
arr2=("South America" "North America" "Antartica" "Australia")

#array concatenate
arr3=("${arr1[@]}" "${arr2[@]}")

echo "First array: ${arr1[@]}"
echo "Second array: ${arr2[@]}"
echo "Concatenated array: ${arr3[@]}"

