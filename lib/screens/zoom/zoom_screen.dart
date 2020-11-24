import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

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
      child: PhotoView(
        imageProvider: AssetImage('lib/res/images/min.jpg'),
        minScale: PhotoViewComputedScale.contained,
        maxScale: PhotoViewComputedScale.covered * 3,
        initialScale: PhotoViewComputedScale.contained,

      )
    );
  }
}
