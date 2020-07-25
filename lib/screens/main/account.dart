import 'package:flutter/material.dart';
import 'package:password_manager/widgets/drawer.dart';

class Account extends StatefulWidget {
  Account({Key key}) : super(key: key);

  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Account"),
      ),
      drawer: AppDrawer(),
    );
  }
}
