import 'package:flutter/material.dart';

class DetailCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      width: 200,
      height: 200,
      margin: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 5,
      ),
      child: Center(
        child: Text('1'),
      ),
    );
  }
}
