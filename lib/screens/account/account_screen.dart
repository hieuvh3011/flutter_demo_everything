import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:show_off/route/app_route.dart';
import 'package:show_off/stores/counter_store/counter_store.dart';

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

  @override
  Widget build(BuildContext context) {
    print('rebuild account_screen');
    CounterStore _counterStore = Provider.of<CounterStore>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Account Screen'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Observer(
              builder: (_) => Text(
                '${_counterStore.counter}',
                style: TextStyle(color: Colors.black54, fontSize: 32.0),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _button(context, _counterStore.increment, '+'),
                _button(context, _counterStore.decrement, '-'),
              ],
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
          ],
        ),
      ),
    );
  }

  _button(BuildContext context, Function onPressed, String text) {
    return Container(
      width: 45.0,
      height: 45.0,
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: RaisedButton(
        color: Colors.lightBlue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        onPressed: onPressed,
        child: Center(
          child: Text(
            text,
            style: TextStyle(fontSize: 25.0, color: Colors.white),
          ),
        ),
      ),
    );
  }

  _buttonGoToOther(BuildContext context, String text, Function onPress) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: SizedBox(
        height: 50.0,
        width: 200.0,
        child: RaisedButton(
          color: Colors.lightBlue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
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
