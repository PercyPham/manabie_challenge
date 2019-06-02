import 'package:flutter/material.dart';
import 'package:manabie_challenge/models/card_data.dart';
import 'card_item.dart';

class DetailCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CardItem(
      cardData: CardData(number: 0, color: Colors.red),
      width: 200,
      height: 200,
      margin: EdgeInsets.only(top: 10),
    );
  }
}
