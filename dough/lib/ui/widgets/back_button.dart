import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:dough/ui/styles.dart';

class NeumorphicBack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      boxShape: NeumorphicBoxShape.circle(),
      padding: EdgeInsets.all(18),
      style: NeumorphicStyle(
        color: Styles.neumorphicBaseColor,
        shape: NeumorphicShape.flat,
        depth:4,
      ),
      child: Icon(
        Icons.arrow_back,
        color: NeumorphicTheme.isUsingDark(context) ? Colors.white70 : Colors.black87,
      ),
      onClick: () {
        Navigator.of(context).pop();
      },
    );
  }
}
