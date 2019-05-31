import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Manabie Challenge App', () {
    FlutterDriver driver;

    final temporaryTextFinder = find.byValueKey('TemporaryText');

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

    test('smoke test for current simple temporary page', () async {
      expect(await driver.getText(temporaryTextFinder), 'Cards Page');
    });
  });
}
