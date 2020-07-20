import 'package:flutter/material.dart';

class NewCard extends StatelessWidget {
  final Function addCard;
  final emailController = TextEditingController();
  final userController = TextEditingController();
  final passwordController = TextEditingController();
  final urlController = TextEditingController();
  final siteNameController = TextEditingController();

  NewCard(this.addCard);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        color: Color(0xFF212121),
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(color: Colors.white),
              ),
              controller: emailController,
            ),
            TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Username',
                labelStyle: TextStyle(color: Colors.white),
              ),
              controller: userController,
            ),
            TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(color: Colors.white),
              ),
              controller: passwordController,
            ),
            TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'URL',
                labelStyle: TextStyle(color: Colors.white),
              ),
              controller: urlController,
            ),
            TextField(
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
              onPressed: () {
                addCard(
                  emailController.text,
                  userController.text,
                  passwordController.text,
                  urlController.text,
                  siteNameController.text,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
