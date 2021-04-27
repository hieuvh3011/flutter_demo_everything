import 'package:flutter/material.dart';

class SomethingWentWrongScreen extends StatelessWidget {
  final String error;

  SomethingWentWrongScreen({this.error});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        alignment: Alignment.center,
        child: Text("Error = " + error),
      ),
    );
  }
}
