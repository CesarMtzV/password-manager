import 'package:flutter/material.dart';
import '../utilities/accountCard.dart';

class UserAccounts extends StatefulWidget {
  UserAccounts({Key key}) : super(key: key);

  _UserAccountsState createState() => _UserAccountsState();
}

class _UserAccountsState extends State<UserAccounts> {
  final List<AccountCard> _userAccounts = [
    AccountCard(email: 'mcassassin12@gmail.com', siteName: 'Playstation'),
    AccountCard(email: 'mcassassin12@gmail.com', siteName: 'Xbox'),
  ];

  void _addNewAccount(String naSiteName, naEmail) {
    final newNA = AccountCard(email: naEmail, siteName: naSiteName);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[],
    );
  }
}
