import 'package:flutter/material.dart';
import 'package:manabie_challenge/models/card_data.dart';

class CardItem extends StatelessWidget {
  final String cardKey;
  final CardData cardData;
  final Function onTap;
  final double width;
  final double height;
  final EdgeInsetsGeometry margin;

  CardItem({
    this.cardKey,
    this.cardData,
    this.onTap,
    this.width,
    this.height,
    this.margin,
  }) : super(key: Key(cardKey));

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: cardData?.color,
        width: width,
        height: height,
        margin: margin,
        child: _buildCenterNumber(cardData?.number),
      ),
    );
  }

  Widget _buildCenterNumber(int number) {
    return Center(
      child: Text(
        '$number',
        key: Key('${cardKey}_value'),
        textDirection: TextDirection.ltr,
        style: TextStyle(fontSize: 40),
      ),
    );
  }
}
