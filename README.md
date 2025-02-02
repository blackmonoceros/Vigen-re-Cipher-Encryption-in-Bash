# Vigen-re-Cipher-Encryption-in-Bash    
The Vigenère cipher is a polyalphabetic substitution cipher, meaning it uses multiple substitution alphabets to encrypt the text.
It is an improvement over simpler ciphers like the Caesar cipher and is considered more secure due to its use of a repeating key.

Step-by-Step Explanation:

Script Setup:


The script starts with the shebang #!/bin/bash to specify that it should be executed using the Bash shell.
Functions are defined to modularize the code.


Encrypting a Single Character:
The encrypt_char function takes a single plaintext character and a key character as input.
It converts both characters to their ASCII values using printf "%d".
Depending on whether the character is uppercase (A-Z) or lowercase (a-z), it calculates the offset (65 for uppercase, 97 for lowercase).
The Vigenère cipher formula is applied: (plaintext_ascii - offset + key_ascii - offset) % 26 + offset.
The result is converted back to a character using printf.


Encrypting the Full Text:

The vigenere_encrypt function loops through each character of the plaintext.
It uses the encrypt_char function to encrypt each character.
If the character is a letter, it advances the key index to the next character, wrapping around to the start of the key if necessary.


User Input:

The script prompts the user to enter the plaintext and the key.
It then calls the vigenere_encrypt function to encrypt the plaintext and displays the result.
Output:
The encrypted text is printed to the terminal.


Example Usage:
If you run the script and input:
Plaintext: HELLO
Key: KEY
The output will be:
javascript


Encrypted text:
RIJVS
