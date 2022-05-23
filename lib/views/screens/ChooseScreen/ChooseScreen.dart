import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:s2ee_new/views/screens/screens.dart';

class ChooseScreen extends StatelessWidget {
  @override
  FirebaseAuth _auth = FirebaseAuth.instance;
  Widget build(BuildContext context) {
    User? user = _auth.currentUser;
    if (user == null) {
      return LoginScreen();
    } else {
      return HomeScreen();
    }
  }
}
