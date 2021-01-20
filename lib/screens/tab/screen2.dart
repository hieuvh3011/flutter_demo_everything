import 'package:flutter/material.dart';

class Screen2 extends StatefulWidget {
  @override
  _Screen2State createState() => _Screen2State();
  final Function runToOtherTab;

  Screen2({this.runToOtherTab});
}

class _Screen2State extends State<Screen2> {
  void _handleSwipe(details) {
    print('swipe right: $details');
    widget.runToOtherTab();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        if (details.delta.dx > 0) {
          _handleSwipe(details);
        }
      },
      child: Container(
        alignment: Alignment.center,
        color: Colors.lightBlue,
        child: Center(
          child: Text(
            'Screen 2',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
