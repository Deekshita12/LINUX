#!/bin/bash

user_add(){
read -p "Enter the useranme to be created" username
if id "$username"&>/dev/null;then
	echo "$username already exists"
else
	useradd "$username"
	echo "$username created successfully"
fi
}
group_add(){

read -p "enter username" username
read -p "group name " groupname
if id "$username" &>/dev/null;then
	if grep -q "^$groupname:" /etc/group;then
 		usermod -g "$username" "$groupname" 
		echo "group changes successfully for $username"
	else
		echo "$groupname does not exists"

	fi 
fi  
}


echo "SELECT AN OPTION"
echo "a.add a user"
echo "b.change a group of user"
read -p "mAKE a valid choice " choice

if [[ "$choice" == "a" ]];then
	user_add
elif [[ "$choice" == "b" ]]; then
	group_add
else
	echo "invalid"
fi
