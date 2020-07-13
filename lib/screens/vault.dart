import 'package:flutter/material.dart';
import 'package:password_manager/screens/add.dart';
import 'account.dart';
import 'settings.dart';
import 'info.dart';
import 'welcome.dart';

class Vault extends StatefulWidget {
  Vault({Key key}) : super(key: key);

  _VaultState createState() => _VaultState();
}

class _VaultState extends State<Vault> {
  bool isSearching = false;

  @override
  Widget build(BuildContext context) {
    final _TabPages = <Widget>[
      Center(
        child: Text("ALL"),
      ),
      Center(
        child: Text("FAVORITES"),
      ),
    ];

    final _Tabs = <Tab>[
      Tab(
        text: "ALL",
      ),
      Tab(
        text: "FAVORITES",
      ),
    ];

    final _ListTiles = <Widget>[
      UserAccountsDrawerHeader(
        accountName: Text("Cesar Martinez"),
        accountEmail: Text("mc.cesar.art@gmail.com"),
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
            MaterialPageRoute(builder: (context) => Add()),
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
