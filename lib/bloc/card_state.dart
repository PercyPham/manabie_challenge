import 'package:flutter/foundation.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class CardState extends Equatable {
  CardState([List props = const []]) : super(props);
}

class CardUninitialized extends CardState {
  @override
  String toString() => 'CardUninitialized';
}
