#!/bin/bash
echo "Enter a list of strings"
read -r input_str

rev_string=$(awk '{ for(i=NF;i>=1;i--) printf "%s ", $i; printf"\n" }'<<<"$input_str")
echo "Reversed Sring : $rev_string" 
