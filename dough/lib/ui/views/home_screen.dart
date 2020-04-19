import 'package:dough/ui/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:dough/ui/views/calculate_screen.dart';
import 'package:dough/ui/views/settings_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  final widgetOptions = [
    CalculateCurrencyScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: widgetOptions.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), title: Text('Settings')),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        //fixedColor: Styles.neumorphicAccentColor,
        selectedItemColor: Styles.neumorphicAccentColor,
        unselectedItemColor: Styles.neumorphicGreyColor,
        elevation: 4.0,
        onTap: onItemTapped,
      ),
    );
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
