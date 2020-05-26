import 'package:flutter/material.dart';
import 'dart:math';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class CircularSlider extends StatefulWidget {
  final Function function;

  CircularSlider({Key key, this.function}) : super(key: key);

  @override
  CircularSliderState createState() => CircularSliderState();
}

class CircularSliderState extends State<CircularSlider> {
  double _currentValue = 0.1;

  final sliderAppearance = CircularSliderAppearance(
      customWidths: CustomSliderWidths(
          trackWidth: 3, progressBarWidth: 17, handlerSize: 6, shadowWidth: 0),
      customColors: CustomSliderColors(
        trackColor: Colors.black,
        progressBarColor: Colors.brown,
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
      size: 190.0,
      animationEnabled: true);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Neumorphic(
        margin: EdgeInsets.all(8),
        boxShape: NeumorphicBoxShape.circle(),
        child: Neumorphic(
          style: NeumorphicStyle(depth: 14),
          margin: EdgeInsets.all(10),
          boxShape: NeumorphicBoxShape.circle(),
          child: Neumorphic(
            style: NeumorphicStyle(depth: -8),
            margin: EdgeInsets.all(10),
            boxShape: NeumorphicBoxShape.circle(),
            child: Stack(
              fit: StackFit.expand,
              alignment: Alignment.center,
              children: [
                Padding(padding: const EdgeInsets.all(8.0),
                child:
                SleekCircularSlider(
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
                    //_updateModel(endValue);
                    widget.function(endValue); // calls method in parent
                  },
                ),
                ),
              ],
            ),
          ),
        ),
      ),
      
    );
  }

  void methodInChild() {
    //  setState(() {
    final randomizer = Random();
    _currentValue = randomizer.nextDouble();
    print('_currentValue from randomizer = $_currentValue');
    if (_currentValue > 0.5) {
      _currentValue = _currentValue - 0.5;
    }
    print('final _currentValue  = $_currentValue');

    // });
  }
}
