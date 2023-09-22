import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Caesar Cipher Decryptor',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String ciphertext = ''; // Storing the input ciphertext
  String eShiftedText = ''; // Storing the text shifted by "E"
  String tShiftedText = ''; // Storing the text shifted by "T"
  String aShiftedText = ''; // Storing the text shifted by "A"


  // Gets the most recurring character
  String findMostFrequentCharacter(String text) {
    // Removing spaces and converting the text to lowercase for case-insensitive counting
    text = text.replaceAll(' ', '').toLowerCase();

    // Creating a map to store character frequencies
    Map<String, int> frequencyMap = {};

    // Iterating through each character in the text
    for (int i = 0; i < text.length; i++) {
      String char = text[i];

      // Checking if the character is a letter by comparing Unicode code points
      if (char.codeUnitAt(0) >= 'a'.codeUnitAt(0) && char.codeUnitAt(0) <= 'z'.codeUnitAt(0)) {
        // Incrementing the frequency count for this character
        frequencyMap[char] = (frequencyMap[char] ?? 0) + 1;
      }
    }

    // Finding the character with the highest frequency
    String mostFrequentChar = '';
    int maxFrequency = 0;

    frequencyMap.forEach((char, frequency) {
      if (frequency > maxFrequency) {
        mostFrequentChar = char;
        maxFrequency = frequency;
      }
    });

    return mostFrequentChar;
  }

  // Gets the shift between letters.
  int calculateLetterDistance(String intialletter, String shiftedletter) {
    // Getting the Unicode code points of the input letters
    int codePoint1 = intialletter.codeUnitAt(0);
    int codePoint2 = shiftedletter.codeUnitAt(0);

    // Calculating the absolute difference between the code points
    int distance = (codePoint2 - codePoint1);

    return distance;
  }

  // Shifts the string
  String caesarCipher(String text, int shift) {
    // Creating an empty string to store the shifted text
    String shiftedText = '';

    // Iterating through each character in the text
    for (int i = 0; i < text.length; i++) {
      String char = text[i];

      // Checking if the character is a letter
      if (char.codeUnitAt(0) >= 'A'.codeUnitAt(0) && char.codeUnitAt(0) <= 'Z'.codeUnitAt(0)) {
        // Shift uppercase letters
        int shiftedCode = char.codeUnitAt(0) + shift;

        // Wrapping around if the shift goes beyond 'Z'
        if (shiftedCode > 'Z'.codeUnitAt(0)) {
          shiftedCode -= 26;
        }

        shiftedText += String.fromCharCode(shiftedCode);
      } else if (char.codeUnitAt(0) >= 'a'.codeUnitAt(0) && char.codeUnitAt(0) <= 'z'.codeUnitAt(0)) {
        // Shift lowercase letters
        int shiftedCode = char.codeUnitAt(0) + shift;

        // Wrapping around if the shift goes beyond 'z'
        if (shiftedCode > 'z'.codeUnitAt(0)) {
          shiftedCode -= 26;
        }

        shiftedText += String.fromCharCode(shiftedCode);
      } else {
        // Keeping non-letter characters unchanged
        shiftedText += char;
      }
    }

    return shiftedText;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Caesar Cipher Decryptor APP'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              onChanged: (text) {
                setState(() {
                  ciphertext = text;
                });
              },
              decoration: InputDecoration(labelText: 'Enter Ciphertext'),
            ),
            ElevatedButton(
              onPressed: () {
                // Calling the decryption function here
                String mostFrequentChar = findMostFrequentCharacter(ciphertext);

                // Calculating the letter distance from 'E','T' 'A' to the most frequent character.
                int eletterDistance = calculateLetterDistance('e', mostFrequentChar);
                int tletterDistance = calculateLetterDistance('t', mostFrequentChar);
                int aletterDistance = calculateLetterDistance('a', mostFrequentChar);

                print('Most frequent character: $mostFrequentChar');
                print('Letter distance from "E": $eletterDistance');
                print('Letter distance from "T": $tletterDistance');
                print('Letter distance from "A": $aletterDistance');

                String eshiftedText = caesarCipher(ciphertext, eletterDistance);
                String tshiftedText = caesarCipher(ciphertext, tletterDistance);
                String ashiftedText = caesarCipher(ciphertext, aletterDistance);

                eShiftedText = eshiftedText;
                tShiftedText = tshiftedText;
                aShiftedText = ashiftedText;

                print('-----------------------------------------------');
                print('Solution 1');
                print(eshiftedText);

                print('-----------------------------------------------');
                print('Solution 2');
                print(tshiftedText);

                print('-----------------------------------------------');
                print('Solution 3');
                print(ashiftedText);

                print('-----------------------------------------------');


              },
              child: Text('Decrypt'),
            ),
            const Text(
              'Decrypted Texts:',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Solution 1: $eShiftedText',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              'Solution 2: $tShiftedText',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              'Solution 3: $aShiftedText',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

          ],
        ),
      ),
    );
  }
}
