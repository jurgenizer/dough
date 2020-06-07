import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:dough/main.dart';
import 'package:dough/ui/views/choose_favorites.dart';
import 'package:dough/ui/views/calculate_screen.dart';
import 'package:flutter_circular_slider/flutter_circular_slider.dart';

void main() {
  testWidgets('finds a text widget', (WidgetTester tester) async {
    // Build an App with a Text widget that displays the letter 'H'.
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(body: Text('Information')),
      ),
    );

    // Find a widget that displays 'Information''.
    expect(find.text('Information'), findsOneWidget);
  });

  testWidgets('finds a circular slider instance', (WidgetTester tester) async {
    final divisions = 100;
    final position = 0;
    final childWidget = SingleCircularSlider(divisions, position);
    // Provide the childWidget to the Container.
    await tester.pumpWidget(Container(child: childWidget));

    // Search for the childWidget in the tree and verify it exists.
    expect(find.byWidget(childWidget), findsOneWidget);
  });

  testWidgets('finds a Card instance', (WidgetTester tester) async {
    final childWidget = Card();
    // Provide the childWidget to the Container.
    await tester.pumpWidget(Container(child: childWidget));

    // Search for the childWidget in the tree and verify it exists.
    expect(find.byWidget(childWidget), findsOneWidget);
  });
}
