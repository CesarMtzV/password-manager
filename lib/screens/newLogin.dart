import 'package:flutter/material.dart';
import 'vault.dart';

class NewLogin extends StatefulWidget {
  NewLogin({Key key}) : super(key: key);

  @override
  NewLoginState createState() => NewLoginState();
}

class NewLoginState extends State<NewLogin> {
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
