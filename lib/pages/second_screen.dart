import 'package:flutter/material.dart';
import 'package:mobile_test/pages/palindrome.dart';
import 'package:mobile_test/pages/third_screen.dart';
import 'package:provider/provider.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final palindromeProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Second Screen')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [const
            Text('Welcome'),
            Text(palindromeProvider.name),

            SizedBox(height: 50.0,),
            const Center(child: Text('Selected User Name', style: TextStyle(fontSize: 24),)),
            Text(palindromeProvider.userName),
            const SizedBox(height: 20),
            MaterialButton(
                minWidth: double.infinity,
                height: 40,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ThirdScreen()),
                  );
                },                        
                color: const Color.fromARGB(255, 83, 112, 207),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Text("Choose a User", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15, color: Colors.white,),),
            ),          
          ],         
        ),       
      ),
    );
  }
}