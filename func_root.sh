#!/bin/bash
check_root(){
if [[ "$(id -u)" -ne 0 ]];then
	echo "you are not root"
	exit 1
fi
}
check_root
echo "you are root"


