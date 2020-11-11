import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:show_off/route/app_route.dart';
import 'package:show_off/utils/app_size.dart';

part 'splash_store.g.dart';

class SplashStore = SplashStoreBase with _$SplashStore;

abstract class SplashStoreBase with Store {
  AppSize appSize = AppSize();
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

  initSize (context) => appSize.init(context);
}
