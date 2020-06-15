import 'package:flutter_driver/flutter_driver.dart';
import 'package:screenshots/screenshots.dart';
import 'package:test/test.dart';

void main() {
  FlutterDriver driver;
  final config = Config();
  
  //final dialFinder = find.byType('SingleCircularSlider');
  final textFinder = find.byValueKey('currency-code');
final locateCalculateScreen =  find.byValueKey('calculate-screen');

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
  

    // Open Information drawer
    /*
    test('Check information drawer opens', () async {
      final SerializableFinder locateDrawer =
          find.byValueKey('information-drawer');
      // Open the drawer
      await driver.tap(locateDrawer);
      await driver.scroll(locateDrawer, -300, 0, Duration(milliseconds: 500));
    });
    */
 
    test(
      'Locate Currency Code',
      () async {
        await screenshot(driver, config, 'testing');
        expect(await driver.getText(textFinder), 'EUR');
      },
      timeout: Timeout(
        Duration(seconds: 120),
      ),
    );

    // close driver
    tearDownAll(() {
      if (driver != null) {
        driver.close();
      }
    });
  });
}
