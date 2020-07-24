import 'package:flutter/material.dart';
import 'package:password_manager/utilities/InformationCard.dart';

class CardList extends StatelessWidget {
  final List<Information> cards;

  CardList(this.cards);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: cards.map((tx) {
        return Card(
          color: Color(0xFF484848),
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 15,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(0xFFC62828),
                    width: 2,
                  ),
                ),
                padding: EdgeInsets.all(10),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    tx.siteName,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
