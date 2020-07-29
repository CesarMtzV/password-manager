import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewCard extends StatelessWidget {
  final Function addCard;
  final emailController = TextEditingController();
  final userController = TextEditingController();
  final passwordController = TextEditingController();
  final urlController = TextEditingController();
  final siteNameController = TextEditingController();

  NewCard(this.addCard);

  final _formKey = GlobalKey<FormState>();

  void _submit() {
    final isValid = _formKey.currentState.validate();

    if (isValid) {
      _formKey.currentState.save();
      addCard(
        emailController.text,
        userController.text,
        passwordController.text,
        urlController.text,
        siteNameController.text,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        height: 1100,
        color: Color(0xFF212121),
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        //style
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(color: Colors.white),
                        ),
                        //controller
                        controller: emailController,
                        //validation
                        validator: (input) {
                          if (input.isEmpty || !input.contains('@')) {
                            return 'Please enter a valid email';
                          } else {
                            return null;
                          }
                        },
                      ),
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: 'Username',
                          labelStyle: TextStyle(color: Colors.white),
                        ),
                        controller: userController,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.url,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(color: Colors.white),
                        ),
                        controller: passwordController,
                        obscureText: true,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.url,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: 'URL',
                          labelStyle: TextStyle(color: Colors.white),
                        ),
                        controller: urlController,
                      ),
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: 'Site Name',
                          labelStyle: TextStyle(color: Colors.white),
                        ),
                        controller: siteNameController,
                      ),
                      FlatButton(
                        child: Text('Add'),
                        textColor: Color(0xFFC62828),
                        onPressed: _submit,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
