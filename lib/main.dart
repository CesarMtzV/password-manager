import 'package:flutter/material.dart';
import 'package:password_manager/screens/authentication/login_register.dart';
import 'package:password_manager/screens/main/vault.dart';
import 'screens/authentication/welcome.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() {
  runApp(TabBarDemo());
}

class TabBarDemo extends StatefulWidget {
  @override
  _TabBarDemoState createState() => _TabBarDemoState();
}

class _TabBarDemoState extends State<TabBarDemo> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFFC62828),
        accentColor: Color(0xFFC62828),
      ),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.onAuthStateChanged,
        builder: (ctx, userSnapshot) {
          if (userSnapshot.hasData) {
            return Vault();
          }
          return LoginOrRegister();
        },
      ),
    );
  }
}
