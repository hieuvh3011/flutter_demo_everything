import 'package:flutter/material.dart';

class AppSize {
  static final AppSize _instance = AppSize._internal();

  static AppSize getInstance(){
    return _instance;
  }

  factory AppSize() {
    return _instance;
  }

  AppSize._internal();

  static double screenWidth = 0;
  static double screenHeight = 0;
  static double shortDimension = 0;
  static double longDimension = 0;
  static double textScaleFactor = 0;
  bool allowFontScaling = false;

  //Default guideline sizes are based on standard ~5" screen mobile device
  double guidelineBaseWidth = 350;
  double guidelineBaseHeight = 680;

  void init(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    shortDimension = screenWidth < screenHeight ? screenWidth : screenHeight;
    longDimension = screenWidth < screenHeight ? screenHeight : screenWidth;
    textScaleFactor = MediaQuery.of(context).textScaleFactor;
  }

  double scale(double size){
    return shortDimension / guidelineBaseWidth * size;
  }


  double verticalScale (double size){
    return longDimension / guidelineBaseHeight * size;
  }

  double moderateScale (double size, {double factor = 0.5}){
    return size + (scale(size) - size) * factor;
  }

  double moderateVerticalScale (double size, {double factor = 0.5}){
    return size + (verticalScale(size) - size) * factor;
  }
}
