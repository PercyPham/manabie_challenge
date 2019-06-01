import 'package:flutter/foundation.dart';
import 'package:equatable/equatable.dart';
import 'package:manabie_challenge/models/card_data.dart';

@immutable
abstract class CardState extends Equatable {
  CardState([List props = const []]) : super(props);
}

class CardUninitialized extends CardState {
  @override
  String toString() => 'CardUninitialized';
}

class CardLoaded extends CardState {
  final List<CardData> cards;
  final int chosenCardIndex;

  CardLoaded({this.cards, this.chosenCardIndex})
      : super([cards, chosenCardIndex]);

  CardLoaded copyWith({
    List<CardData> cards,
    int chosenCardIndex,
  }) {
    return CardLoaded(
      cards: cards ?? this.cards,
      chosenCardIndex: chosenCardIndex ?? this.chosenCardIndex,
    );
  }

  @override
  String toString() =>
      'CardLoaded { cards: ${cards.length}, chosenCardIndex: $chosenCardIndex }';
}
