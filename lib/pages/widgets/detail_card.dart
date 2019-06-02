import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manabie_challenge/bloc/bloc.dart';
import 'card_item.dart';

class DetailCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CardBloc _cardBloc = BlocProvider.of<CardBloc>(context);

    return BlocBuilder<CardEvent, CardState>(
      bloc: _cardBloc,
      builder: (BuildContext context, CardState state) {
        if ((state as CardLoaded).chosenCardIndex == null) {
          return Container();
        } else {
          return CardItem(
            cardKey: 'detail_card',
            cardData: (state as CardLoaded)
                .cards[(state as CardLoaded).chosenCardIndex],
            onTap: () {
              _cardBloc.dispatch(
                  IncreaseNumberInCard((state as CardLoaded).chosenCardIndex));
            },
            width: 200,
            height: 200,
            margin: EdgeInsets.only(top: 10),
          );
        }
      },
    );
  }
}
