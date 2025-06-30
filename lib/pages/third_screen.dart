import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:mobile_test/pages/palindrome.dart';
import 'package:provider/provider.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  List users = [];
  int page = 1;
  bool isLoading = false;
  String apiKey = "reqres-free-v1";

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    setState(() {
      isLoading = true;
    });

    final url = Uri.parse('https://reqres.in/api/users?page=1&per_page=10');

    final response = await http.get(
      url,
      headers: {
        'x-api-key': 'apiKey',
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        users.addAll(data['data']);
        page++;
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final palindromeProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Third Screen')),
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {
            users.clear();
            page = 1;
          });
          fetchUsers();
        },
        child: ListView.builder(
          itemCount: users.length + (isLoading ? 1 : 0),
          itemBuilder: (context, index) {
            if (index == users.length) {
              return const Center(child: CircularProgressIndicator());
            }

            var user = users[index];

            return ListTile(
              title: Text('${user['first_name']} ${user['last_name']}'),
              subtitle: Text(user['email']),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(user['avatar']),
              ),
              onTap: () {
                palindromeProvider.setUserName('${user['first_name']} ${user['last_name']}');
                Navigator.pop(context);
              },
            );
          },
        ),
      ),
    );
  }
}