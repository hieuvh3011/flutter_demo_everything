//
// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:provider/provider.dart';
// import 'package:show_off/app/app.dart';
// import 'package:show_off/stores/app_store/app_store.dart';
// import 'package:show_off/stores/counter_store/counter_store.dart';
// import 'package:show_off/stores/login_store/login_store.dart';
// import 'package:show_off/stores/splash_store/splash_store.dart';
//
// Widget createAppForTest() => MultiProvider(
//     providers: [
//       Provider<CounterStore>(create: (_) => CounterStore()),
//       Provider<AppStore>(create: (_) => AppStore()),
//       Provider<LoginStore>(create: (_) => LoginStore()),
//       Provider<SplashStore>(create: (_) => SplashStore()),
//     ],
//     child: MaterialApp(
//       home: MyApp(),
//     ),
//   );
//
// void main() {
//   testWidgets('widget test', (WidgetTester tester) async {
//     // Build our app and trigger a frame.
//     await tester.pumpWidget(MyApp());
//   });
// }
