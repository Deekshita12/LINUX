#!/bin/bash
x=1
y=1

change() {
	local x=2
	y=2
 }
echo "Before calling the function"
echo "x= $x"
echo "y= $y"

change

echo "After calling the function"
echo "x= $x"
echo "y= $y"
