import 'dart:async';

import 'package:flutter/material.dart';
import 'package:show_off/route/app_route.dart';
import 'package:show_off/utils/app_size.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  AppSize _appSize = AppSize();
  @override
  void initState() {
    super.initState();
    _startTime();
  }

  _startTime() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, _goToLogin);
  }

  void _goToLogin() {
    Navigator.of(context).pushReplacementNamed(AppRoute.LOGIN_SCREEN);
  }

  @override
  Widget build(BuildContext context) {
    _appSize.init(context);
    return Scaffold(
      body: Container(
        child: Center(
          child: Text(AppRoute.SPLASH_SCREEN),
        ),
      ),
    );
  }
}
