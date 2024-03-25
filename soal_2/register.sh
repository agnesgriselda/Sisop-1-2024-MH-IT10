#!/bin/bash

# function to encrypt password using base64 (replace with secure hashing later)
encrypt_password() {
    echo -n "$1" | base64
}

# function to check if email is already registered
check_duplicate_email() {
    local email=$1
    grep -q "^$email:" users.txt
    return $?
}

# function to register user
register_user() {
    local email=$1
    local username=$2
    local security_question=$3
    local security_answer=$4
    local password=$5
    local user_type="user"  # Default user type

    if [[ "$email" == admin ]]; then
        user_type="admin"
    fi
    
    encrypted_password=$(encrypt_password "$password")

    check_duplicate_email "$email"
    if [ $? -eq 0 ]; then
        echo "[ $(date +'%d/%m/%Y %H:%M:%S') ] [REGISTER FAILED] Email $email already registered." >> auth.log
        echo "Email $email already registered. Please choose another email."
        exit 1
    fi

    echo "$email:$username:$security_question:$security_answer:$encrypted_password:$user_type" >> users.txt

    if [[ $user_type == "admin" ]]; then
        echo "[ $(date +'%d/%m/%Y %H:%M:%S') ] [REGISTER SUCCESS] Admin $username registered successfully." >> auth.log
        echo "Admin $username registered successfully."
    else
        echo "[ $(date +'%d/%m/%Y %H:%M:%S') ] [REGISTER SUCCESS] User $username registered successfully." >> auth.log
        echo "User $username registered successfully."
    fi
}

# main code

# create users.txt if it doesn't exist
touch users.txt

echo "=== User Registration ==="
read -p "Email: " email
read -p "Username: " username
read -p "Security Question: " security_question
read -p "Security Answer: " security_answer
read -sp "Password: " password
echo

# validate password
while true; do
    if [[ ${#password} -lt 8 || !("$password" =~ [[:lower:]]) || !("$password" =~ [[:upper:]]) || !("$password" =~ [0-9]) ]]; then
        echo "Password must be at least 8 characters long and contain at least one uppercase letter, one lowercase letter, and one digit."
        read -sp "Password: " password
        echo
    else
        break
    fi
done

register_user "$email" "$username" "$security_question" "$security_answer" "$password"
