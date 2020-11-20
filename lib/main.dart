import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:show_off/app/app.dart';
import 'package:show_off/app/combine_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: CombineProvider.combine(),
      child: MyApp(),
    ),
  );
}
