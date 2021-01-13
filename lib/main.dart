import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:show_off/app/app.dart';
import 'package:show_off/app/combine_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: CombineProvider.combine(),
      child: MyApp(),
    ),
  );
}
