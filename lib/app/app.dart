import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:show_off/route/app_route.dart';
import 'package:show_off/route/route_services.dart';
import 'package:show_off/screens/something_went_wrong/something_went_wrong_screen.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    // FlutterStatusbarManager.setTranslucent(true);
    // FlutterStatusbarManager.setStyle(StatusBarStyle.DARK_CONTENT);
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return MaterialApp(
            title: 'Flutter Demo',
            home: SomethingWentWrongScreen(
              error: snapshot.error.toString(),
            ),
          );
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return Material(
            child: Container(
              child: MaterialApp(
                title: 'Flutter Demo',
                routes: AppRoute.routes,
                navigatorKey: RouteServices().navigatorKey,
                builder: (BuildContext context, Widget child) {
                  return FlutterEasyLoading(child: child);
                },
              ),
            ),
          );
        }
        return Container();
      },
    );
  }
}
