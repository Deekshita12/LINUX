#!/bin/bash
bold=$(tput bold)
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

# Function to display yum commands/options
function display_yum_commands() {
    #yum help
    if man yum &>/dev/null; then
        man yum
        echo "${txtgrn}Command displayed successfully.${txtrst}"|center
    else
        echo "${txtred}Cannot display yum commands.${txtrst}"|center
    fi
}

# Function to display available packages
function display_available_packages() {
    # yum list available
    if packages=$(yum list available); then
        echo "$packages"
        echo "${txtgrn}Packages displayed successfully.${txtrst}"|center
    else
        echo "${txtred}Failed to display packages.${txtrst}"|center
    fi
}

# Function to display installed packages
function display_installed_packages() {
    read -p "Enter package name: " package
    if yum list installed "$package" &>/dev/null; then
        echo "${txtgrn}Package '$package' is already installed.${txtrst}" | center
    else
        read -p "Package '$package' is not installed. Do you want to install it? (y/n): " confirm
        if [[ $confirm == "y" || $confirm == "Y" ]]; then
            if yum install -y "$package" &>/dev/null; then
                echo "${txtgrn}Package '$package' installed successfully.${txtrst}" | center
            else
                echo "${txtred}Failed to install package '$package'.${txtrst}" | center
            fi
        else
            echo "${txtylw}Package installation cancelled.${txtrst}" | center
        fi
    fi
}


# Function to display package information
function display_package_info() {
    #yum list available
    packages=$(yum list available | awk '{print $1}')
    if [[ -n "$packages" ]]; then
        echo "Available packages:"
        echo "$packages"
        echo "------------------------------------"
        echo "Attempting to install packages..."
        echo "------------------------------------"
        success_count=0
        failed_count=0
        for package in $packages; do
            display_installed_packages "$package"
            if yum list installed "$package" &>/dev/null; then
                ((success_count++))
            else
                ((failed_count++))
            fi
        done
        echo "------------------------------------"
        echo "Installation summary:"
        echo "${txtgrn}Successful installations: $success_count ${txtrst}"|centerwide
        echo "${txtred}Failed installations: $failed_count ${txtrst}"|center
    else
        echo "${txtred}No available packages found.${txtrst}"|center
    fi
}

# Function to find a package
function find_package() {
    read -p "${txtylw}Enter search keyword: ${txtrst}" keyword|center
	if    search_result=$(yum search all "$keyword")|center;then
		echo "${txtgrn}Package found successfully${txtrst}"|center
	else
echo "${txtred}Package not found${txtrst}"|center				
	fi
  #  echo "Search result: $search_result"  # Debug statement
}


# Function to check yum history
function check_yum_history() {
    if history=$(yum history); then
        echo "$history"
        echo "${txtgrn}Yum history displayed successfully.${txtrst}"|center
    else
        echo "${txtred}Failed to display yum history. ${txtrst}"|center
    fi
}

# Function to install a package
function install_package() {
    read -p "${txtylw}Enter package name to install: ${txtrst}" package
    read -p "${txtblu}Are you sure you want to install the package '$package'? (y/n): ${txtrst} " confirm
    if [[ $confirm == "y" || $confirm == "Y" ]]; then
        if yum install -y "$package"; then
            echo "${txtgrn}Package '$package' installed successfully. ${txtrst}"|center
        else
            echo "${txtred}Failed to install package '$package'.${txtrst}"|center
        fi
    else
        echo "${txtred}Installation cancelled.${txtrst}"|center
    fi
}

# Function to update packages
function update_packages() {
    read -p "${txtylw}Are you sure you want to update all packages? (y/n): ${txtrst}" confirm
    if [[ $confirm == "y" || $confirm == "Y" ]]; then
        if yum update -y; then
            echo "${txtgrn}Packages updated successfully.${txtrst}" | center
        else
            echo "${txtred}Failed to update packages. Please try again later.${txtrst}" | center
        fi
    else
        echo "${txtred}Update cancelled.${txtrst}" | center
    fi
}

# Function to upgrade packages
function upgrade_packages() {
    read -p "${txtylw}Are you sure you want to upgrade all packages? (y/n): ${txtrst}" confirm
    if [[ $confirm == "y" || $confirm == "Y" ]]; then
        if yum upgrade -y; then
            echo "${txtgrn}Packages upgraded successfully.${txtrst}" | center
        else
            echo "${txtred}Failed to upgrade packages. Please try again later.${txtrst}" | center
        fi
    else
        echo "${txtred}Upgrade cancelled.${txtrst}" | center
    fi
}



# Function to clean cache
function clean_cache() {
    read -p "${txtred}Are you sure you want to clean the cache? This action cannot be undone. (y/n): ${txtrst}" confirm
    if [[ $confirm == "y" || $confirm == "Y" ]]; then
        if yum clean all; then
            echo "${txtgrn}Cache cleaned successfully${txtrst}"
        else
            echo "${txtred}Failed to clean the cache. Please try again later.${txtrst}"|center
        fi
    else
        echo "${txtred}Cache cleaning cancelled.${txtrst}"|center
    fi
}


function Exit() {
        echo "${txtgrn}Exiting the script ${txtrst}"|center
	exit 0	
}

# Main menu
echo "${txtylw}---------------------------------------------------------------------------------------${txtrst}"
echo "               ${bold} ${txtgrn}Package Management Menu ${txtrst}"|centerwide
echo "${txtylw}---------------------------------------------------------------------------------------${txtrst}"
echo "${txtblu}1. yum commands/options"|center
echo "2. Available packages"|center
echo "3. Installed packages"|center
echo "4. Package Information"|center
echo "5. Find package"|center
echo "6. Check yum history"|center
echo "7. Install package"|center
echo "8. Update package"|center
echo "9. Upgrade package"|center
echo "10. Clean cache ${txtrst}"|center
echo "${txtred}11. Exit ${txtrst}"|center

read -p "Enter your choice: " choice

# Switch condition to execute based on user's choice
case $choice in
    "1") display_yum_commands ;;
    "2") display_available_packages ;;
    "3") display_installed_packages ;;
    "4") display_package_info ;;
    "5") find_package ;;
    "6") check_yum_history ;;
    "7") install_package ;;
    "8") update_packages ;;
    "9") upgrade_packages ;;
    "10") clean_cache ;;
    "11") Exit;;
     *)
        echo "${txtred}Invalid option. Please try again... ${txtrst}"|center
        ;;
esac


