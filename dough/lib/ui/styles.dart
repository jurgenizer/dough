import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

abstract class Styles {
  static const baseCurrencyTitleText = TextStyle(
    color: Color(0xFF4d4d4d), 
    fontSize: 25,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
  );

  static const bottomNavigationBarText = TextStyle(
  fontSize: 19, 
  fontWeight: FontWeight.normal,
  );

  static const cardTitleText = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 0.9),
    fontFamily: 'NotoSans',
    fontSize: 32,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
  );

  static const neumorphicAccentColor = Colors.deepOrange;
  static const neumorphicBaseColor = Color(0xFFF8F9FC);
  static const neumorphicVariantColor = Colors.deepOrangeAccent;
  static const neumorphicDefaultTextColor = Color(0xFF4d4d4d);
  static const neumorphicGreyColor = Color(0xFF4d4d4d);
  static const neumorphicLightGreyColor = Color(0xFFD6D6D6);
   
  static const neumorphicBlackColor = Colors.black87;

static const scaffoldBackground = Color(0xFFF8F9FC);

  static const Color searchIconColor = Color.fromRGBO(128, 128, 128, 1);

  static const Color iconBlue = Color(0xff0000ff);
}
