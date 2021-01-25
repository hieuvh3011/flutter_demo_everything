import 'package:flutter/material.dart';

class Screen1 extends StatefulWidget {
  @override
  _Screen1State createState() => _Screen1State();
  final Function runToOtherTab;

  Screen1({this.runToOtherTab});
}

class _Screen1State extends State<Screen1> {
  void _handleSwipe(details) {
    print('swipe left: $details');
    widget.runToOtherTab();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('onTap');
      },
      onPanUpdate: (details) {
        if (details.delta.dx < 0) {
          _handleSwipe(details);
        }
      },
      child: Container(
        alignment: Alignment.center,
        child: Center(
          child: Text(
            'Screen 1',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
