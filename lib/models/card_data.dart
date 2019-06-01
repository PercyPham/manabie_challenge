import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

class CardData extends Equatable {
  final int number;
  final Color color;

  CardData({
    @required this.number,
    @required this.color,
  }) : super([number, color]);

  @override
  String toString() => 'CardData { number: $number, color: $color }';
}
