#!/bin/bash

perform_operation() {
    case "$operation" in
        "add")
            result=$(echo "$num1 + $num2" | bc)
            ;;
        "subtract")
            result=$(echo "$num1 - $num2" | bc)
            ;;
        "multiply")
            result=$(echo "$num1 * $num2" | bc)
            ;;
        "divide")
            if [ "$num2" -eq 0 ]; then
                echo "Error: Division by zero is not allowed."
                exit 1
            fi
            result=$(echo "scale=2; $num1 / $num2" | bc)
            ;;
        "exponentiate")
            result=$(echo "$num1 ^ $num2" | bc)
            ;;
        *)
            echo "Invalid operation. Please choose add, subtract, multiply, divide, or exponentiate."
            exit 1
            ;;
    esac
}

echo "Enter the first number:"
read num1
echo "Enter the second number:"
read num2
echo "Enter the arithmetic operation (add/subtract/multiply/divide/exponentiate):"
read operation

perform_operation

echo "Result of $operation: $result"

