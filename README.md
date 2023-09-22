# Caesar Cipher Decryptor App

The Caesar Cipher Decryptor App is a Flutter-based mobile application designed to decrypt a given ciphertext using the Caesar cipher decryption technique. It provides three possible decrypted solutions, assuming different keys (E, T, and A) based on the most frequent character in the ciphertext.

## Features

- Decryption of ciphertext using the Caesar cipher technique.
- Three decryption attempts using keys E, T, and A based on frequency analysis.
- User-friendly interface for inputting ciphertext and viewing decrypted results.

## Installation and usage

Follow these steps to run the Caesar Cipher Decryptor App on your local machine:

1. Clone the repository to your local environment:

   ```bash
   git clone https://github.com/AbednigoLethole/decipherapp.git

2. Open the Caesar Cipher Decryptor App on your device or emulator(by running main.dart file found in lib folder).APK files can be found in folder: build/app/outputs/flutter-apk


3. Input the ciphertext that you want to decrypt into the provided TextField.

4. Tap the "Decrypt" button.

5. The app will perform the following actions:

Identify the most frequent character in the ciphertext.
Calculate the letter distances from 'E,' 'T,' and 'A' to the most frequent character.
Decrypt the ciphertext using these distances for each key (E, T, and A).
Display the decrypted results in the app's user interface.

6.  You can view the decrypted solutions labeled as "Solution 1," "Solution 2," and "Solution 3" in the app's interface and terminal.


