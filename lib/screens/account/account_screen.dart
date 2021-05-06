import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:show_off/model/chat_user.dart';
import 'package:show_off/route/app_route.dart';
import 'package:show_off/screens/home/item_user.dart';
import 'package:show_off/stores/login_store/login_store.dart';

class AccountScreen extends StatelessWidget {
  void _goToTab(context) {
    Navigator.of(context).pushNamed(AppRoute.TAB_CONTAINER);
  }

  void _goToVideo(context) {
    Navigator.of(context).pushNamed(AppRoute.VIDEO_SCREEN);
  }

  void _goToChatScreen2(context) {
    Navigator.of(context).pushNamed(AppRoute.CHAT_CONTAINER, arguments: 1);
  }

  void _logout(context) {
    Navigator.pushNamedAndRemoveUntil(
        context, AppRoute.LOGIN_SCREEN, (_) => false);
  }

  @override
  Widget build(BuildContext context) {
    print('rebuild account_screen');
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Account Screen'),
      ),
      body: Center(
        child: Consumer<LoginStore>(
          builder: (context, loginStore, child) {
            ChatUser currentUser = loginStore?.currentUser;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 200,
                  height: 200,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: CachedNetworkImage(
                      imageUrl: currentUser?.avatarUrl,
                      placeholder: (context, url) => Image.asset(
                        placeholderImageUrl,
                      ),
                    ),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                _buttonGoToOther(context, "Go to tab", () {
                  _goToTab(context);
                }),
                _buttonGoToOther(context, "Go to video", () {
                  _goToVideo(context);
                }),
                _buttonGoToOther(context, "Chat screen 2", () {
                  _goToChatScreen2(context);
                }),
                _buttonGoToOther(context, "Logout", () {
                  _logout(context);
                })
              ],
            );
          },
        ),
      ),
    );
  }

  // _button(BuildContext context, Function onPressed, String text) {
  //   return Container(
  //     width: 45.0,
  //     height: 45.0,
  //     margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  //     child: ElevatedButton(
  //       onPressed: onPressed,
  //       style: ButtonStyle(
  //         backgroundColor: MaterialStateProperty.all<Color>(Colors.lightBlue),
  //         shape: MaterialStateProperty.all<RoundedRectangleBorder>(
  //           RoundedRectangleBorder(
  //             borderRadius: BorderRadius.circular(10.0),
  //           ),
  //         ),
  //       ),
  //       child: Center(
  //         child: Text(
  //           text,
  //           style: TextStyle(fontSize: 25.0, color: Colors.white),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  _buttonGoToOther(BuildContext context, String text, Function onPress) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: SizedBox(
        height: 50.0,
        width: 200.0,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.lightBlue),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          onPressed: onPress,
          child: Center(
            child: Text(
              text,
              style: TextStyle(fontSize: 20.0, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
