import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:password_manager/screens/main/about.dart';
import '../utilities/styles.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key key}) : super(key: key);

  Widget _createHeader() {
    return UserAccountsDrawerHeader(
      accountName: Text("Test"),
      accountEmail: Text("Test@Test.com"),
      currentAccountPicture: CircleAvatar(
        backgroundColor: Colors.grey[900],
        child: Text(
          'V',
          style: TextStyle(fontSize: 40.0),
        ),
      ),
      decoration: BoxDecoration(color: kPrimaryColor),
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
            _createHeader(),
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
