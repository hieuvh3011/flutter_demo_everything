import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:show_off/app/combine_provider.dart';
import 'package:show_off/screens/login/login_screen.dart';

String loginScreenTest = 'Login screen test';

Widget createLoginScreen() {
  return MultiProvider(
    providers: CombineProvider.combine(),
    child: MaterialApp(
      home: LoginScreen(),
    ),
  );
}

void main() {
  testWidgets(loginScreenTest, (WidgetTester tester) async {
    await tester.pumpWidget(createLoginScreen());
  });
}
