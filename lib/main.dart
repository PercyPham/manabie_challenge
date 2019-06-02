import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manabie_challenge/bloc/bloc.dart';
import 'package:manabie_challenge/data/card_datas.dart';
import 'package:manabie_challenge/manabie_challenge_app.dart';

void main() => runApp(App());

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final CardBloc _cardBloc = CardBloc();

  _AppState() {
    Timer(Duration(seconds: 2), () {
      _cardBloc.dispatch(LoadCard(cards));
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Manabie Challenge',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<CardBloc>(
        bloc: _cardBloc,
        child: ManabieChallengeApp(),
      ),
    );
  }

  @override
  void dispose() {
    _cardBloc.dispose();
    super.dispose();
  }
}
