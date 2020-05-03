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
import 'package:flutter_circular_slider/flutter_circular_slider.dart';

class CalculateCurrencyScreen extends StatefulWidget {
  @override
  _CalculateCurrencyScreenState createState() =>
      _CalculateCurrencyScreenState();
}

class _CalculateCurrencyScreenState extends State<CalculateCurrencyScreen> {
  CalculateScreenViewModel model = serviceLocator<CalculateScreenViewModel>();
  
  final baseColor = Color.fromRGBO(50, 50, 50, 0.3);
  int initValue;
  int endValue = 0;

  int endCurrencyValue;
  int orderOfMagnitude = 0;

  @override
  void initState() {
    model.loadData();  
    endCurrencyValue = endValue;
    super.initState();
  }

  void _updateLabels(int init, int end, int laps) {
    setState(() {
     
      endCurrencyValue = end;
      var currencyAmount = end > init ? end - init : 100 - init + end;
      orderOfMagnitude = laps;
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
            title: Text('Dough'),
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
              baseCurrencyCircularSlider(model),
              quoteCurrencyList(model),
            ],
          ),
        ),
      ),
    );
  }

  Widget baseCurrencyCircularSlider(CalculateScreenViewModel model) {
    return Container(
      child: SingleCircularSlider(
        100,
        endValue,
        height: 250.0,
        width: 250.0,
        primarySectors: 10,
        secondarySectors: 100,
        baseColor: Color.fromRGBO(50, 50, 50, 0.1),
        selectionColor: baseColor,
        handlerColor: Colors.black87,
        handlerOutterRadius: 14.0,
        onSelectionChange: _updateLabels,
        onSelectionEnd: (a, b, c) => print('onSelectionEnd is $a, $b, $c'),
        showRoundedCapInSelection: true,
        showHandlerOutter: false,
        sliderStrokeWidth: 22.0,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
              Text(
              '${_formatIntervalValue(0, endCurrencyValue)}',
            style: TextStyle(fontSize: 40),
          ),
           SizedBox(width: 8),
            Text(
              '${model.baseCurrency.alphabeticCode}',
              style: TextStyle(fontSize: 40),
            ),
          
          ],
        ),
            
            
            
        
        ),
        shouldCountLaps: false,
      ),
    );
  }

  String _formatIntervalValue(int init, int end) {
    var currencyAmount = end > init ? end - init : 100 - init + end;
    //model.calculateExchange('$currencyAmount');
    return '$currencyAmount';
  }

  Padding baseCurrencyTitle(CalculateScreenViewModel model) {
    return Padding(
        padding: const EdgeInsets.only(left: 32, top: 32, right: 32, bottom: 5),
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
              //_controller.clear();
             
              },
            ),
          );
        },
      ),
    );
  }
}
