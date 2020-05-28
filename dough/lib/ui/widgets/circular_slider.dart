import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter_circular_slider/flutter_circular_slider.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:dough/ui/styles.dart';

class CircularSlider extends StatefulWidget {
  final Function function;

  CircularSlider({Key key, this.function}) : super(key: key);

  @override
  CircularSliderState createState() => CircularSliderState();
}

class CircularSliderState extends State<CircularSlider> {
  ValueKey<DateTime> forceRebuild;
  final baseColor = Color.fromRGBO(255, 255, 255, 0.3);

  int initCurrencyValue;
  int endCurrencyValue;

  int inBedTime;
  int outBedTime;
  int days = 0;

  @override
  void initState() {
    super.initState();
    _shuffle();
  }

  void _shuffle() {
    setState(() {
      initCurrencyValue = 0; //_generateRandomTime();
      endCurrencyValue = _generateRandomTime();
      inBedTime = initCurrencyValue;
      outBedTime = endCurrencyValue;
      forceRebuild = ValueKey(DateTime.now());
    });
  }

  void _updateLabels(int init, int end, int laps) {
    widget.function(end);
    setState(() {
      inBedTime = init;
      outBedTime = end;
      days = laps;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          'How much to convert?',
          style: TextStyle(color: Colors.white),
        ),
        // SingleCircularSlider(
        //   288,
        //   endCurrencyValue,
        //   height: 220.0,
        //   width: 220.0,
        //   primarySectors: 6,
        //   secondarySectors: 24,
        //   baseColor: Color.fromRGBO(255, 255, 255, 0.1),
        //   selectionColor: baseColor,
        //   handlerColor: Colors.white,
        //   handlerOutterRadius: 12.0,
        //   onSelectionChange: _updateLabels,
        //   showRoundedCapInSelection: true,
        //   showHandlerOutter: false,
        //   child: Padding(
        //       padding: const EdgeInsets.all(42.0),
        //       child: Column(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: [
        //           SizedBox(height: 20),
        //           Text('${_formatIntervalTime(inBedTime, outBedTime)}',
        //               style: TextStyle(fontSize: 24.0, color: Colors.white)),
        //           Text('${_formatDays(days)}',
        //               style: TextStyle(
        //                   fontSize: 16.0,
        //                   color: Colors.white,
        //                   fontStyle: FontStyle.italic)),
        //         ],
        //       )),
        //   shouldCountLaps: true,
        // ),
        Container(
          key: forceRebuild,
          child: DoubleCircularSlider(
            100,
            initCurrencyValue,
            endCurrencyValue,
            height: 260.0,
            width: 260.0,
            primarySectors: 10,
            secondarySectors: 100,
            baseColor: Color.fromRGBO(255, 255, 255, 0.1),
            selectionColor: baseColor,
            handlerColor: Colors.white,
            handlerOutterRadius: 12.0,
            onSelectionChange: _updateLabels,
            onSelectionEnd: (a, b, c) => print('onSelectionEnd $a $b $c'),
            sliderStrokeWidth: 12.0,
            child: Padding(
                padding: const EdgeInsets.all(42.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 30),
                    Text('Money',
                        style: TextStyle(fontSize: 36.0, color: Colors.white)),
                    Text('amount',
                        style: TextStyle(
                            fontSize: 28.0,
                            color: Colors.white,
                            fontStyle: FontStyle.italic)),
                  ],
                )),
            shouldCountLaps: true,
          ),
        ),
        FlatButton(
          child: Text('S H U F F L E'),
          color: baseColor,
          textColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
          onPressed: _shuffle,
        ),
      ],
    );
  }

  int _generateRandomTime() => Random().nextInt(100);
  void methodInChild() {}
}
