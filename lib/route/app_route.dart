import 'package:flutter/material.dart';
import 'package:show_off/route/bottom_tabs.dart';
import 'package:show_off/screens/account/account_screen.dart';
import 'package:show_off/screens/details/details_screen.dart';
import 'package:show_off/screens/home/home_screen.dart';
import 'package:show_off/screens/login/login_screen.dart';
import 'package:show_off/screens/map/google_map.dart';
import 'package:show_off/screens/register/register_screen.dart';
import 'package:show_off/screens/settings/setting_screen.dart';
import 'package:show_off/screens/splash/splash_screen.dart';
import 'package:show_off/screens/tab/tab_container.dart';
import 'package:show_off/screens/take_picture/take_picture_screen.dart';
import 'package:show_off/screens/zoom/zoom_screen.dart';

class AppRoute {
  static const ROOT = '/';
  static const SPLASH_SCREEN = ROOT + 'splash_screen';
  static const LOGIN_SCREEN = ROOT + 'login_screen';
  static const REGISTER_SCREEN = ROOT + 'register_screen';
  static const HOME_SCREEN = ROOT + 'home_screen';
  static const ACCOUNT_SCREEN = ROOT + 'account_screen';
  static const SETTINGS_SCREEN = ROOT + 'settings_screen';
  static const BOTTOM_TAB = ROOT + 'bottom_tab';
  static const DETAILS_SCREEN = ROOT + 'details_screen';
  static const ZOOM_SCREEN = ROOT + 'zoom_screen';
  static const TAKE_PICTURE_SCREEN = ROOT + 'take_picture';
  static const MAP_SCREEN = ROOT + 'google_map';
  static const TAB_CONTAINER = ROOT + 'tab_container';

  static final routes = <String, WidgetBuilder>{
    ROOT: (BuildContext context) => SplashScreen(),
    LOGIN_SCREEN: (BuildContext context) => LoginScreen(),
    REGISTER_SCREEN: (BuildContext context) => RegisterScreen(),
    HOME_SCREEN: (BuildContext context) => HomeScreen(),
    ACCOUNT_SCREEN: (BuildContext context) => AccountScreen(),
    SETTINGS_SCREEN: (BuildContext context) => SettingScreen(),
    DETAILS_SCREEN: (BuildContext context) => DetailsScreen(),
    ZOOM_SCREEN: (BuildContext context) => ZoomScreen(),
    BOTTOM_TAB: (BuildContext context) => BottomTabs(),
    TAKE_PICTURE_SCREEN: (BuildContext context) => TakePictureScreen(),
    MAP_SCREEN: (BuildContext context) => GoogleMapScreen(),
    TAB_CONTAINER: (BuildContext context) => TabContainer(),
  };

  static void setHomeScreenAsRoot(context) {
    Navigator.pushReplacementNamed(context, HOME_SCREEN);
  }

  static void setSplashScreenAsRoot(context) {
    Navigator.pushReplacementNamed(context, SPLASH_SCREEN);
  }
}
