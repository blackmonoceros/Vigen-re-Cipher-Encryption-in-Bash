#!/bin/bash

# Function to encrypt a single character
encrypt_char() {
    local char=$1
    local key_char=$2

    # Convert characters to ASCII values
    char_ascii=$(printf "%d" "'$char")
    key_ascii=$(printf "%d" "'$key_char")

    # Calculate the offset for 'A' or 'a' depending on case
    if [[ $char =~ [A-Z] ]]; then
        offset=65
    elif [[ $char =~ [a-z] ]]; then
        offset=97
    else
        # If not a letter, return the character as is
        echo -n "$char"
        return
    fi

    # Perform Vigenère encryption
    encrypted_ascii=$(( (char_ascii - offset + key_ascii - offset) % 26 + offset ))
    encrypted_char=$(printf "\\$(printf "%03o" "$encrypted_ascii")")

    echo -n "$encrypted_char"
}

# Main encryption function
vigenere_encrypt() {
    local plaintext=$1
    local key=$2
    local key_length=${#key}
    local key_index=0

    for (( i=0; i<${#plaintext}; i++ )); do
        char=${plaintext:$i:1}

        # Get the corresponding key character
        key_char=${key:$key_index:1}

        # Encrypt the character
        encrypt_char "$char" "$key_char"

        # Move to the next key character, wrapping around if necessary
        if [[ $char =~ [A-Za-z] ]]; then
            key_index=$(( (key_index + 1) % key_length ))
        fi
    done
    echo
}

# Input from the user
read -p "Enter the plaintext: " plaintext
read -p "Enter the key: " key

# Encrypt the plaintext
echo "Encrypted text:"
vigenere_encrypt "$plaintext" "$key"