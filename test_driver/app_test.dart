import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Manabie Challenge App', () {
    FlutterDriver driver;

    final firstCardFinder = find.byValueKey('card_0');
    final secondCardFinder = find.byValueKey('card_1');
    final detailCardFinder = find.byValueKey("detail_card");

    // This method has try/catch to make error thrown more readable since the
    //  original error is hard to read and hard to locate line throwing error
    final getTextFrom = (finder) async {
      String text;
      try {
        text = await driver.getText(finder, timeout: Duration(seconds: 1));
      } catch (e) {
        throw '> Cannot find text in "${finder?.keyValueString}"';
      }
      return text;
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
      // tap on first card item and show its number in detail card
      expect(await getTextFrom(firstCardFinder), "0");
      await driver.tap(firstCardFinder);
      expect(await getTextFrom(detailCardFinder), "0");

      // increase number in first card
      await driver.tap(detailCardFinder);
      expect(await getTextFrom(firstCardFinder), "1");
      expect(await getTextFrom(detailCardFinder), "1");

      // increase number in second card
      await driver.tap(secondCardFinder);
      expect(await getTextFrom(secondCardFinder), "0");
      expect(await getTextFrom(detailCardFinder), "0");
      await driver.tap(detailCardFinder);
      await driver.tap(detailCardFinder);
      expect(await getTextFrom(secondCardFinder), "2");
      expect(await getTextFrom(detailCardFinder), "2");

      // ensure showing card detail when switching between two cards
      await driver.tap(firstCardFinder);
      expect(await getTextFrom(detailCardFinder), "1");
      await driver.tap(secondCardFinder);
      expect(await getTextFrom(detailCardFinder), "2");
    });
  });
}
