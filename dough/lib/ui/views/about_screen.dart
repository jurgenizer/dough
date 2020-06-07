import 'package:flutter/material.dart';
import 'package:dough/ui/styles.dart';
import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatelessWidget {
  AboutScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.appBackgroundLight,
      appBar: AppBar(
        title: Text('About'),
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView(
            children: [
              headingSection(context),
              versionSection(context),
              textSection(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget headingSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Text(
        'Dough',
        style: Styles.minorTextHeading,
      ),
    );
  }

  Widget versionSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
      child: Text(
        '1.0.0',
        style: Styles.mediumText,
      ),
    );
  }

  Widget textSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: RichText(
        softWrap: true,
        text: TextSpan(
          text:
              'Dough is a currency convertor app for Android and iOS, built with Flutter. '
              '\n\nI created this design study to improve my Flutter development skills and to explore neumorphic design. '
              '\n\nThe core code and architecture are based on a very good ',
          style: Styles.minorText,
          children: <TextSpan>[
            TextSpan(
                text: 'provider state management tutorial ',
                style: Styles.minorTextLink,
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    launch(
                        'https://www.raywenderlich.com/6373413-state-management-with-provider');
                  }),
            TextSpan(
                text: 'by Jonathan at raywenderlich.com. '
                    '\n\nThank you to ',
                style: Styles.minorText),
            TextSpan(
                text: 'Idean',
                style: Styles.minorTextLink,
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    launch('https://www.idean.com/');
                  }),
            TextSpan(
                text: ' for the Flutter-Neumorphic package.'
                    '\n\nExchange rate api provided by ',
                style: Styles.minorText),
            TextSpan(
                text: 'https://exchangeratesapi.io/',
                style: Styles.minorTextLink,
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    launch('https://exchangeratesapi.io/');
                  }),
            TextSpan(
                text: '\n\nHat-tip also to David Anaya for the neat ',
                style: Styles.minorText),
            TextSpan(
                text: 'Flutter Circular Slider package',
                style: Styles.minorTextLink,
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    launch('https://pub.dev/packages/flutter_circular_slider');
                  }),
          ],
        ),
      ),
    );
  }
}
