#!/bin/bash

echo "Enter a string:"
read input_string

reversed_string=$(echo "$input_string" | rev)

echo "Reversed string: $reversed_string"

