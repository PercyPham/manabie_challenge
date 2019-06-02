import 'package:flutter/material.dart';
import 'package:manabie_challenge/models/card_data.dart';
import 'card_item.dart';

class CardList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return CardItem(
          cardData: CardData(number: 0, color: Colors.red),
          width: 100,
          margin: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 5,
          ),
        );
      },
    );
  }
}
