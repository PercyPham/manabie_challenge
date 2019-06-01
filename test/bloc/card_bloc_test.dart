import 'package:test/test.dart';
import 'package:flutter/material.dart';
import 'package:manabie_challenge/bloc/bloc.dart';
import 'package:manabie_challenge/models/card_data.dart';

main() {
  CardBloc cardBloc;

  List<CardData> cards = [
    CardData(number: 0, color: Colors.red),
    CardData(number: 0, color: Colors.blue),
    CardData(number: 0, color: Colors.green),
  ];

  testWithPopulatedState({
    List<CardState> additionExpected = const [],
    List<CardEvent> additionEvents = const [],
  }) {
    final List<CardState> expected = [
      CardUninitialized(),
      CardLoaded(cards: cards, chosenCardIndex: null),
    ];
    expected.addAll(additionExpected);

    final List<CardEvent> eventsToBeDispatched = [LoadCard(cards)];
    eventsToBeDispatched.addAll(additionEvents);

    expectLater(
      cardBloc.state,
      emitsInOrder(expected),
    );

    eventsToBeDispatched.forEach((event) {
      cardBloc.dispatch(event);
    });
  }

  group('CardBloc', () {
    setUp(() {
      cardBloc = CardBloc();
    });

    test('initial state is instance of CardUninitialized', () {
      expect(cardBloc.currentState is CardUninitialized, true);
    });

    test('event LoadCard populate state with card datas', () {
      testWithPopulatedState();
    });

    test('event ChooseCard assign chosen card index to state', () {
      final chosenCardIndex = 1;

      testWithPopulatedState(
        additionExpected: [
          CardLoaded(cards: cards, chosenCardIndex: chosenCardIndex)
        ],
        additionEvents: [
          ChooseCard(chosenCardIndex),
        ],
      );
    });
  });
}
