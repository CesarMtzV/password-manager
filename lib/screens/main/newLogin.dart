// Este archivo no se esta usando pero por lo pronto lo estoy utilizando como referfencia
// Cuando lo deje de ulitizar lo borraré

/*

import 'package:flutter/material.dart';
import 'package:password_manager/screens/main/cards_list.dart';
import 'package:password_manager/utilities/InformationCard.dart';
import './new_card.dart';

class NewLogin extends StatefulWidget {
  NewLogin({Key key}) : super(key: key);

  @override
  NewLoginState createState() => NewLoginState();
}

class NewLoginState extends State<NewLogin> {
  final List<Information> _newCardInfo = [
    Information(
      email: 'a0000@itesm.mx',
      user: 'blasefuture',
      password: '123456',
      url: 'www.facebook.com',
      siteName: 'Facebook',
    ),
  ];

  void _addNewCardInfo(
      String email, String user, String password, String url, String siteName) {
    final addCard = Information(
      email: email,
      user: user,
      password: password,
      url: url,
      siteName: siteName,
    );

    setState(() {
      _newCardInfo.add(addCard);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Login"),
      ),
      backgroundColor: Color(0xFF212121),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          NewCard(_addNewCardInfo),
          CardList(_newCardInfo),
        ],
      ),
    );
  }
}

*/
