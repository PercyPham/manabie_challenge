import 'package:flutter/material.dart';
import 'widgets/card_list.dart';
import 'widgets/detail_card.dart';

class CardsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: CardList(),
          ),
          Divider(height: 1),
          Flexible(
            flex: 2,
            child: DetailCard(),
          ),
        ],
      ),
    );
  }
}
