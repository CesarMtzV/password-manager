import 'package:flutter/material.dart';
import 'account.dart';
import 'settings.dart';
import 'info.dart';

class Vault extends StatefulWidget {
  Vault({Key key}) : super(key: key);

  _VaultState createState() => _VaultState();
}

class _VaultState extends State<Vault> {

  bool isSearching = false;
  int _selectDrawerItem = 0;

  _getDrawerItemWidget(int pos){
    switch(pos){
      case 0: return Vault();
      case 1: return Account();
      case 2: return Settings();
      case 3: return Info();
    }
  }

  _onSelectItem(int pos){
    setState(() {
      _selectDrawerItem = pos;
    });
  }


  @override
  Widget build(BuildContext context) {

    final _TabPages = <Widget>[
      Center(child: Text("ALL"),),
      Center(child: Text("FAVORITES"),),
    ];

    final _Tabs = <Tab>[
      Tab(text: "ALL",),
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
          print("Sing out selected");
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