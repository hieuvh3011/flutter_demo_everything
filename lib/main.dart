import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:show_off/app/app.dart';
import 'package:show_off/app/combine_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: CombineProvider.combine(),
      child: MyApp(),
    ),
  );
}
