import 'package:app_ong/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Should display the main image when Login is opened',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Login()));
    final mainImage = find.byType(Image);
    expect(mainImage, findsOneWidget);
  });

  testWidgets('Should display the TextField when Login is opened',
      (tester) async {
    await tester.pumpWidget(MaterialApp(home: Login()));
    final textField = find.widgetWithText(TextField, 'Digite seu email cadastrado');
    expect(textField, findsOneWidget);
  });

  testWidgets('Should display the Elevated Button when Login is opened',
      (tester) async {
    await tester.pumpWidget(MaterialApp(home: Login()));
    final button = find.widgetWithText(ElevatedButton, 'Quero Adotar!');
    expect(button, findsOneWidget);
  });
}


