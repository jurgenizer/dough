import 'package:flutter/material.dart';
import 'dart:math';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
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

  int initTime;
  int endTime;

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
     
      
      initTime = 0; //_generateRandomTime();
      endTime = _generateRandomTime();
      inBedTime = initTime;
      outBedTime = endTime;
      forceRebuild = ValueKey(DateTime.now());
    });
  }

  void _updateLabels(int init, int end, int laps) {
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
          'How long did you stay in bed?',
          style: TextStyle(color: Colors.white),
        ),
        // SingleCircularSlider(
        //   288,
        //   endTime,
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
            initTime,
            endTime,
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
                    Text('${_formatIntervalTime(inBedTime, outBedTime)}',
                        style: TextStyle(fontSize: 36.0, color: Colors.white)),
                    Text('${_formatDays(days)}',
                        style: TextStyle(
                            fontSize: 28.0,
                            color: Colors.white,
                            fontStyle: FontStyle.italic)),
                  ],
                )),
            shouldCountLaps: true,
          ),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          _formatBedTime('IN THE', inBedTime),
          _formatBedTime('OUT OF', outBedTime),
        ]),
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

  Widget _formatBedTime(String pre, int time) {
    return Column(
      children: [
        Text(pre, style: TextStyle(color: baseColor)),
        Text('BED AT', style: TextStyle(color: baseColor)),
        Text(
          '${_formatTime(time)}',
          style: TextStyle(color: Colors.white),
        )
      ],
    );
  }

  String _formatDays(int days) {
    return days > 0 ? ' (+$days)' : '';
  }

  String _formatTime(int time) {
    if (time == 0 || time == null) {
      return '00:00';
    }
    var hours = time ~/ 12;
    var minutes = (time % 12) * 5;
    return '$hours:$minutes';
  }

  String _formatIntervalTime(int init, int end) {
    var sleepTime = end > init ? end - init : 288 - init + end;
    var hours = sleepTime ~/ 12;
    var minutes = (sleepTime % 12) * 5;
    return '${hours}h${minutes}m';
  }

  int _generateRandomTime() => Random().nextInt(100);
  void methodInChild() {

    

    
  }
}

