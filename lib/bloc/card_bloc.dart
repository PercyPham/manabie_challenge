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
    if (event is LoadCard) {
      yield CardLoaded(cards: event.cards, chosenCardIndex: null);
    }
  }
}
