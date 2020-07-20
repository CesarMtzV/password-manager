import 'package:flutter/material.dart';
import 'package:password_manager/screens/authentication/signIn.dart';
import 'package:password_manager/utilities/styles.dart';
import 'package:password_manager/widgets/rounded_button.dart';

class Signup extends StatefulWidget {
  Signup({Key key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
  String _firstName, _lastName, _email, _password;

  _submit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      print(_firstName);
      print(_lastName);
      print(_email);
      print(_password);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rune"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Text(
              "Create account",
              style: TextStyle(fontSize: 40.0),
            ),
          ),
          Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: TextFormField(
                    decoration: InputDecoration(labelText: 'First Name'),
                    onSaved: (input) => _firstName = input,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: TextFormField(
                    decoration: InputDecoration(labelText: 'Last Name'),
                    onSaved: (input) => _lastName = input,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: TextFormField(
                    decoration: InputDecoration(labelText: 'Email'),
                    validator: (input) => !input.contains('@')
                        ? 'Please enter a valid email'
                        : null,
                    onSaved: (input) => _lastName = input,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: TextFormField(
                    decoration: InputDecoration(labelText: 'Password'),
                    validator: (input) => input.length < 6
                        ? 'Password must be at least 6 characters'
                        : null,
                    obscureText: true,
                    onSaved: (input) => _lastName = input,
                  ),
                ),
                RoundedButton(
                  onPress: _submit,
                  color: kPrimaryColor,
                  text: 'Create account',
                  textColor: Colors.white,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Already have an account? '),
                    GestureDetector(
                      child: Text(
                        "Sign in",
                        style: TextStyle(color: Colors.redAccent),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Login()));
                      },
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
