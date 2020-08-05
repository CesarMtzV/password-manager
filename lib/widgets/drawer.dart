import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:password_manager/models/account.dart';
import 'package:password_manager/screens/main/about.dart';
import '../utilities/styles.dart';

class AppDrawer extends StatelessWidget {
  Widget _createHead() {
    return StreamBuilder(
      stream: Firestore.instance.collection('users').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return CircularProgressIndicator();
        return UserAccountsDrawerHeader(
          accountName: Text(snapshot.data.documents[0]['username']),
          accountEmail: Text(snapshot.data.documents[0]['email']),
          currentAccountPicture: CircleAvatar(
            backgroundColor: Colors.grey[900],
            child: Text(
              'T',
              style: TextStyle(fontSize: 40.0),
            ),
          ),
          decoration: BoxDecoration(color: kPrimaryColor),
        );
      },
    );
  }

  Widget _createDrawerItem(
      {IconData icon, String text, GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(
            icon,
            color: Colors.white,
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(
              text,
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: kBackgroundLight,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            _createHead(),
            _createDrawerItem(
                icon: Icons.info,
                text: 'About',
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => About()));
                }),
            ListTile(
              title: Row(
                children: <Widget>[
                  Icon(
                    Icons.exit_to_app,
                    color: Colors.white,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      "Sign out",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
              onTap: () {
                FirebaseAuth.instance.signOut();
              },
            ),
            ListTile(
              title: Text('v.PRE-ALPHA'),
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
