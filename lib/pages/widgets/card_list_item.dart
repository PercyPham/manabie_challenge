import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manabie_challenge/bloc/bloc.dart';
import 'card_item.dart';

class CardListItem extends StatelessWidget {
  final int cardIndex;

  CardListItem(this.cardIndex);

  @override
  Widget build(BuildContext context) {
    CardBloc _cardBloc = BlocProvider.of<CardBloc>(context);

    return BlocBuilder<CardEvent, CardState>(
      bloc: _cardBloc,
      condition: (previousState, currentState) {
        if (previousState == null) return true;
        return (previousState as CardLoaded).cards[cardIndex] !=
            (currentState as CardLoaded).cards[cardIndex];
      },
      builder: (BuildContext context, CardState state) {
        var cardData = (state as CardLoaded).cards[cardIndex];

        return CardItem(
          cardKey: 'card_$cardIndex',
          cardData: cardData,
          onTap: () {
            _cardBloc.dispatch(ChooseCard(cardIndex));
          },
          width: 100,
          margin: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 5,
          ),
        );
      },
    );
  }
}
