import 'package:flutter/material.dart';
import 'package:manabie_challenge/pages/cards_page.dart';

void main() => runApp(ManabieChallengeApp());

class ManabieChallengeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Manabie Challenge',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CardsPage(),
    );
  }
}
