#!/bin/bash
user_add(){
read -p "enter the user to be ceated " username 
if id "$username"&>/dev/null; then
	echo "$username already exists"
else
useradd $username
echo "$username created successfully "
fi 
}
group_ch(){
read -p "enetr username" username 
read -p "enter group " groupname
if id "$username"&>/dev/null; then
if grep "^-$groupname:" /etc/group;then
	usermod -g "$groupname" "$username"
	echo "$username change the group to $groupname "
else
	echo "group already exists"
fi
fi
}
echo "selsctr any"
echo "a.add ueser"
echo "b.chnage group"
read -p "make a vlaid selection:" choice

if [[ "$choice" == "a" ]];then
	user_add
elif [[ "$choice" == "b" ]];then
	group_ch
else
echo "invalid"
fi 

