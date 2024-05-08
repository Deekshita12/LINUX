#!/bin/bash 

filename="hellooo.txt"

if [ ! -f "$filename" ]; then
	echo "File not found"
	exit 1
fi

#readind contents into the file 
file_contents=($(<"$filename"))

#display the contents
echo "contents of the file : $filename:"
for iteams in "${file_contents[@]}"; do
	echo "$iteams"
done

