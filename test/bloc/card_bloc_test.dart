import 'package:test/test.dart';
import 'package:flutter/material.dart';
import 'package:manabie_challenge/bloc/bloc.dart';
import 'package:manabie_challenge/models/card_data.dart';

main() {
  group('CardBloc', () {
    CardBloc cardBloc;

    setUp(() {
      cardBloc = CardBloc();
    });

    test('initial state is instance of CardUninitialized', () {
      expect(cardBloc.currentState is CardUninitialized, true);
    });

    test('event LoadCard populate state with card datas', () {
      final cards = [
        CardData(number: 0, color: Colors.red),
        CardData(number: 0, color: Colors.blue),
        CardData(number: 0, color: Colors.green),
      ];

      final List<CardState> expected = [
        CardUninitialized(),
        CardLoaded(
          cards: cards,
          chosenCardIndex: null,
        ),
      ];

      expectLater(
        cardBloc.state,
        emitsInOrder(expected),
      );

      cardBloc.dispatch(LoadCard(cards));
    });
  });
}
