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
  static const neumorphicAccentColor = Colors.lime;
  static const neumorphicBaseColor = Colors.blueGrey;
  static const neumorphicBorderColor = Color(0x33000000);
  static const neumorphicDefaultTextColor = Color(0xFF4d4d4d);
 

  static const scaffoldBackground = Colors.blueGrey;

 
}
