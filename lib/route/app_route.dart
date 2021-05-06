import 'package:flutter/material.dart';
import 'package:show_off/route/bottom_tabs.dart';
import 'package:show_off/screens/account/account_screen.dart';
import 'package:show_off/screens/chat/chat_container.dart';
import 'package:show_off/screens/chat/list_user_screen.dart';
import 'package:show_off/screens/chat/conversation_screen.dart';
import 'package:show_off/screens/chat/assets_conversation_screen.dart';
import 'package:show_off/screens/chat/search_screen.dart';
import 'package:show_off/screens/details/details_screen.dart';
import 'package:show_off/screens/home/home_screen.dart';
import 'package:show_off/screens/login/login_screen.dart';
import 'package:show_off/screens/map/google_map.dart';
import 'package:show_off/screens/register/register_screen.dart';
import 'package:show_off/screens/settings/setting_screen.dart';
import 'package:show_off/screens/splash/splash_screen.dart';
import 'package:show_off/screens/tab/tab_container.dart';
import 'package:show_off/screens/take_picture/take_picture_screen.dart';
import 'package:show_off/screens/video/video_screen.dart';
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
  static const VIDEO_SCREEN = ROOT + 'video_screen';
  static const CHAT_CONTAINER = ROOT + 'chat_container';
  static const LIST_USER_SCREEN = CHAT_CONTAINER + "/list_user_screen";
  static const CONVERSATION_SCREEN = CHAT_CONTAINER + "/conversation_screen";
  static const ASSETS_SHARED_SCREEN = CHAT_CONTAINER + "/assets_shared_screen";
  static const SEARCH_SCREEN = CHAT_CONTAINER + '/search_screen';

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
    VIDEO_SCREEN: (BuildContext context) => VideoScreen(),
    CHAT_CONTAINER: (BuildContext context) => ChatContainer(),
    LIST_USER_SCREEN: (BuildContext context) => ListUserScreen(),
    CONVERSATION_SCREEN: (BuildContext context) => ConversationScreen(),
    ASSETS_SHARED_SCREEN: (BuildContext context) => AssetsConversationScreen(),
    SEARCH_SCREEN: (BuildContext context) => SearchScreen(),
  };

  static void setHomeScreenAsRoot(context) {
    Navigator.pushReplacementNamed(context, HOME_SCREEN);
  }

  static void setSplashScreenAsRoot(context) {
    Navigator.pushReplacementNamed(context, SPLASH_SCREEN);
  }

  static void backToLogin() {
    // Navigator.pushReplacementNamed(, routeName)
  }
}
