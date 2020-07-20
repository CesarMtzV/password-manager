import 'package:flutter/material.dart';
import 'screens/authentication/welcome.dart';

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
      home: Welcome(),
      theme: ThemeData(
        primaryColor: Color(0xFFC62828),
        accentColor: Color(0xFFC62828),
      ),
    );
  }
}
