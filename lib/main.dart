import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:show_off/app/app.dart';
import 'package:show_off/app/combine_provider.dart';

Future<void> main() async {
  const sentryDSN =
      'https://8fdf5370effb4551b0f59fb2a3515c9f@o517051.ingest.sentry.io/5624280';

  WidgetsFlutterBinding.ensureInitialized();
  await SentryFlutter.init(
    (options) {
      options.dsn = sentryDSN;
    },
    appRunner: () => runApp(
      MultiProvider(
        providers: CombineProvider.combine(),
        child: MyApp(),
      ),
    ),
  );
}
