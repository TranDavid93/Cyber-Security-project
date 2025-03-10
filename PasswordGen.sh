#!/bin/bash

#Password Generator V1.1    
#David Tran Cyber security Project 2025

#Option1 function - display DOE Password Policy 
POLICY="
To meet the password requirement, your password must:
- Not be any of your previous 10 passwords
- Not contain parts of your display, first, or last name
- Have a minimum length of 10 characters
- Contain at least three of the four categories:
    uppercase letters, lowercase letters, numeric digits, and special characters."

#Option 2 function: Password generator 
#Option 2-1: 10-14 characters
Option1PW() {
    length=$((RANDOM % 5 + 10))  # Random length between 10 and 14
    password=$(LC_ALL=C tr -dc 'A-Za-z0-9!@#$%^&*()_+=' < /dev/urandom | head -c "$length")
    echo -e "\nYour password is: $password"
    exit 0  
}
#Option 2-2: 15 characters
Option2PW() {
    length=15  
    password=$(LC_ALL=C tr -dc 'A-Za-z0-9!@#$%^&*()_+=' < /dev/urandom | head -c "$length")
    echo -e "\nYour password is: $password"
    exit 0  
}

# Menu
echo -e "
\033[34mWelcome to the DOE password generator\033[0m"
while true; do
    read -p $'\nPress 1 for Password DOE password policy\nPress 2 to Generate Password\nPress 3 to Exit\nEnter your choice: ' choice

#OPTION 1
    if [ "$choice" -eq 1 ]; then
        echo -e "
        \033[96mDepartment of Education Western Australia Password Policy\033[0m" 
        echo "$POLICY"
        #Display addition information about password length
        echo -e "
        \033[31m Passwords containing 15 or more characters will not expire, 
    whereas passwords with fewer than 15 characters will remain valid for 90 days.\033[0m"

#OPTION 2

    elif [ "$choice" -eq 2 ]; then
       echo -e "What length would you like:
    1) 10-14 characters (valid 90 days)
    2) 15 characters (permanent)"
    
    read -p "Enter your choice: " pass_choice

    #generate 10-14 character password
    if [ "$pass_choice" -eq 1 ]; then
        Option1PW  
    #generate a 15-character password
    elif [ "$pass_choice" -eq 2 ]; then
        Option2PW 
    else
    #Display error message
        echo -e "\033[31mInvalid option, please pick 1 or 2.\033[0m"  
    fi

#Option 3

    elif [ "$choice" -eq 3 ]; then
        echo "Sayonara!"
        exit 0

    else
    #Display error message
        echo -e "\033[31mInvalid option, please pick 1, 2 or 3.\033[0m"  
    fi

done


