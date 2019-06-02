import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:manabie_challenge/pages/widgets/card_item.dart';

void main() {
  testWidgets(
    'CardItem',
    (WidgetTester tester) async {
      int numOfTimeFunctionWasCalled = 0;
      var onTap = () => numOfTimeFunctionWasCalled++;

      await tester.pumpWidget(
        CardItem(
          key: Key('card_item'),
          onTap: onTap,
        ),
      );

      await tester.tap(find.byKey(Key('card_item')));

      expect(numOfTimeFunctionWasCalled, 1);
    },
  );
}
