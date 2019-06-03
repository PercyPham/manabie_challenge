import 'dart:async';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

import 'card_finder_helper.dart';

void main() {
  group('Manabie Challenge App', () {
    FlutterDriver driver;

    final cardListFinder = find.byValueKey('card_list');

    final firstCard = CardFinder('card_0');
    final seventhCard = CardFinder('card_6');
    final detailCard = CardFinder('detail_card');

    // This method has try/catch to make error thrown more readable since the
    //  original error is hard to read and hard to locate line throwing error
    final getTextFrom = (CardFinder card) async {
      String text;
      try {
        text = await driver.getText(
          card.valueFinder,
          timeout: Duration(seconds: 1),
        );
      } catch (e) {
        throw '> Cannot find text in "${card.cardKey}"';
      }
      return text;
    };

    final tapOn = (CardFinder card) => driver.tap(card.cardFinder);

    final waitForBlocToChangeState =
        () => Future.delayed(Duration(milliseconds: 50));

    final scrollToFind = (CardFinder card, {double dxScroll}) {
      return driver.scrollUntilVisible(
        cardListFinder,
        card.cardFinder,
        dxScroll: dxScroll,
      );
    };

    waitForFirstCardToShowUp() async {
      await driver.waitFor(firstCard.cardFinder);
    }

    chooseFirstCardToSeeItsNumberInDetailCard({int detailCardWillShow}) async {
      await tapOn(firstCard);
      await waitForBlocToChangeState();
      expect(await getTextFrom(firstCard), '$detailCardWillShow');
      expect(await getTextFrom(detailCard), '$detailCardWillShow');
    }

    increaseFirstCardNumberByOne({int detailCardWillShow}) async {
      await tapOn(detailCard);
      await waitForBlocToChangeState();
      expect(await getTextFrom(firstCard), '$detailCardWillShow');
      expect(await getTextFrom(detailCard), '$detailCardWillShow');
    }

    chooseSeventhCardToSeeItsNumberInDetailCard(
        {int detailCardWillShow}) async {
      await scrollToFind(seventhCard, dxScroll: -300.0);
      await tapOn(seventhCard);
      await waitForBlocToChangeState();
      expect(await getTextFrom(seventhCard), '$detailCardWillShow');
      expect(await getTextFrom(detailCard), '$detailCardWillShow');
    }

    increaseSeventhCardNumberByTwo({int detailCardWillShow}) async {
      await tapOn(detailCard);
      await tapOn(detailCard);
      await waitForBlocToChangeState();
      expect(await getTextFrom(seventhCard), '$detailCardWillShow');
      expect(await getTextFrom(detailCard), '$detailCardWillShow');
    }

    chooseFirstCardToEnsureItsNumberDidNotChange(
        {int detailCardWillShow}) async {
      await scrollToFind(firstCard, dxScroll: 300.0);
      await tapOn(firstCard);
      await waitForBlocToChangeState();
      expect(await getTextFrom(firstCard), '$detailCardWillShow');
      expect(await getTextFrom(detailCard), '$detailCardWillShow');
    }

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
      await waitForFirstCardToShowUp();

      await chooseFirstCardToSeeItsNumberInDetailCard(detailCardWillShow: 0);

      await increaseFirstCardNumberByOne(detailCardWillShow: 1);

      await chooseSeventhCardToSeeItsNumberInDetailCard(detailCardWillShow: 0);

      await increaseSeventhCardNumberByTwo(detailCardWillShow: 2);

      await chooseFirstCardToEnsureItsNumberDidNotChange(detailCardWillShow: 1);
    });
  });
}
