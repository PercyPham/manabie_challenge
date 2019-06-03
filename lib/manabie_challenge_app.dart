import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manabie_challenge/bloc/bloc.dart';

import 'package:manabie_challenge/pages/loading_page/loading_page.dart';
import 'package:manabie_challenge/pages/cards_page/cards_page.dart';

class ManabieChallengeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CardBloc _cardBloc = BlocProvider.of<CardBloc>(context);

    return BlocBuilder<CardEvent, CardState>(
      bloc: _cardBloc,
      condition: (previousState, currentState) {
        return previousState.runtimeType != currentState.runtimeType;
      },
      builder: (BuildContext context, CardState state) {
        if (state is CardUninitialized) {
          return LoadingPage();
        } else {
          return CardsPage();
        }
      },
    );
  }
}
