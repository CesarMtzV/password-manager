import 'package:flutter/material.dart';
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

    final _ListTiles = <Widget>[
      UserAccountsDrawerHeader(
        accountName: Text("Cesar Martinez"),
        accountEmail: Text("mc.cesar.art@gmail.com"),
        currentAccountPicture: CircleAvatar(
          backgroundColor: Colors.grey[900],
          child: Text(
            'C', 
            style: TextStyle(
              fontSize: 40.0
            ),
          ),
        ),
      ),
      ListTile(
        title: Text("Vault"),
        leading: Icon(Icons.lock),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Vault()),
          );
        },
      ),
      ListTile(
        title: Text("Account"),
        leading: Icon(Icons.account_circle),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Account()),
          );
        },
      ),
      ListTile(
        title: Text("Settings"),
        leading: Icon(Icons.settings),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Settings()),
          );
        },
      ),
      ListTile(
        title: Text("Info"),
        leading: Icon(Icons.info),
        onTap: () {
          print("info selected");
        },
      ),
      ListTile(
        title: Text("Sign out"),
        leading: Icon(Icons.exit_to_app),
        onTap: () {
          print("Sign out selected");
        },
      ),
      
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("Info"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: _ListTiles,
        ),
      ),
    );
  }
}