import 'package:flutter/material.dart';
import 'package:password_manager/utilities/styles.dart';

class About extends StatefulWidget {
  About({Key key}) : super(key: key);

  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Info"),
      ),
      backgroundColor: kBackground,
    );
  }
}
