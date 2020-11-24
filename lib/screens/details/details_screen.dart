import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'image_of_crush',
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/res/images/crush.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 10.0),
          child: GestureDetector(
            onTap: (){
              Navigator.of(context).pop();
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 30.0,
            ),
          ),
        ),
      ),
    );
  }
}
