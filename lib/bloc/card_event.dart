import 'package:flutter/foundation.dart';
import 'package:equatable/equatable.dart';
import 'package:manabie_challenge/models/card_data.dart';

@immutable
abstract class CardEvent extends Equatable {
  CardEvent([List props = const []]) : super(props);
}

class LoadCard extends CardEvent {
  final List<CardData> cards;

  LoadCard(this.cards) : super([cards]);

  @override
  String toString() => 'LoadCard { cards: ${cards.length} }';
}

class ChooseCard extends CardEvent {
  final int chosenCardIndex;

  ChooseCard(this.chosenCardIndex) : super([chosenCardIndex]);

  @override
  String toString() => 'ChooseCard { chosenCardIndex: $chosenCardIndex }';
}

class IncreaseNumberInCard extends CardEvent {
  final int chosenCardIndex;

  IncreaseNumberInCard(this.chosenCardIndex) : super([chosenCardIndex]);

  @override
  String toString() =>
      'IncreaseNumberInCard { chosenCardIndex: $chosenCardIndex }';
}
