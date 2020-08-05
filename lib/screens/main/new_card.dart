import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:password_manager/models/account.dart';
import 'package:password_manager/providers/account_provider.dart';
import 'package:password_manager/utilities/styles.dart';
import 'package:provider/provider.dart';

class NewCard extends StatefulWidget {
  //final Function addCard;
  final Account account;

  NewCard([this.account]);

  @override
  _NewCardState createState() => _NewCardState();
}

class _NewCardState extends State<NewCard> {
  final emailController = TextEditingController();
  final userController = TextEditingController();
  final passwordController = TextEditingController();
  final urlController = TextEditingController();
  final siteNameController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    userController.dispose();
    passwordController.dispose();
    urlController.dispose();
    siteNameController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    if (widget.account == null) {
      //New account
      emailController.text = "";
      userController.text = "";
      passwordController.text = "";
      urlController.text = "";
      siteNameController.text = "";

      new Future.delayed(Duration.zero, () {
        final accountProvider =
            Provider.of<AccountProvider>(context, listen: false);
        accountProvider.loadValues(Account());
      });
    } else {
      //Existing account
      //Update the controllers
      emailController.text = widget.account.email;
      userController.text = widget.account.userName;
      passwordController.text = widget.account.password;
      urlController.text = widget.account.url;
      siteNameController.text = widget.account.siteName;

      //Update the state
      new Future.delayed(Duration.zero, () {
        final accountProvider =
            Provider.of<AccountProvider>(context, listen: false);
        accountProvider.loadValues(widget.account);
      });
    }
    super.initState();
  }

  // void _submit() {
  //   final isValid = _formKey.currentState.validate();

  //   if (isValid) {
  //     _formKey.currentState.save();
  //     widget.addCard(
  //       emailController.text,
  //       userController.text,
  //       passwordController.text,
  //       urlController.text,
  //       siteNameController.text,
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final accountProvider = Provider.of<AccountProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Account information"),
      ),
      body: Container(
        height: 700,
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
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(color: Colors.white),
                        controller: emailController,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(color: Colors.white),
                        ),
                        validator: (input) {
                          if (input.isEmpty || !input.contains('@')) {
                            return 'Please enter a valid email';
                          } else {
                            return null;
                          }
                        },
                        onChanged: (input) {
                          accountProvider.setEmail(input);
                        },
                      ),
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: 'Username',
                          labelStyle: TextStyle(color: Colors.white),
                        ),
                        controller: userController,
                        onChanged: (input) {
                          accountProvider.setUserName(input);
                        },
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
                        onChanged: (input) {
                          accountProvider.setPassword(input);
                        },
                      ),
                      TextFormField(
                        keyboardType: TextInputType.url,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: 'URL',
                          labelStyle: TextStyle(color: Colors.white),
                        ),
                        controller: urlController,
                        onChanged: (input) {
                          accountProvider.setURL(input);
                        },
                      ),
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: 'Site Name',
                          labelStyle: TextStyle(color: Colors.white),
                        ),
                        controller: siteNameController,
                        onChanged: (input) {
                          accountProvider.setSiteName(input);
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      FlatButton(
                        child: Text(
                          'Save',
                          style: TextStyle(color: Colors.white),
                        ),
                        color: kPrimaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        // onPressed: _submit,
                        onPressed: () {
                          accountProvider.saveProduct();
                          Navigator.of(context).pop();
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      FlatButton(
                        child: Text(
                          'Delete',
                          style: TextStyle(color: Colors.white),
                        ),
                        color: kPrimaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        // onPressed: _submit,
                        onPressed: () {
                          accountProvider
                              .removeAccount(widget.account.accountID);
                          Navigator.of(context).pop();
                        },
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
