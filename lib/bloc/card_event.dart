import 'package:flutter/foundation.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class CardEvent extends Equatable {
  CardEvent([List props = const []]) : super(props);
}
