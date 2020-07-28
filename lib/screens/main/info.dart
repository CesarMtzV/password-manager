import 'package:flutter/material.dart';

class Info extends StatefulWidget {
  Info({Key key}) : super(key: key);

  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Info"),
      ),
    );
  }
}
