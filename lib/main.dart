import 'package:flutter/material.dart';
import './screens/vault.dart';

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
      home: Vault(),
      theme: ThemeData(
        primaryColor: Color(0xFFB71C1C),
        accentColor: Color(0xFFB71C1C),
      ),
    );
  }
}