/*
 * Copyright (c) 2020 Razeware LLC and Jurgen Geitner
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
 * distribute, sublicense, create a derivative work, and/or sell copies of the
 * Software in any work that is designed, intended, or marketed for pedagogical or
 * instructional purposes related to programming, coding, application development,
 * or information technology.  Permission for such use, copying, modification,
 * merger, publication, distribution, sublicensing, creation of derivative works,
 * or sale is expressly withheld.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

import 'package:flutter/material.dart';
//import 'package:flutter/services.dart' show DeviceOrientation, SystemChrome;
import 'package:dough/services/service_locator.dart';
import 'package:dough/ui/views/calculate_screen.dart';
import 'package:dough/ui/styles.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

void main() {
  /*
   SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  */
  // call setupServiceLocator() early so entire app has access before building UI
  setupServiceLocator();
 
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Styles.materialPrimarySwatchColor,
        scaffoldBackgroundColor: Styles.scaffoldBackground,
      ),
      home: NeumorphicTheme(
        usedTheme: UsedTheme.DARK,
        theme: NeumorphicThemeData(
            defaultTextColor: Styles.neumorphicDefaultTextColor,
            accentColor: Styles.neumorphicAccentColor,
            baseColor: Styles.neumorphicBaseColor,
            depth: 4.0,
            intensity: 0.6,
            lightSource: LightSource.topLeft),
        child: NeumorphicBackground(child: CalculateCurrencyScreen()),
      ),
    );
  }
}

