import 'dart:html';

import 'package:flutter/material.dart';
import 'vault.dart';

class Add extends StatefulWidget {
  Add({Key key}) : super(key: key);

  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {
  bool isSearching = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Vault()),
          );
          },
        ),
        title: Text("New Login"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              print('Data Saved');
            },
          )
        ],
      ),
      backgroundColor: Color(0xFF212121),

    
    );
  }
}