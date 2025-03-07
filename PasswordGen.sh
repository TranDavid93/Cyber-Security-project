#!/bin/bash

#Password Generator V1.0    
#David Tran 2025

# DOE Password Policy
POLICY="
To meet the password requirement, your password must:
- Not be any of your previous 10 passwords
- Not contain parts of your display, first, or last name
- Have a minimum length of 10 characters
- Contain at least three of the four categories:
    uppercase letters, lowercase letters, numeric digits, and special characters."

# Function to generate a password
# Default length is 12 if not provided
# Function to generate a password and exit
generate_password() {
    length=${1:-12}  
    password=$(LC_ALL=C tr -dc 'A-Za-z0-9!@#$%^&*()_+=' < /dev/urandom | head -c "$length")
    echo -e "\nYour password is: $password"
    exit 0  # Exits after displaying the password
}

# Function to set password standards and exit
set_password_standards() {
    read -p "Enter desired password length (default 12): " pass_length
    pass_length=${pass_length:-12}  # Default length if empty
    echo -e "\nPassword length set to $pass_length characters."
    exit 0  # Exits after setting the password standard
}
# Menu
echo -e "
\033[34mWelcome to the password generator\033[0m"
while true; do
    read -p $'\nPress 1 for Password DOE password policy\nPress 2 to Generate Password\nPress 3 to Exit\nEnter your choice: ' choice

#OPTION 1

    if [ "$choice" -eq 1 ]; then
        echo -e "
        \033[96mDepartment of Education Western Australia Password Policy\033[0m" #Option 1 header
        echo "$POLICY"
        echo -e "
        \033[31m Passwords containing 15 or more characters will not expire, 
    whereas passwords with fewer than 15 characters will remain valid for 90 days.\033[0m"
    elif [ "$choice" -eq 2 ]; then
       echo -e "What length would you like:
    1) 10-14 characters (valid 90 days)
    2) 15 characters (permanent)"
    read -p "Enter your choice:" pass_choice
    if [ "$pass_choice" -eq 1 ]; then
        generate_password 12  # Generates a password between 10-14 characters
    elif [ "$pass_choice" -eq 2 ]; then
        generate_password 15  # Generates a 15-character password
               
     else
        echo -e "\033[31mInvalid option, please pick 1 or 2.\033[0m"  # Error message in red
    fi
    elif [ "$choice" -eq 3 ]; then
        echo "Sayonara!"
        exit 0
    #Troll
    elif [ "$choice" -eq 66 ]; then
    echo -e "[32mHi China[0m"
    else
        echo "[31mInvalid option, please try again.[0m"
    fi

done


