import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'image_of_crush',
      child: Container(
        alignment: Alignment.center,
        child: PhotoView(
          minScale: PhotoViewComputedScale.contained,
          imageProvider: AssetImage('lib/res/images/crush.jpg'),
        ),
      ),
    );
  }
}
