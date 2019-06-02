import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  final Function onTap;

  CardItem({Key key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
    );
  }
}
