import 'package:flutter/material.dart';


import 'dart:math';

import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CircularSlider extends StatefulWidget {
  final Function function;




  CircularSlider({Key key, this.function}) : super(key: key);

  @override
  CircularSliderState createState() => CircularSliderState();
}

class CircularSliderState extends State<CircularSlider> {

final sliderAppearance = CircularSliderAppearance(
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


  @override
  Widget build(BuildContext context) {
    return Container(
 
      alignment: Alignment.center,
      child: SleekCircularSlider(
        min: 0,
        max: 100,
        initialValue: 10,//_currentValue.toDouble(),
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
          //_updateModel(endValue);
        widget.function();// calls method in parent
         
        },
      ),
    );
  }

  methodInChild() => Fluttertoast.showToast(msg: "Method called in child");
}


  