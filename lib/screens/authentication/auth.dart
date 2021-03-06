import 'package:flutter/material.dart';
import 'package:password_manager/utilities/styles.dart';
import 'package:password_manager/widgets/rounded_button.dart';

class AuthForm extends StatefulWidget {
  final void Function(
    String email,
    String password,
    String userName,
    bool isLogin,
    BuildContext ctx,
  ) submitFn;
  final bool isLoading;

  AuthForm(this.submitFn, this.isLoading);

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  var _isLogin = true;
  var _email = '';
  var _user = '';
  var _password = '';

  void _submit() {
    final isValid = _formKey.currentState.validate();

    //Close the keyboard when the submit button is pressed
    FocusScope.of(context).unfocus();

    if (isValid) {
      _formKey.currentState.save();
      widget.submitFn(
        _email.trim(),
        _password.trim(),
        _user.trim(),
        _isLogin,
        context,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackground,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Text(
                  _isLogin ? "Sign in" : "Create account",
                  style: TextStyle(
                    fontSize: 40.0,
                    color: Colors.white,
                  ),
                ),
              ),
              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        key: ValueKey('email'),
                        validator: (input) {
                          if (input.isEmpty || !input.contains('@')) {
                            return 'Please enter a valid email';
                          } else {
                            return null;
                          }
                        },
                        onSaved: (input) {
                          _email = input;
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: "Email address",
                          labelStyle: kFormStyle,
                          enabledBorder: kFormBorderStyle,
                          focusedBorder: kFormBorderStyle,
                        ),
                        style: kFormInput,
                      ),
                      if (!_isLogin)
                        TextFormField(
                          key: ValueKey('user'),
                          validator: (input) {
                            if (input.isEmpty || input.length < 4) {
                              return 'Please enter at least 4 characters';
                            } else {
                              return null;
                            }
                          },
                          onSaved: (input) {
                            _user = input;
                          },
                          decoration: InputDecoration(
                            labelText: "Username",
                            labelStyle: kFormStyle,
                            enabledBorder: kFormBorderStyle,
                            focusedBorder: kFormBorderStyle,
                          ),
                          style: kFormInput,
                        ),
                      TextFormField(
                        key: ValueKey("password"),
                        validator: (input) {
                          if (input.isEmpty || input.length < 6) {
                            return "Password must be at least 6 characters long";
                          } else {
                            return null;
                          }
                        },
                        onSaved: (input) {
                          _password = input;
                        },
                        decoration: InputDecoration(
                          labelText: "Password",
                          labelStyle: kFormStyle,
                          enabledBorder: kFormBorderStyle,
                          focusedBorder: kFormBorderStyle,
                        ),
                        style: kFormInput,
                        obscureText: true,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      if (widget.isLoading) CircularProgressIndicator(),
                      if (!widget.isLoading)
                        RoundedButton(
                          text: _isLogin ? "Sign In" : "Sign Up",
                          onPress: _submit,
                          color: kPrimaryColor,
                          textColor: Colors.white,
                        ),
                      if (!widget.isLoading)
                        FlatButton(
                          child: Text(
                            _isLogin
                                ? "Create new account"
                                : "I already have an account",
                            style: TextStyle(
                              color: kPrimaryColorLight,
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              _isLogin = !_isLogin;
                            });
                          },
                        )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
