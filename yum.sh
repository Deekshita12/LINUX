#!/bin/bash
install_package(){
read -p "Enter the package to be installed " package 
yum install $package 
echo "$package installed sucessfully"
}
check_info(){
read -p "Enter the package name to get info" check
yum info $check
echo "Displayed successfully"
}
echo "Select a/b"
echo "a.To isntall a package"
echo "b.To get info of package"
read -p "make va lid selecction" choice

if [[ "$choice" == "a" ]];then
	install_package
elif [[ "$choice" == "b" ]];then
	check_info
else
	echo "make a valid selection"
fi 
