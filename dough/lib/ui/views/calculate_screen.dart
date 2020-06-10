/*
 * LICENSE 1
 * Copyright (c) 2020 Razeware LLC
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

/* 
 * LICENSE 2 for code changes and additions by Jurgen Geitner
 *
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
import 'package:flutter_circular_slider/flutter_circular_slider.dart';
import 'package:flutter_knob/flutter_knob.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:provider/provider.dart';
import 'package:dough/business_logic/view_models/calculate_screen_viewmodel.dart';
import 'package:dough/services/service_locator.dart';
import 'choose_favorites.dart';
import 'about_screen.dart';
import 'privacy_screen.dart';
import 'license_screen.dart';
import 'package:dough/ui/styles.dart';

class CalculateCurrencyScreen extends StatefulWidget {
  @override
  _CalculateCurrencyScreenState createState() =>
      _CalculateCurrencyScreenState();
}

class _CalculateCurrencyScreenState extends State<CalculateCurrencyScreen> {
  CalculateScreenViewModel model = serviceLocator<CalculateScreenViewModel>();

  // knob vars

  double _knobValue = 0.0;
  double _multipliedKnobValue = 0.0;

  void _setKnobValue(double knobValue) {
    print('The initial knobValue is $knobValue');
    _multipliedKnobValue = _multiplier * knobValue;
    print('The multiplied knobValue is $knobValue');
    //

    int currencyIntValueToConvert =
        _multiplier * (endingValue - startingValue) +
            _multipliedKnobValue.toInt();
    String currencyStringValueToConvert = currencyIntValueToConvert.toString();
    model.calculateExchange(currencyStringValueToConvert);
    print(
        'The currencyValueToConvert (Knob) string is $currencyStringValueToConvert');

//
    setState(() {
      _knobValue = knobValue;
      _multipliedKnobValue = _multipliedKnobValue;
    });
  }

  static const double minKnobValue = 0;
  static const double maxKnobValue = 0.99999;

  //

  ValueKey<DateTime> forceRebuild;

  int _multiplier;

  int initCurrencyValue;
  int endCurrencyValue;

  int startingValue;
  int endingValue;

  @override
  void initState() {
    model.loadData();
    _reset();
    super.initState();
  }

  void _reset() {
    setState(() {
      //
      _knobValue = 0.0;
      //
      _multiplier = 1;
      initCurrencyValue = 0;
      endCurrencyValue = 0; //_generateRandomTime();
      startingValue = initCurrencyValue;
      endingValue = endCurrencyValue;
      forceRebuild = ValueKey(DateTime.now());
    });
  }

  void _multiplyByTen() {
    setState(() {
      if (_multiplier < 10000) {
        _multiplier *= 10;
      } else
        _multiplier = _multiplier;
    });
  }

  void _divideByTen() {
    setState(() {
      if (_multiplier >= 10) {
        _multiplier ~/= 10;
      } else
        _multiplier = _multiplier;
    });
  }

  void _calculateExchangeFromDial(int init, int end, int laps) {
    // int currencyIntValueToConvert = _multiplier * (end - init);
    print('The _multipliedKnobValue is $_multipliedKnobValue');
    int currencyIntValueToConvert =
        _multiplier * (end - init) + _multipliedKnobValue.toInt();
    String currencyStringValueToConvert = currencyIntValueToConvert.toString();
    model.calculateExchange(currencyStringValueToConvert);
    print(
        'The currencyValueToConvert (Dial) string is $currencyStringValueToConvert');
    setState(() {
      startingValue = init;
      endingValue = end;
    });
  }

  void _calculateExchangeFromButton(int init, int end) {
    int currencyIntValueToConvert =
        _multiplier * (end - init) + _multipliedKnobValue.toInt();
    String currencyStringValueToConvert = currencyIntValueToConvert.toString();
    model.calculateExchange(currencyStringValueToConvert);
    print(
        'The currencyValueToConvert (Button) string is $currencyStringValueToConvert');
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CalculateScreenViewModel>(
      create: (context) => model,
      child: Consumer<CalculateScreenViewModel>(
        builder: (context, model, child) => Scaffold(
          appBar: AppBar(
            title: Text('Dough'),
            elevation: 0.0,
            centerTitle: true,
            automaticallyImplyLeading: true,
            actions: <Widget>[
              IconButton(
                tooltip: 'Choose fav currencies',
                icon: Icon(Icons.favorite_border),
                onPressed: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ChooseFavoriteCurrencyScreen()),
                  );
                  model.refreshFavorites();
                  _reset();
                },
              )
            ],
          ),
          drawer: Drawer(
            semanticLabel: 'Menu items: about, privacy policy, licenses.',
            child: Container(
              color: Styles.appBackgroundLight,
              child: ListView(
                // Important: Remove any padding from the ListView.
                padding: EdgeInsets.zero,
                children: <Widget>[
                  Container(
                    height: 100.0,
                    child: DrawerHeader(
                      child: Text('Information', style: Styles.drawerTitleText),
                      decoration: BoxDecoration(
                        color: Styles.scaffoldBackground,
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.assignment,
                      color: Styles.rallyPinkColor,
                      size: 24.0,
                    ),
                    title: Text(
                      'About',
                      style: Styles.drawerListTileText,
                    ),
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AboutScreen()),
                      );

                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.security,
                      color: Styles.rallyPinkColor,
                      size: 24.0,
                    ),
                    title: Text('Privacy Policy',
                        style: Styles.drawerListTileText),
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PrivacyScreen()),
                      );
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.account_balance,
                      color: Styles.rallyPinkColor,
                      size: 24.0,
                    ),
                    title: Text('Licenses', style: Styles.drawerListTileText),
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LicenseScreen()),
                      );
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 12, top: 2, right: 12, bottom: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  circularSlider(context),
                  SizedBox(height: 12.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      divideButton(context),
                      fineTuningKnob(context),
                      multiplyButton(context),
                    ],
                  ),
                  SizedBox(height: 12.0),
                  quoteCurrencyList(model),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget divideButton(BuildContext context) {
    return Neumorphic(
      boxShape: NeumorphicBoxShape.circle(),
      style: NeumorphicStyle(
        depth: 19,
        intensity: 0.4,
      ),
      child: NeumorphicButton(
        boxShape: NeumorphicBoxShape.circle(),
        padding: EdgeInsets.all(13.0),
        child: Text('÷10', style: Styles.divideAndMultiplyButtonText),
        onClick: () {
          _divideByTen();
          _calculateExchangeFromButton(startingValue, endingValue);
        },
        style: NeumorphicStyle(
          depth: -1,
          border: NeumorphicBorder(
            isEnabled: true,
            color: Styles.neumorphicBorderColor,
            width: 0.8,
          ),
        ),
      ),
    );
  }

  Widget multiplyButton(BuildContext context) {
    return Neumorphic(
      boxShape: NeumorphicBoxShape.circle(),
      style: NeumorphicStyle(
        depth: 19,
        intensity: 0.4,
      ),
      child: NeumorphicButton(
        boxShape: NeumorphicBoxShape.circle(),
        padding: EdgeInsets.all(13.0),
        child: Text('×10', style: Styles.divideAndMultiplyButtonText),
        onClick: () {
          _multiplyByTen();
          _calculateExchangeFromButton(startingValue, endingValue);
        },
        style: NeumorphicStyle(
          depth: -1,
          border: NeumorphicBorder(
            isEnabled: true,
            color: Styles.neumorphicBorderColor,
            width: 0.8,
          ),
        ),
      ),
    );
  }

  Widget fineTuningKnob(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Knob(
            value: _knobValue,
            color: Styles.rallyPinkColor,
            onChanged: _setKnobValue,
            min: minKnobValue,
            max: maxKnobValue,
            size: 42),
        Slider(
            activeColor: Colors.white,
            inactiveColor: Colors.white30,
            value: _knobValue,
            onChanged: _setKnobValue,
            min: minKnobValue,
            max: maxKnobValue),
        Text(
          'Value: ${_knobValue.toStringAsFixed(3)}',
          style: Styles.minorText,
        ),
      ],
    );
  }

  String _formatIntervalKnobValue() {
    double knobCurrencyValue = _multipliedKnobValue;
    var knobCurrencyValueString = knobCurrencyValue.toStringAsFixed(3);

    return '$knobCurrencyValueString';
  }

  Widget circularSlider(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          key: forceRebuild,
          child: SingleCircularSlider(
            100,
            endCurrencyValue,
            height: 224.0,
            width: 224.0,
            primarySectors: 10,
            secondarySectors: 100,
            baseColor: Styles.sliderBaseColor,
            selectionColor: Styles.sliderSelectionColor,
            handlerColor: Colors.white,
            handlerOutterRadius: 14.0,
            onSelectionChange: _calculateExchangeFromDial,
            showRoundedCapInSelection: true,
            showHandlerOutter: false,
            //sliderStrokeWidth: 12.0,
            child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 16),
                    Text('${_formatIntervalValue(startingValue, endingValue)}',
                        style: Styles.sliderCurrencyValueText),
                    Text('${_formatIntervalKnobValue()}',
                        style: Styles.sliderCurrencyValueText),
                    Text('${model.baseCurrency.alphabeticCode}',
                        style: Styles.sliderCurrencyAlphabeticCode),
                  ],
                )),
            shouldCountLaps: false,
          ),
        ),
      ],
    );
  }

  String _formatIntervalValue(int init, int end) {
    var currencyValue = _multiplier * (end - init);
    return '$currencyValue';
  }

  Expanded quoteCurrencyList(CalculateScreenViewModel model) {
    return Expanded(
      child: Neumorphic(
        margin: EdgeInsets.all(4),
        style: NeumorphicStyle(
          depth: 7,
          intensity: 0.4,
          color: Styles.neumorphicBaseColor,
        ),
        boxShape: NeumorphicBoxShape.roundRect(
          BorderRadius.circular(12),
        ),
        child: Neumorphic(
          style: NeumorphicStyle(
            depth: -11,
            border: NeumorphicBorder(
              isEnabled: true,
              color: Styles.neumorphicBorderColor,
              width: 0.8,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
            child: ListView.builder(
              itemCount: model.quoteCurrencies.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.blueGrey[300],
                  elevation: 1,
                  //shadowColor: Styles.shadowColor,
                  borderOnForeground: false,
                  child: ListTile(
                    leading: SizedBox(
                      width: 76,
                      child: Text(
                        '${model.quoteCurrencies[index].alphabeticCode}',
                        style: Styles.quoteCurrencyAlphabeticCode,
                      ),
                    ),
                    title: Text(model.quoteCurrencies[index].longName),
                    subtitle: Text(model.quoteCurrencies[index].amount),
                    onTap: () {
                      model.setNewBaseCurrency(index);
                      _reset();
                    },
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
