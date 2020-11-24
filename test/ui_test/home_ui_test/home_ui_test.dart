import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:show_off/app/combine_provider.dart';
import 'package:show_off/screens/home/home_screen.dart';

import '../../widget_test.dart';

String homeUITestDescription = "Home UI Testing";

Widget createUIHomeScreen() {
  return MultiProvider(
    providers: CombineProvider.combine(),
    child: MaterialApp(
      home: HomeScreen(),
    ),
  );
}

void main() {
  testWidgets(homeUITestDescription, (WidgetTester tester) async {
    await tester.pumpWidget(createUIHomeScreen());
  });
}
