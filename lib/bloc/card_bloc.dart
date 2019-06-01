import 'dart:async';
import 'package:bloc/bloc.dart';
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
}
