import 'package:flutter/material.dart';
import 'package:dough/ui/styles.dart';
import 'package:dough/ui/widgets/about_icon.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatelessWidget {
  AboutScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.scaffoldBackgroundAboutScreen,
      appBar: AppBar(
        title: Text('About'),
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView(
            children: [
              textSection(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget textSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Text(
        'Dough is a currency convertor app for Android and iOS, made with Flutter. '
        '\nI built this design study to explore neumorphism and improve my Flutter development skills. '
        '\nThe core code and architechture are based on this very good provider state management [tutorial](https://www.raywenderlich.com/6373413-state-management-with-provider) by Jonathan at [raywenderlich.com](https://www.raywenderlich.com). '
        '\nThank you to [Idean](https://www.idean.com/) for the Flutter-Neumorphic package, available [here](https://pub.dev/packages/flutter_neumorphic). '
        '\nExchange rate api provided by [https://exchangeratesapi.io/](https://exchangeratesapi.io/) - much appreciated, thank you! '
        '\nHat-tip also to [David Anaya](https://github.com/davidanaya/flutter-circular-slider) for the neat Flutter Circular Slider [package](https://pub.dev/packages/flutter_circular_slider).',
        softWrap: true,
        style: Styles.minorText,
      ),
    );
  }
}
