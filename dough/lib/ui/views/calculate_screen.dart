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
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:dough/ui/widgets/circular_slider.dart';

class CalculateCurrencyScreen extends StatefulWidget {
  @override
  _CalculateCurrencyScreenState createState() =>
      _CalculateCurrencyScreenState();
}

class _CalculateCurrencyScreenState extends State<CalculateCurrencyScreen> {
  CalculateScreenViewModel model = serviceLocator<CalculateScreenViewModel>();
  final GlobalKey<CircularSliderState> _key = GlobalKey();

  void methodInParent(double end) {
    setState(() {
      var currencyAmount = end > 0.0 ? end - 0.0 : 100.0 - 0.0 + end;
      print('currencyAmount = $currencyAmount');
      model.calculateExchange('$currencyAmount');
    });
  }

  @override
  void initState() {
    model.loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CalculateScreenViewModel>(
      create: (context) => model,
      child: Consumer<CalculateScreenViewModel>(
        builder: (context, model, child) => Scaffold(
          appBar: AppBar(
            title: Text('dough currency converter'),
            //backgroundColor: Styles.scaffoldBackground,
            elevation: 0.0,
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.check),
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
          body: Padding(
      padding: const EdgeInsets.only(left: 8, top: 2, right: 8, bottom: 2),
      child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              baseCurrencyTitle(model),
              //Circular Slider in the widgets folder
               ConstrainedBox(
         constraints: new BoxConstraints(
    minHeight: 140.0,
    maxHeight: 200.0,
  ),
  child:Expanded(
                child: CircularSlider(
                  key: _key,
                  function: methodInParent,
                ),
              ),
               ),
              quoteCurrencyList(model),
            ],
          ),
        ),
        ),
      ),
    );
  }

  Padding baseCurrencyTitle(CalculateScreenViewModel model) {
    return Padding(
      padding: const EdgeInsets.only(left: 32, top: 4, right: 32, bottom: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            '${model.baseCurrency.flag}',
            style: TextStyle(fontSize: 28),
          ),
          SizedBox(width: 8),
          Text(
            '${model.baseCurrency.longName}',
            style: Styles.baseCurrencyTitleText,
          ),
        ],
      ),
    );
  }

  Expanded quoteCurrencyList(CalculateScreenViewModel model) {
    return Expanded(
      child: Neumorphic(
        padding: EdgeInsets.fromLTRB(8, 2, 8, 2),
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
              color: Colors.greenAccent,
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
                  _key.currentState.methodInChild(); // calls method in child
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
