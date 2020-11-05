import 'package:flutter/material.dart';
import 'package:show_off/route/app_route.dart';

class LoginScreen extends StatelessWidget {
  onPress(context) {
    Navigator.of(context).pushReplacementNamed(AppRoute.BOTTOM_TAB);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(left: 32.0, right: 32.0),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.red)),
                  onPressed: () {
                    onPress(context);
                  },
                  child: Center(
                    child: Text('Go to bottom tab'),
                  ),
                )),
            Container(),
          ],
        ),
      ),
    );
  }
}
