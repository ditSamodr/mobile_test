import 'package:flutter/material.dart';
import 'package:mobile_test/pages/palindrome.dart';
import 'package:mobile_test/pages/second_screen.dart';
import 'package:provider/provider.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

 @override
  Widget build(BuildContext context) {
    final palindromeProvider = Provider.of<UserProvider>(context);
    TextEditingController nameController = TextEditingController();
    TextEditingController sentenceController = TextEditingController();

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade800, Colors.blue.shade400],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: sentenceController,
              decoration: const InputDecoration(labelText: 'Palindrome'),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Container(
              padding: const EdgeInsets.only(top: 5, left: 3),
              child: MaterialButton(
                minWidth: double.infinity,
                height: 40,
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
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  );
                },                        
                color: const Color.fromARGB(255, 83, 112, 207),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Text("Check", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15, color: Colors.white,),),
              ),
            ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Container(
                padding: const EdgeInsets.only(top: 5, left: 3),
                child: MaterialButton(
                  minWidth: double.infinity,
                  height: 40,
                  onPressed: () {
                    palindromeProvider.setName(nameController.text);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SecondScreen()),
                    );      
                  },                        
                  color: const Color.fromARGB(255, 83, 112, 207),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const Text("Next", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15, color: Colors.white,),),
                ),
              ),           
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}