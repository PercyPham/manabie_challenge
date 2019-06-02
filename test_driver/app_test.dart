import 'dart:async';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

import 'card_finder_helper.dart';

void main() {
  group('Manabie Challenge App', () {
    FlutterDriver driver;

    final cardListFinder = find.byValueKey('card_list');

    final firstCardFinder = CardFinder('card_0');
    final secondCardFinder = CardFinder('card_7');
    final detailCardFinder = CardFinder('detail_card');

    // This method has try/catch to make error thrown more readable since the
    //  original error is hard to read and hard to locate line throwing error
    final getTextFrom = (CardFinder cardFinder) async {
      String text;
      try {
        text = await driver.getText(
          cardFinder.value,
          timeout: Duration(seconds: 1),
        );
      } catch (e) {
        throw '> Cannot find text in "${cardFinder.cardKey}"';
      }
      return text;
    };

    final tapOn = (CardFinder finder) async {
      await driver.tap(finder.card);

      var waitForBlocToChangeState =
          () => Future.delayed(Duration(milliseconds: 10));
      await waitForBlocToChangeState();
    };

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test("check flutter driver health", () async {
      Health flutterDriverHealth = await driver.checkHealth();
      expect(flutterDriverHealth.status, HealthStatus.ok);
    });

    test('be able to choose card and increase its number', () async {
      await driver.waitFor(firstCardFinder.card);

      // tap on first card item and show its number in detail card
      expect(await getTextFrom(firstCardFinder), "0");
      await tapOn(firstCardFinder);
      expect(await getTextFrom(detailCardFinder), "0");

      // increase number in first card
      await tapOn(detailCardFinder);
      expect(await getTextFrom(firstCardFinder), "1");
      expect(await getTextFrom(detailCardFinder), "1");

      // increase number in second card
      await driver.scrollUntilVisible(
        cardListFinder,
        secondCardFinder.card,
        dxScroll: -300.0,
      );
      await tapOn(secondCardFinder);
      expect(await getTextFrom(secondCardFinder), "0");
      expect(await getTextFrom(detailCardFinder), "0");
      await tapOn(detailCardFinder);
      await tapOn(detailCardFinder);
      expect(await getTextFrom(secondCardFinder), "2");
      expect(await getTextFrom(detailCardFinder), "2");

      // ensure showing card detail when switching between two cards
      await driver.scrollUntilVisible(
        cardListFinder,
        firstCardFinder.card,
        dxScroll: 300.0,
      );
      await tapOn(firstCardFinder);
      expect(await getTextFrom(detailCardFinder), "1");
      await driver.scrollUntilVisible(
        cardListFinder,
        secondCardFinder.card,
        dxScroll: -300.0,
      );
      await tapOn(secondCardFinder);
      expect(await getTextFrom(detailCardFinder), "2");
    });
  });
}
