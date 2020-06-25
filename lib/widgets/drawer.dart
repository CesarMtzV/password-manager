import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key key}) : super(key: key);

  Widget _createHeader(){
    return UserAccountsDrawerHeader(
      accountName: Text("Cesar Martinez"),
        accountEmail: Text("mc.cesar.art@gmail.com"),
        currentAccountPicture: CircleAvatar(
          backgroundColor: Colors.grey[900],
          child: Text(
            'C', 
            style: TextStyle(
              fontSize: 40.0
            ),
          ),
        ),
    );
  }

  Widget _createDrawerItem({IconData icon, String text, GestureTapCallback onTap}){
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _createHeader(),
          _createDrawerItem(icon: Icons.lock, text: 'Vault'),
          _createDrawerItem(icon: Icons.account_circle, text: 'Account'),
          _createDrawerItem(icon: Icons.settings, text: 'Settings'),
          _createDrawerItem(icon: Icons.info, text: 'Info'),
          _createDrawerItem(icon: Icons.exit_to_app, text: 'Sign Out'),
          ListTile(
            title: Text('0.0.1'),
            onTap: (){},
          )
        ],
      ),
    );
  }
}