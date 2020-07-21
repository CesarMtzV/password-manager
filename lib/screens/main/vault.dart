import 'package:flutter/material.dart';
import 'package:password_manager/screens/authentication/welcome.dart';
import 'account.dart';
import 'newLogin.dart';
import 'settings.dart';
import 'info.dart';

class Vault extends StatefulWidget {
  //Constructor
  // final String userName;
  // final String email;

  Vault({Key key}) : super(key: key);

  //_VaultState createState() => _VaultState(email, userName);
  _VaultState createState() => _VaultState();
}

class _VaultState extends State<Vault> {
  bool isSearching = false;
  //String email, userName;
  String email = "mc.cesar.art@gmail.com", userName = "Cesar Martinez";
  //_VaultState(this.email, this.userName);

  @override
  Widget build(BuildContext context) {
    final _ListTiles = <Widget>[
      UserAccountsDrawerHeader(
        accountName: Text(userName),
        accountEmail: Text(email),
        currentAccountPicture: CircleAvatar(
          backgroundColor: Colors.grey[900],
          child: Text(
            'C',
            style: TextStyle(fontSize: 40.0),
          ),
        ),
      ),
      ListTile(
        title: Text("Vault"),
        leading: Icon(Icons.lock),
        onTap: () {
          print("Vault selected");
        },
      ),
      ListTile(
        title: Text("Account"),
        leading: Icon(Icons.account_circle),
        onTap: () {
          Navigator.of(context).pop();
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
          Navigator.pop(context);
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Welcome()));
        },
      ),
    ];

    return Scaffold(
      backgroundColor: Color(0xFF212121),
      appBar: AppBar(
        title: !isSearching
            ? Text("RUNE")
            : TextField(
                decoration: InputDecoration(
                  hintText: "Search here",
                  hintStyle: TextStyle(color: Colors.white),
                  icon: Icon(Icons.search),
                ),
              ),
        backgroundColor: Color(0xFF484848),
        actions: <Widget>[
          isSearching
              ? IconButton(
                  icon: Icon(Icons.cancel),
                  onPressed: () {
                    setState(() {
                      this.isSearching = false;
                    });
                  },
                )
              : IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    setState(() {
                      this.isSearching = true;
                    });
                  },
                ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NewLogin()),
          );
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
        backgroundColor: Color(0xFFC62828),
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
