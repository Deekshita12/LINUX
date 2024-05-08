#!/bin/bash

echo "Enter a city name:"
read city

case "$city" in
    "Mumbai" | "Delhi" | "Pune")
        echo "The country is India"
        ;;
    "London" | "Manchester" | "Birmingham")
        echo "The country is United Kingdom"
        ;;
    "Paris" | "Marseille" | "Lyon")
        echo "The country is France"
        ;;
    "New York" | "Los Angeles" | "Chicago")
        echo "The country is United States"
        ;;
    *)
        echo "To be added soon!"
        ;;
esac

