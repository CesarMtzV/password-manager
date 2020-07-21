import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:password_manager/screens/main/vault.dart';
import 'package:password_manager/utilities/styles.dart';
import 'package:password_manager/widgets/rounded_button.dart';
import './signup.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  static final String id = 'login_screen';

  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  String _email, _password;

  Future<void> signIn() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      //Logging in the user w/firebase
      try {
        AuthResult result = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email, password: _password);
        FirebaseUser user = result.user;
      } catch (e) {
        print(e.toString());
      }

      //Moving to next screen
      Navigator.push(context, MaterialPageRoute(builder: (context) => Vault()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rune"),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Text(
                "Sign in",
                style: TextStyle(fontSize: 50.0),
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'Email'),
                      validator: (input) => !input.contains('@')
                          ? "Please enter a valid email"
                          : null,
                      onSaved: (input) => _email = input,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'Password'),
                      validator: (input) => input.length < 6
                          ? 'Password must be at least 6 characters'
                          : null,
                      obscureText: true,
                      onSaved: (input) => _password = input,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    child: RoundedButton(
                      onPress: signIn,
                      color: kPrimaryColor,
                      text: 'Sign in',
                      textColor: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    child: Text(
                      'forgot password?',
                      style: TextStyle(color: kPrimaryColorDark),
                    ),
                  ),
                  SizedBox(
                    height: 70.0,
                  ),
                  Container(
                    child: RoundedButton(
                      onPress: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Signup()));
                      },
                      color: kPrimaryColor,
                      text: 'Create account',
                      textColor: Colors.white,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
