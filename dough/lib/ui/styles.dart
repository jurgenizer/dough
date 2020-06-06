/* 
 * MIT License
 *
 * Copyright (c) 2020 Jurgen Geitner
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE. 
 */

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

abstract class Styles {
  
  static const drawerTitleText = TextStyle(
    color: Colors.white,
    fontSize: 24,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
  );

  static const drawerListTileText = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 0.9),
    fontSize: 18,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
  );

  static const quoteCurrencyAlphabeticCode = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 0.9),
    fontSize: 30,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
  );

    static const minorTextHeading = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 0.9),
    fontSize: 22,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
  );



  static const minorText = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 0.9),
    fontSize: 15,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
  );

        static const mediumText = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 0.9),
    fontSize: 20,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
  );

  static const minorTextLink = TextStyle(
    color: Color(0xFFFF6F00),
    fontSize: 15,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
    //decoration: TextDecoration.underline,
  );

  static const sliderSelectionColor = Color.fromRGBO(255, 255, 255, 0.3);
  static const sliderBaseColor = Color.fromRGBO(255, 255, 255, 0.1);
  static const materialPrimarySwatchColor = Colors.blueGrey;
//static const rallyGreenColor = Color(0xFF05766C);
  static const rallyOrangeColor = Color(0xFFFF6F00);


  static const neumorphicAccentColor = Color(0xFF1EB980);
  static const neumorphicBaseColor = Colors.blueGrey;
  static const neumorphicBorderColor = Color(0x33000000);
  static const neumorphicDefaultTextColor = Color(0xFF4d4d4d);

  static const shadowColor = Colors.black12;
  static const scaffoldBackground = Colors.blueGrey;
  //static const scaffoldBackgroundAboutScreen = Color(0xFF90A4AE);

  static const appBackgroundLight = Color(0xffd0d0d0);
}
