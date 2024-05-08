#!/bin/bash
echo "Enter temp in celcius"
read celcius
fah=$(echo "scale=2; ($celcius * 9/5) + 32" | bc)
echo "temp in farhaneit: $fah F"
