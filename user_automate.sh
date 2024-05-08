#!/bin/bash

txtred=$(tput setaf 1)
txtgrn=$(tput setaf 2)
txtylw=$(tput setaf 3)
txtblu=$(tput setaf 4)
txtpur=$(tput setaf 5)
txtcyn=$(tput setaf 6)
txtrst=$(tput sgr0)
COLUMNS=$(tput cols)

center() {
	w=$(( $COLUMNS / 2 - 20 ))
	while IFS= read -r line
	do
		printf "%${w}s %s\n" ' ' "$line"
	done
}

centerwide() {
	w=$(( $COLUMNS / 2 - 30 ))
	while IFS= read -r line
	do
		printf "%${w}s %s\n" ' ' "$line"
	done
}

#Creating user
create_user(){
	read -p "${txtblu} Enter username to be created: ${txtrst}" username
if id "$username" &>/dev/null;then
	echo "${txtylw}User $username already exists ${txtrst}"|center
	echo
else
	useradd $username
	echo "${txtgrn}User $username created successfully ${txtrst}"|center
fi
}
	
#changing group for user
change_group(){
        echo "${txtred}NO SPECIAL CHARACTERS OR SPACES ${txtrst}"|center
	read -p "Enter username:   "  username
	read -p "Enter group name:"  groupname
if id "$username" &>/dev/null; then
	if grep -q "^$groupname:" /etc/group ; then
		usermod -g $groupname $username
		echo "${txtgrn}Group chnaged successfully for user $username ${txtrst}"|center 
	else
		echo "${txtylw}Group $groupname does not exist ${txtrst}"|center
	fi
else
	usermod -g $username $groupname 
	echo "${txtgrn}Group changed successfully for user $username ${txtrst}"|center
fi
}

#Creating group
create_group(){
	read -p "Enter groupname to be created:" groupname
if grep -q "^$groupname:" /etc/group ; then
	echo "${txtylw}Group $ugroupname already exists ${txtrst}"|center
	echo
else
	groupadd $groupname
fi
}
#To check passwd status
check_passwd_status(){
	echo "${txtylw}USE COMBINATION OF CAPITAL ,SMALL ,NUMBERS AND SPECIAL CHARACTERS TO CREATE A STRONG PASSWORD ${txtrst}"|centerwide
	read -p "Enter username to change password :" username
if id "$username" &>/dev/null;then
	passwd $username
else
	echo "${txtred}User $username does not exist ${txtrst}"|center
fi

	
}
#To change password
change_passwd(){
read -p " Enter username: " username
if id "$username" &>/dev/null;then
	passwd  $username
		if [ $? -eq 0 ];then
		echo "${txtgrn} Password for $username chnaged successfully ${txtrst}"
		else
		echo "${txtred} Failed to change password for $username ${txtrst}"
		fi
		
		passwd -S $username | grep -q "WEAK"
		if [ $? -eq 0 ];then
		echo " ${txtpur} Password fo $username is weak ${txtrst}"
		fi
		
else
	echo "User $username does not exist"
fi		
}
#To lock user
lock_user(){
	read -p "Enter username to be locked :" username 
	usermod -L $username 
	echo "${txtgrn} User $username locked successfully ${txtrst} "|center
}
#To Unlock user
unlock_user(){
	read -p "Enter username to be unlocked :" username 
	usermod -U $username 
	echo "${txtgrn}User $username unlocked successfully ${txtrst} "|center
}
#To Delete user
delete_user() {
    read -p "Enter username to be deleted: " username
    if id "$username" &>/dev/null; then
        read -p "Are you sure you want to delete this user $username and associated files (Y/N): " confirm
        if [[ "$confirm" == "Y" || "$confirm" == "y" ]]; then
            sudo userdel -r "$username"
            echo "User $username deleted successfully"
        else
            echo "Deletion cancelled"
        fi
    else
        echo "User $username does not exist"
    fi
}


Exit() {
        echo "Exiting the script"
	exit 0	
}
# Purpose - Display a menu on screen
while :
do

clear
date
echo "---------------------------"|center
echo "         Main Menu "| center
echo "---------------------------"|center
echo "${txtcyn}1. Create a user${txtcyn}"| center 
echo "${txtcyn}2. Change the group for user${txtcyn}"| center
echo "${txtcyn}3. Create a group${txtcyn}"| center
echo "${txtcyn}4. Check password status${txtcyn}"| center
echo "${txtcyn}5. Change password${txtcyn}"| center
echo "${txtcyn}6. Lock user account${txtcyn}"| center
echo "${txtcyn}7. Unlock user account${txtcyn}"| center
echo "${txtcyn}8. Delete user${txtcyn}"| center
echo "${txtred}9. Exit ${txtred}"| center
read -p "${txtgrn} Please enter the number of your selection ${txtrst}" choice

case $choice in
	1)create_user;;
	2)change_group;;
	3)create_group;;
	4)check_passwd_status;;
	5)change_passwd;;
	6)lock_user;;
	7)unlock_user;;
	8)delete_user;;
	9)Exit;;
	*)echo "Invalid choice:Please select a valid option...";;
esac

read -p "${txtrst}Press enter to continue ${txtrst}"

done 
 
