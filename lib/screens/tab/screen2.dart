import 'package:flutter/material.dart';

class Screen2 extends StatefulWidget {
  @override
  _Screen2State createState() => _Screen2State();
  final Function runToOtherTab;

  Screen2({this.runToOtherTab});
}

class _Screen2State extends State<Screen2> {

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Center(
        child: Text(
          'Screen 2',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
