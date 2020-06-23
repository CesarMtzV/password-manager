import 'package:flutter/material.dart';

class Vault extends StatefulWidget {
  Vault({Key key}) : super(key: key);

  _VaultState createState() => _VaultState();
}

class _VaultState extends State<Vault> {

  bool isSearching = false;

  @override
  Widget build(BuildContext context) {

    final _TabPages = <Widget>[
      Center(child: Text("Page 1"),),
      Center(child: Text("Page 2"),),
      Center(child: Text("Page 3"),),
    ];

    final _Tabs = <Tab>[
      Tab(text: "ALL",),
      Tab(text: "RECENT",),
      Tab(text: "FAVORITES",),
    ];

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
          print("Vault selected");
        },
      ),
      ListTile(
        title: Text("Account"),
        leading: Icon(Icons.account_circle),
        onTap: () {
          print("account selected");
        },
      ),
      ListTile(
        title: Text("Settings"),
        leading: Icon(Icons.settings),
        onTap: () {
          print("Settings selected");
        },
      ),
      ListTile(
        title: Text("Sign out"),
        leading: Icon(Icons.exit_to_app),
        onTap: () {
          print("Settings selected");
        },
      ),
      ListTile(
        title: Text("Info"),
        leading: Icon(Icons.info),
        onTap: () {
          print("info selected");
        },
      ),
    ];

    return DefaultTabController(
        length: _Tabs.length,
        child: Scaffold(
          backgroundColor: Colors.grey[900],
          appBar: AppBar(
            bottom: TabBar(
              tabs: _Tabs,
            ),
            title: !isSearching 
            ? Text("Vault") 
            : TextField(
              decoration: InputDecoration(
                hintText: "Search here",
                hintStyle: TextStyle(color: Colors.grey),
                icon: Icon(Icons.search),
              ),
            ),
            backgroundColor: Colors.grey[850],
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
          body: TabBarView(
            children: _TabPages,
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: _ListTiles,
            ),
          ),
        ),
      );
  }
}