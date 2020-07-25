import 'package:flutter/material.dart';
import 'package:password_manager/widgets/drawer.dart';
import 'vault.dart';
import 'settings.dart';
import 'account.dart';

class Info extends StatefulWidget {
  Info({Key key}) : super(key: key);

  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Info"),
      ),
      drawer: AppDrawer(),
    );
  }
}
