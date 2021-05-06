import 'package:flutter/material.dart';
import 'package:show_off/route/app_route.dart';

class RouteServices {
  static final RouteServices _instance = RouteServices._internal();

  factory RouteServices() {
    return _instance;
  }

  RouteServices._internal();

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName) {
    return navigatorKey.currentState.pushNamed(routeName);
  }

  Future<dynamic> logout() {
    return navigatorKey.currentState
        .pushReplacementNamed(AppRoute.LOGIN_SCREEN);
  }
}
