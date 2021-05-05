import 'dart:async';

import 'package:flutter/material.dart';
import 'package:show_off/route/app_route.dart';

class SplashStore extends ChangeNotifier{
  Duration _duration = Duration(seconds: 2);
  Timer _timer;

  void _goToLogin(context) {
    Navigator.of(context).pushReplacementNamed(AppRoute.LOGIN_SCREEN);
  }

  startTimer (context) async {
    _timer = Timer(_duration, () {
      _goToLogin(context);
    });
    return _timer;
  }

  cancelTimer (){
    if (_timer != null){
      _timer.cancel();
    }
  }
}