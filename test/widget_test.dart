import 'package:flutter_test/flutter_test.dart';
import 'package:show_off/app/app.dart';

void main() {
  testWidgets('widget test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());
  });
}
