import 'package:flutter/material.dart';
import 'vault.dart';

class NewLogin extends StatefulWidget {
  NewLogin({Key key}) : super(key: key);

  @override
  NewLoginState createState() => NewLoginState();
}

class NewLoginState extends State<NewLogin> {
  bool isSearching = false;
  final _formKey = GlobalKey<FormState>();
  String _email, _userName, _siteName, _password, _url;

  _submit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      print(_email);
      print(_userName);
      print(_siteName);
      print(_password);
      print(_url);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Login"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () => _submit(),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            child: Text(
              "Item information",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
          ),
          Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 10,
                  ),
                  child: TextFormField(
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    onSaved: (input) => _email = input,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 10,
                  ),
                  child: TextFormField(
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      labelText: 'Username',
                      labelStyle: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    onSaved: (input) => _userName = input,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 10,
                  ),
                  child: TextFormField(
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    obscureText: true,
                    onSaved: (input) => _password = input,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 10,
                  ),
                  child: TextFormField(
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      labelText: 'URL',
                      labelStyle: TextStyle(color: Colors.grey),
                    ),
                    onSaved: (input) => _url = input,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 10,
                  ),
                  child: TextFormField(
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      labelText: 'Site name',
                      labelStyle: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    onSaved: (input) => _siteName = input,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      backgroundColor: Color(0xFF212121),
    );
  }
}
