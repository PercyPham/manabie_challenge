import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manabie_challenge/bloc/bloc.dart';
import 'package:manabie_challenge/models/card_data.dart';

import 'card_item.dart';

class DetailCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CardBloc _cardBloc = BlocProvider.of<CardBloc>(context);

    return BlocBuilder<CardEvent, CardState>(
      bloc: _cardBloc,
      builder: (BuildContext context, CardState state) {
        CardLoaded loadedState = state as CardLoaded;
        int chosenCardIndex = loadedState?.chosenCardIndex;

        bool hasChosenCard = chosenCardIndex != null;
        if (!hasChosenCard) return Container();

        CardData chosenCardData = loadedState.cards[chosenCardIndex];
        return _buildDetailCard(
          chosenCardData,
          onTap: () {
            _cardBloc.dispatch(IncreaseNumberInCard(chosenCardIndex));
          },
        );
      },
    );
  }

  Widget _buildDetailCard(CardData cardData, {Function onTap}) {
    return CardItem(
      cardKey: 'detail_card',
      cardData: cardData,
      onTap: onTap,
      width: 200,
      height: 200,
      margin: EdgeInsets.only(top: 10),
    );
  }
}
