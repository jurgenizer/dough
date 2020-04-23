import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:dough/ui/styles.dart';

class NeumorphicBack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
          Icons.arrow_back,
          color: NeumorphicTheme.isUsingDark(context)
              ? Colors.white70
              : Styles.neumorphicGreyColor,
        ),
        onClick: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
