import 'package:flutter/material.dart';
import 'package:show_off/route/app_route.dart';
import 'package:show_off/stores/splash_store/splash_store.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashStore _splashStore = SplashStore();
  @override
  void initState() {
    super.initState();
    _splashStore.startTimer(context);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _splashStore.cancelTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text(AppRoute.SPLASH_SCREEN),
        ),
      ),
    );
  }
}
