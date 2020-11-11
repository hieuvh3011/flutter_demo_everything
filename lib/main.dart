import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:show_off/route/app_route.dart';
import 'package:show_off/stores/app_store/app_store.dart';
import 'package:show_off/utils/app_size.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.transparent);
    FlutterStatusbarcolor.setStatusBarWhiteForeground(false);
    return Material(
      child: Container(
        child: MaterialApp(
          title: 'Flutter Demo',
          routes: AppRoute.routes,
          builder: (BuildContext context, Widget child) {
            return FlutterEasyLoading(child: child);
          },
        ),
      ),
    );
  }
}
