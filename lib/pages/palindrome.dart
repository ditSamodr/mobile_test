import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier{
  String name = '';
  String sentence = '';
  String userName = '';

  bool checkPalindrome(String sentence){
    String reversed = sentence.split('').reversed.join();
    return sentence == reversed;
  }

  void setName(String newName) {
    name = newName;
    notifyListeners();
  }

  void setSentence(String newSentence) {
    sentence = newSentence;
    notifyListeners();
  }

  void setUserName(String newUserName) {
    userName = newUserName;
    notifyListeners();
  }
  
}