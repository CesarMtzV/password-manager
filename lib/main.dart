import 'package:flutter/material.dart';
import 'package:password_manager/vault.dart';

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
    );
  }
}