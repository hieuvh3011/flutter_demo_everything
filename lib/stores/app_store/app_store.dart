import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import 'package:flutter/material.dart';

part 'app_store.g.dart';

class AppStore = AppStoreBase with _$AppStore;

abstract class AppStoreBase with Store {
  double width = 0;
  double height = 0;
  double guidelineBaseWidth = 350;
  double guidelineBaseHeight = 680;

}