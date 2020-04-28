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

import 'package:dough/ui/styles.dart';
import 'package:flutter/material.dart';
import 'package:dough/business_logic/view_models/calculate_screen_viewmodel.dart';
import 'package:dough/services/service_locator.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'choose_favorites.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class CalculateCurrencyScreen extends StatefulWidget {
  @override
  _CalculateCurrencyScreenState createState() =>
      _CalculateCurrencyScreenState();
}

class _CalculateCurrencyScreenState extends State<CalculateCurrencyScreen> {
  CalculateScreenViewModel model = serviceLocator<CalculateScreenViewModel>();
  TextEditingController _controller;

  @override
  void initState() {
    model.loadData();
    _controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CalculateScreenViewModel>(
      create: (context) => model,
      child: Consumer<CalculateScreenViewModel>(
          builder: (context, model, child) => Scaffold(
                body: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                      // mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        _buildButton(model),
                        baseCurrencyTitle(model),
                        _baseCurrencyTextField(model),
                      
                        _quoteCurrencyList(model),
                      ],
                    ),
                  ),
                ),
              )),
    );
  }

  Widget _buildButton(CalculateScreenViewModel model) {
    return Neumorphic(
      style: NeumorphicStyle(
        depth: 20,
        intensity: 0.4,
        color: Styles.neumorphicBaseColor,
      ),
      boxShape:
          NeumorphicBoxShape.roundRect(borderRadius: BorderRadius.circular(8)),
      child: NeumorphicButton(
        boxShape: NeumorphicBoxShape.roundRect(
            borderRadius: BorderRadius.circular(8)),
        style: NeumorphicStyle(
          shape: NeumorphicShape.flat,
          depth: -1,
          color: Styles.neumorphicBaseColor,
        ),
        padding: EdgeInsets.all(12.0),
        child: Icon(
          Icons.favorite_border,
          color: Styles.neumorphicGreyColor,
          semanticLabel: 'Choose favourite currency',
        ),
        onClick: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ChooseFavoriteCurrencyScreen()),
          );
          model.refreshFavorites();
        },
      ),
    );
  }

  Padding baseCurrencyTitle(CalculateScreenViewModel model) {
    return Padding(
      padding: const EdgeInsets.only(left: 32, top: 32, right: 32, bottom: 4),
      child: Text('${model.baseCurrency.longName}',
          style: Styles.baseCurrencyTitleText),
    );
  }


  Widget _baseCurrencyTextField(CalculateScreenViewModel model) {
    return Neumorphic(
      margin: EdgeInsets.only(left: 0, right: 0, top: 4, bottom: 26),
      boxShape: NeumorphicBoxShape.stadium(),
      style: NeumorphicStyle(depth: NeumorphicTheme.embossDepth(context)),
      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 16),
      child: TextField(
        textInputAction: TextInputAction.done,
        enableSuggestions: false,
        autocorrect: false,
        style: TextStyle(fontSize: 20),
        controller: _controller,
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: SizedBox(
              width: 60,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '${model.baseCurrency.flag}',
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
          ),
          labelStyle: TextStyle(fontSize: 22),
          hintStyle: TextStyle(fontSize: 22),
          hintText: 'Amount to exchange',
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(20),
        ),
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          // Only numbers can be entered
          // WhitelistingTextInputFormatter.digitsOnly
        ],
        onChanged: (text) {
          model.calculateExchange(text);
        },
      ),
    );
  }

  Expanded _quoteCurrencyList(CalculateScreenViewModel model) {
    return Expanded(
     child: Neumorphic(
        padding: EdgeInsets.fromLTRB(8, 2, 8, 2),
      style: NeumorphicStyle(
        depth: -11,
        intensity: 0.5,
        color: Styles.neumorphicBaseColor,
      ),
     
      boxShape:
          NeumorphicBoxShape.roundRect(borderRadius: BorderRadius.circular(12)),
      
      child: ListView.builder(
        itemCount: model.quoteCurrencies.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.blueGrey[50],
            elevation: 6,
            borderOnForeground: false,
            child: ListTile(
              leading: SizedBox(
                width: 90,
                child: Text(
                  '${model.quoteCurrencies[index].alphabeticCode}',
                  style: TextStyle(fontSize: 30),
                ),
              ),
              title: Text(model.quoteCurrencies[index].longName),
              subtitle: Text(model.quoteCurrencies[index].amount),
              onTap: () {
                model.setNewBaseCurrency(index);
                _controller.clear();
              },
            ),
          );
        },
      ),
     ),
    );
  }
}
