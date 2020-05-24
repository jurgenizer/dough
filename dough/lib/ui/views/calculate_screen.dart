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
import 'dart:math';
import 'choose_favorites.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class CircularSliderViewModel {
  final List<Color> pageColors;
  final CircularSliderAppearance appearance;
  final double min;
  final double max;
  final double value;
  final InnerWidget innerWidget;

  CircularSliderViewModel(
      {@required this.pageColors,
      @required this.appearance,
      this.min = 0,
      this.max = 100,
      this.value = 50,
      this.innerWidget});
}

class CalculateCurrencyScreen extends StatefulWidget {
  @override
  _CalculateCurrencyScreenState createState() =>
      _CalculateCurrencyScreenState();
}

class _CalculateCurrencyScreenState extends State<CalculateCurrencyScreen> {
  CalculateScreenViewModel model = serviceLocator<CalculateScreenViewModel>();
 MyObject _object;
  int _currentValue = 0;

  void _generateNewCurrentValue() {
    setState(() {
      
     final randomizer = Random();
   _currentValue = randomizer.nextInt(100);
   
      print('_currentValue = $_currentValue');
    });
  }



  @override
  void initState() {
    model.loadData();
    super.initState();
  }

  void _updateModel(double end) {
    setState(() {
      var currencyAmount = end > 0.0 ? end - 0.0 : 100.0 - 0.0 + end;
      print('currencyAmount = $currencyAmount');
      model.calculateExchange('$currencyAmount');
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CalculateScreenViewModel>(
      create: (context) => model,
      child: Consumer<CalculateScreenViewModel>(
        builder: (context, model, child) => Scaffold(
          appBar: AppBar(
            title: Text('Dough Currency Converter'),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.favorite),
                onPressed: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ChooseFavoriteCurrencyScreen()),
                  );
                  model.refreshFavorites();
                },
              )
            ],
          ),
          body: Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              baseCurrencyTitle(model),
              baseCurrencyCircularSlider(),
              quoteCurrencyList(model),
            ],
          ),
        ),
      ),
    );
  }

// Sleek circular slider

  CircularSliderAppearance sliderAppearance = CircularSliderAppearance(
      customWidths: CustomSliderWidths(
          trackWidth: 4, progressBarWidth: 17, handlerSize: 6, shadowWidth: 0),
      customColors: CustomSliderColors(
        trackColor: Colors.black,
        progressBarColor: Colors.deepOrange,
      ),
      infoProperties: InfoProperties(
          mainLabelStyle: TextStyle(
            fontSize: 40.0,
          ),
          modifier: (double value) {
            final baseMonetaryValue = value.toInt();
            return '$baseMonetaryValue';
          }),
      startAngle: 270,
      angleRange: 360,
      size: 200.0,
      animationEnabled: true);

  Widget baseCurrencyCircularSlider() {
    return Container(
      child: SleekCircularSlider(
        min: 0,
        max: 100,
        initialValue: _currentValue.toDouble(),
        appearance: sliderAppearance,
        onChange: (double value) {
          // callback providing a value while its being changed (with a pan gesture)
          print('onChange value = $value');
          // _updateModel(value);
        },
        onChangeStart: (double startValue) {
          // callback providing a starting value (when a pan gesture starts)
          print('onChange startValue = $startValue');
          //_updateModel(startValue);
         
        },
        onChangeEnd: (double endValue) {
          // callback providing an ending value (when a pan gesture ends)
          print('onChangeEnd endValue = $endValue');
          _updateModel(endValue);
         
        },
      ),
    );
  }

  Padding baseCurrencyTitle(CalculateScreenViewModel model) {
    return Padding(
      padding: const EdgeInsets.only(left: 32, top: 16, right: 32, bottom: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            '${model.baseCurrency.flag}',
            style: TextStyle(fontSize: 30),
          ),
          SizedBox(width: 8),
          Text(
            '${model.baseCurrency.longName}',
            style: TextStyle(fontSize: 25),
          ),
        ],
      ),
    );
  }

  Expanded quoteCurrencyList(CalculateScreenViewModel model) {
    return Expanded(
      child: ListView.builder(
        itemCount: model.quoteCurrencies.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: SizedBox(
                width: 80,
                child: Text(
                  '${model.quoteCurrencies[index].alphabeticCode}',
                  style: TextStyle(fontSize: 30),
                ),
              ),
              title: Text(model.quoteCurrencies[index].longName),
              subtitle: Text(model.quoteCurrencies[index].amount),
              onTap: () {
                model.setNewBaseCurrency(index);
                
                _generateNewCurrentValue();
              },
            ),
          );
        },
      ),
    );
  }
}
