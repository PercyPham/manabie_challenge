import 'package:flutter_driver/flutter_driver.dart';

class CardFinder {
  final String cardKey;

  CardFinder(this.cardKey);

  SerializableFinder get cardFinder => find.byValueKey(cardKey);

  SerializableFinder get valueFinder => find.byValueKey('${cardKey}_value');
}
