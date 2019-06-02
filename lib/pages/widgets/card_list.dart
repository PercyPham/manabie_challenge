import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manabie_challenge/bloc/bloc.dart';
import 'card_list_item.dart';

class CardList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CardBloc _cardBloc = BlocProvider.of<CardBloc>(context);

    return BlocBuilder<CardEvent, CardState>(
      bloc: _cardBloc,
      condition: (_, __) => false,
      builder: (BuildContext context, CardState state) {
        CardLoaded loadedState = state as CardLoaded;

        return ListView.builder(
          key: Key('card_list'),
          scrollDirection: Axis.horizontal,
          itemCount: loadedState.cards.length,
          itemBuilder: (BuildContext context, int index) {
            return CardListItem(index);
          },
        );
      },
    );
  }
}
