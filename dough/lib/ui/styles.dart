import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

abstract class Styles {
  static const baseCurrencyTitleText = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 0.9),
   // fontFamily: 'Monserrat',
    fontSize: 24,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
  );

  static const quoteCurrencyAlphabeticCode = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 0.9),
  //  fontFamily: 'Monserrat',
    fontSize: 30,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
  );



  static const minorText = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 0.9),
   // fontFamily: 'Monserrat',
    fontSize: 16,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
  );

  static const materialPrimarySwatchColor = Colors.green;
  static const materialSecondaryColor = Color(0xFFFD5523);
  static const neumorphicAccentColor = Colors.green;
  static const neumorphicBaseColor = Color(0xFFFFFBE6);
  static const neumorphicVariantColor = Colors.greenAccent;
  static const neumorphicDefaultTextColor = Color(0xFF4d4d4d);
  static const neumorphicGreyColor = Color(0xFF4d4d4d);
  static const neumorphicLightGreyColor = Color(0xFFD6D6D6);

  static const neumorphicBlackColor = Colors.black87;

  static const scaffoldBackground = Color(0xFFFFFBE6);

  static const Color searchIconColor = Color.fromRGBO(128, 128, 128, 1);

  static const Color iconBlue = Color(0xff0000ff);
}
