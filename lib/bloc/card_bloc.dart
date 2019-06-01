import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:manabie_challenge/models/card_data.dart';
import './bloc.dart';

class CardBloc extends Bloc<CardEvent, CardState> {
  @override
  CardState get initialState => CardUninitialized();

  @override
  Stream<CardState> mapEventToState(
    CardEvent event,
  ) async* {
    CardState newCardState;

    switch (event.runtimeType) {
      case LoadCard:
        newCardState = _mapLoadCardEventToState(event);
        break;
      case ChooseCard:
        newCardState = _mapChooseCardEventToState(
          event,
          currentState as CardLoaded,
        );
        break;
      case IncreaseNumberInCard:
        newCardState = _mapIncreaseNumberInCardEventToState(
          event,
          currentState as CardLoaded,
        );
        break;
    }

    yield newCardState;
  }

  CardState _mapLoadCardEventToState(LoadCard event) =>
      CardLoaded(cards: event.cards, chosenCardIndex: null);

  CardState _mapChooseCardEventToState(
    ChooseCard event,
    CardLoaded currentState,
  ) {
    return currentState.copyWith(chosenCardIndex: event.chosenCardIndex);
  }

  CardState _mapIncreaseNumberInCardEventToState(
    IncreaseNumberInCard event,
    CardLoaded currentState,
  ) {
    final currentChosenCardData = currentState.cards[event.chosenCardIndex];
    final newChosenCardData = CardData(
      color: currentChosenCardData.color,
      number: currentChosenCardData.number + 1,
    );

    final List<CardData> newCardList = [];
    newCardList.addAll(currentState.cards);
    newCardList[event.chosenCardIndex] = newChosenCardData;

    return currentState.copyWith(cards: newCardList);
  }
}
