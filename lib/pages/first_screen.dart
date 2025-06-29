import 'package:flutter/material.dart';
import 'package:mobile_test/pages/second_screen.dart';
import 'package:mobile_test/provider/palindrome.dart';
import 'package:provider/provider.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

 @override
  Widget build(BuildContext context) {
    final palindromeProvider = Provider.of<Palindrome>(context);
    TextEditingController nameController = TextEditingController();
    TextEditingController sentenceController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text('First Screen')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: sentenceController,
              decoration: InputDecoration(labelText: 'Palindrome'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                palindromeProvider.setName(nameController.text);
                palindromeProvider.setSentence(sentenceController.text);
                bool isPalindrome = palindromeProvider.checkPalindrome(sentenceController.text);
                String message = isPalindrome ? "isPalindrome" : "notPalindrome";

                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Text(message),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text('OK'),
                      ),
                    ],
                  ),
                );
              },
              child: Text('Check'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                palindromeProvider.setName(nameController.text);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondScreen()),
                );
              },
              child: Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}