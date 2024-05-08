#!/bin/bash

declare -A beatless=(
	[singer]="Arjit Singh"
	[bassist]="Jayen Varma" 
	[guitarist]="Darshan Raval"
	[drummer]="Zakir Hussain"
)
echo "Original array:"
for role in "${!beatless[@]}"; do
	echo "$role : ${beatless[$role]}"
done

# delete guitarist
unset beatless[guitarist]
echo "Updated array:"
for role in "${!beatless[@]}"; do
	echo "$role : ${beatless[$role]}"
done
