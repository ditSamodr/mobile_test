import 'package:flutter/material.dart';
import 'package:mobile_test/pages/third_screen.dart';
import 'package:mobile_test/provider/palindrome.dart';
import 'package:provider/provider.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final palindromeProvider = Provider.of<Palindrome>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Second Screen')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Welcome', style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            Text(palindromeProvider.name),
            Center(child: Text('Selected User Name')),
            Text(palindromeProvider.userName),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ThirdScreen()),
                );
              },
              child: Text('Choose a User'),
            ),
          ],
        ),
      ),
    );
  }
}