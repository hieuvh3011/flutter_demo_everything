import 'package:flutter/material.dart';

class ZoomScreen extends StatefulWidget {
  @override
  _ZoomScreenState createState() => _ZoomScreenState();
}

class _ZoomScreenState extends State<ZoomScreen>
    with SingleTickerProviderStateMixin {
  Duration resetDuration = const Duration(microseconds: 100);
  AnimationController _animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: resetDuration);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: InteractiveViewer(
        constrained: true,
        child: Image(
          alignment: Alignment.center,
          fit: BoxFit.contain,
          image: AssetImage('lib/res/images/min.jpg'),
        ),
      ),
    );
  }
}
