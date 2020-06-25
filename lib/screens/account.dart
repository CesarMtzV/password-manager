import 'package:flutter/material.dart';
import 'vault.dart';
import 'settings.dart';
import 'info.dart';

class Account extends StatefulWidget {
  Account({Key key}) : super(key: key);

  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
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
        onTap: () {},
      ),
      ListTile(
        title: Text("Settings"),
        leading: Icon(Icons.settings),
        onTap: () {},
      ),
      ListTile(
        title: Text("Info"),
        leading: Icon(Icons.info),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Info()),
          );
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
        title: Text("Account"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: _ListTiles
        ),
      ),
    );
  }
}