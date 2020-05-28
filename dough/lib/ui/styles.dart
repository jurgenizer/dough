import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

abstract class Styles {
  static const baseCurrencyTitleText = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 0.9),
    fontSize: 24,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
  );

  static const quoteCurrencyAlphabeticCode = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 0.9),
    fontSize: 30,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
  );

  static const minorText = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 0.9),
    fontSize: 16,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
  );

  static const sliderSelectionColor = Color.fromRGBO(255, 255, 255, 0.3);
  static const sliderBaseColor = Color.fromRGBO(255, 255, 255, 0.1);
  static const materialPrimarySwatchColor = Colors.blueGrey;
  static const materialSecondaryColor = Color(0xFFFD5523);
  static const neumorphicAccentColor = Colors.green;
  static const neumorphicBaseColor = Colors.blueGrey;
  static const neumorphicDefaultTextColor = Color(0xFF4d4d4d);
  static const neumorphicGreyColor = Color(0xFF4d4d4d);
  static const neumorphicLightGreyColor = Color(0xFFD6D6D6);

  static const neumorphicBlackColor = Colors.black87;

  static const scaffoldBackground = Colors.blueGrey;

  static const Color searchIconColor = Color.fromRGBO(128, 128, 128, 1);

  static const Color iconBlue = Color(0xff0000ff);
}
