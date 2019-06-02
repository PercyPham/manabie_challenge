import 'package:flutter_driver/flutter_driver.dart';

class CardFinder {
  final String cardKey;

  CardFinder(this.cardKey);

  SerializableFinder get card => find.byValueKey(cardKey);

  SerializableFinder get value => find.byValueKey('${cardKey}_value');
}
