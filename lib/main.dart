import 'package:flutter/material.dart';

void main() {
  runApp(TabBarDemo());
}

class TabBarDemo extends StatefulWidget {
  @override
  _TabBarDemoState createState() => _TabBarDemoState();
}

class _TabBarDemoState extends State<TabBarDemo> {

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
      DrawerHeader(
        child: Text("Drawer header"),
        decoration: BoxDecoration(
          color: Colors.blue,
        ),
      ),
      ListTile(
        title: Text("Item 1"),
        onTap: () {
          print("Item 1 selected");
        },
      ),
      ListTile(
        title: Text("Item 2"),
        onTap: () {
          print("Item 2 selected");
        },
      )
    ];

    return MaterialApp(
      home: DefaultTabController(
        length: _Tabs.length,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: _Tabs,
            ),
            title: !isSearching 
            ? Text("Titulo") 
            : TextField(
              decoration: InputDecoration(
                hintText: "Search here",
                hintStyle: TextStyle(color: Colors.grey),
                icon: Icon(Icons.search),
              ),
            ),
            backgroundColor: Colors.black54,
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
      ),
    );
  }
}