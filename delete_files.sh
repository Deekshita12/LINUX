#!/bin/bash
if [ $# -lt 2 ]; then
    echo "Usage: $0 [--create | --delete] <filename>"
    exit 1
fi
action=$1
filename=$2
case "$action" in
    "--create")
        touch "$filename"
        echo "Created file: $filename"
        ;;
    "--delete")
        if [ -f "$filename" ]; then
            rm "$filename"
            echo "Deleted file: $filename"
        else
            echo "File $filename does not exist."
        fi
        ;;
    *)
        echo "Not a valid argument. Usage: $0 [--create | --delete] <filename>"
        ;;
esac

