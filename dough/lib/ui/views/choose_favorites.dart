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
import 'package:dough/business_logic/view_models/choose_favorites_viewmodel.dart';
import 'package:dough/services/service_locator.dart';
import 'package:provider/provider.dart';
import 'package:dough/ui/styles.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class ChooseFavoriteCurrencyScreen extends StatefulWidget {
  @override
  _ChooseFavoriteCurrencyScreenState createState() =>
      _ChooseFavoriteCurrencyScreenState();
}

class _ChooseFavoriteCurrencyScreenState
    extends State<ChooseFavoriteCurrencyScreen> {
  ChooseFavoritesViewModel model = serviceLocator<ChooseFavoritesViewModel>();

  bool checkMark = false;

  @override
  void initState() {
    model.loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return NeumorphicTheme(
      theme: NeumorphicThemeData(depth: 4, intensity: 0.6, baseColor: Styles.neumorphicBaseColor),
      child: Scaffold(
          appBar: AppBar(
          title: Text('Choose Currencies'),
          elevation: 0.0,
        ),
        body: SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.only(left: 12, top: 12, right: 12, bottom: 12),
            child: buildListView(model),
          ),
        ),
      ),
    );
  }

  Widget buildListView(ChooseFavoritesViewModel viewModel) {
    // ChangeNotifier is a Provider that listens for changes
    return ChangeNotifierProvider<ChooseFavoritesViewModel>(
      create: (context) => viewModel,
      // Consumer rebuilds the widget tree below it when there are changes
      child: Consumer<ChooseFavoritesViewModel>(
        builder: (context, model, child) => SafeArea(
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
                  itemCount: model.choices.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.blueGrey[300],
                      elevation: 1,
                      borderOnForeground: false,
                      child: ListTile(
                        leading: SizedBox(
                          width: 50,
                          child: Text(
                            '${model.choices[index].flag}',
                            style: TextStyle(fontSize: 30),
                          ),
                        ),
                        // using the data in model, build the UI
                        title: Text('${model.choices[index].alphabeticCode}'),
                        subtitle: Text('${model.choices[index].longName}'),
                        trailing: (model.choices[index].isFavorite)
                            ? Icon(Icons.favorite,
                                color: Styles.rallyGreenColor)
                            : Icon(Icons.favorite_border),
                        onTap: () {
                          // Call method in model directly
                          model.toggleFavoriteStatus(index);
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
