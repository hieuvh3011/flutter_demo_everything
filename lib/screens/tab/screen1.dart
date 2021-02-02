import 'package:flutter/material.dart';

class Screen1 extends StatefulWidget {
  @override
  _Screen1State createState() => _Screen1State();
  final Function runToOtherTab;

  Screen1({this.runToOtherTab});
}

class _Screen1State extends State<Screen1> {

  @override
  Widget build(BuildContext context) {
    return
      Container(
        alignment: Alignment.center,
        child: Center(
          child: Text(
            'Screen 1',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      );
  }
}
