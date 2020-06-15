import 'package:flutter_driver/flutter_driver.dart';
import 'package:screenshots/screenshots.dart';
import 'package:test/test.dart';


void main() {
  FlutterDriver driver;
  final config = Config();

   final textFinder = find.byValueKey('currency-code');
  final locateCalculateScreen = find.byValueKey('calculate-screen');
  final locateChooseFavoritesButton = find.byTooltip('Choose fav currencies');

  group('Dough App Test', () {
    // Connect driver
    setUpAll(
      () async {
        driver = await FlutterDriver.connect();
      },
    );
    // Make sure Flutter driver is working
    test('Check flutter driver health', () async {
      Health health = await driver.checkHealth();
      print(health.status);
    });

    test("Check calculate_screen", () async {
      await driver.waitFor(locateCalculateScreen);
      print('Found calculate-screen');
    });

    test(
      'Locate Currency Code',
      () async {
        await screenshot(driver, config, '01-calculate-screen');
        expect(await driver.getText(textFinder), 'EUR');
      },
      timeout: Timeout(
        Duration(seconds: 120),
      ),
    );

  

    // Navigate to choose_favorites.dart

    test('Navigate to choose_favoritest', () async {
      // Push the button and navigate
      await driver.tap(locateChooseFavoritesButton);
      await screenshot(driver, config, '02-choose-favorites');
    });

    // close driver
    tearDownAll(() {
      if (driver != null) {
        driver.close();
      }
    });
  });
}
