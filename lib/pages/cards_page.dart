import 'package:flutter/material.dart';

class CardsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          'Cards Page',
          key: Key('TemporaryText'),
        ),
      ),
    );
  }
}
