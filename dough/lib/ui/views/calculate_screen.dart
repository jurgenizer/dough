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
import 'package:dough/business_logic/view_models/calculate_screen_viewmodel.dart';
import 'package:dough/services/service_locator.dart';
import 'package:provider/provider.dart';
import 'choose_favorites.dart';
import 'package:dough/ui/styles.dart';
import 'package:flutter_circular_slider/flutter_circular_slider.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class CalculateCurrencyScreen extends StatefulWidget {
  @override
  _CalculateCurrencyScreenState createState() =>
      _CalculateCurrencyScreenState();
}

class _CalculateCurrencyScreenState extends State<CalculateCurrencyScreen> {
  CalculateScreenViewModel model = serviceLocator<CalculateScreenViewModel>();

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
      _multiplier = 1;
      initCurrencyValue = 0; //_generateRandomTime();
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
    int currencyIntValueToConvert = _multiplier * (end - init);
    String currencyStringValueToConvert = currencyIntValueToConvert.toString();
    model.calculateExchange(currencyStringValueToConvert);
    print('The currencyValueToConvert (Dial) string is $currencyStringValueToConvert');
    setState(() {
      startingValue = init;
      endingValue = end;
    });
  }

    void _calculateExchangeFromButton(int init, int end) {
    int currencyIntValueToConvert = _multiplier * (end - init);
    String currencyStringValueToConvert = currencyIntValueToConvert.toString();
    model.calculateExchange(currencyStringValueToConvert);
    print('The currencyValueToConvert (Button) string is $currencyStringValueToConvert');
  
  }



  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CalculateScreenViewModel>(
      create: (context) => model,
      child: Consumer<CalculateScreenViewModel>(
        builder: (context, model, child) => Scaffold(
          appBar: AppBar(
            title: Text('Dough Currency Converter'),
            elevation: 0.0,
            actions: <Widget>[
              IconButton(
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
          body: SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 8, top: 2, right: 8, bottom: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  circularSlider(context),
                  quoteCurrencyList(model),
                ],
              ),
            ),
          ),
        ),
      ),
    );
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
            height: 210.0,
            width: 210.0,
            primarySectors: 10,
            secondarySectors: 100,
            baseColor: Styles.sliderBaseColor,
            selectionColor: Styles.sliderSelectionColor,
            handlerColor: Colors.white,
            handlerOutterRadius: 12.0,
            onSelectionChange: _calculateExchangeFromDial,
            showRoundedCapInSelection: true,
            showHandlerOutter: false,
            child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 16),
                    Text('${_formatIntervalValue(startingValue, endingValue)}',
                        style: TextStyle(fontSize: 36.0, color: Colors.white)),
                    Text('${model.baseCurrency.alphabeticCode}',
                        style: TextStyle(fontSize: 22.0, color: Colors.white)),
                  ],
                )),
            shouldCountLaps: false,
          ),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          IconButton(
            icon: Icon(Icons.remove_circle_outline),
            color: Styles.sliderSelectionColor,
            tooltip: 'Divide by 10',
            onPressed: () {
              _divideByTen();
               _calculateExchangeFromButton(startingValue, endingValue);
            },
          ),
          FlatButton(
            child: Text('R E S E T'),
            color: Styles.sliderSelectionColor,
            textColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            ),
            onPressed: _reset,
          ),
          IconButton(
            icon: Icon(Icons.add_circle_outline),
            color: Styles.sliderSelectionColor,
            tooltip: 'Multiply by 10',
            onPressed: () {
              _multiplyByTen();
              _calculateExchangeFromButton(startingValue, endingValue);
              
            },
          ),
          Text(
            'Magnitude: $_multiplier',
            style: TextStyle(color: Colors.white),
          ),
        ]),
      ],
    );
  }

  String _formatIntervalValue(int init, int end) {
    // var currencyValue = end > init ? end - init : 100 - init + end;
    var currencyValue = _multiplier * (end - init);
    return '$currencyValue';
  }

  Expanded quoteCurrencyList(CalculateScreenViewModel model) {
    return Expanded(
      child: Neumorphic(
        padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
        style: NeumorphicStyle(
          depth: -10,
          intensity: 0.6,
          color: Styles.neumorphicBaseColor,
        ),
        boxShape: NeumorphicBoxShape.roundRect(
          BorderRadius.circular(12),
        ),
        child: ListView.builder(
          itemCount: model.quoteCurrencies.length,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.blueGrey[300],
              elevation: 5,
              borderOnForeground: false,
              child: ListTile(
                leading: SizedBox(
                  width: 80,
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
    );
  }
}
