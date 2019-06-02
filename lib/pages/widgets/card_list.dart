import 'package:flutter/material.dart';

class CardList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          color: Colors.red,
          width: 100,
          margin: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 5,
          ),
          child: Center(
            child: Text('1'),
          ),
        );
      },
    );
  }
}
