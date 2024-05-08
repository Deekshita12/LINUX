#!/bin/bash


machine()
{
	echo -e "\n Machine info:"; uname -a
	echo -e "Users logged in:"; w
	echo -e "\n Taday:"; date
	echo -e "\n Machine Status:"; uptime
	echo -e "\n Memory Status:"; free
	echo -e "\n Filesystem:"; df
}

machine
