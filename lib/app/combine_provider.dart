import 'package:provider/provider.dart';
import 'package:show_off/stores/chat_store/chat_store.dart';
import 'package:show_off/stores/counter_store/counter_store.dart';
import 'package:show_off/stores/home_store/home_store.dart';
import 'package:show_off/stores/login_store/login_store.dart';
import 'package:show_off/stores/splash_store/splash_store.dart';

class CombineProvider {
  static List<ChangeNotifierProvider> combine() {
    return [
      ChangeNotifierProvider<CounterStore>(create: (_) => CounterStore()),
      ChangeNotifierProvider<LoginStore>(create: (_) => LoginStore()),
      ChangeNotifierProvider<SplashStore>(create: (_) => SplashStore()),
      ChangeNotifierProvider<HomeStore>(create: (_) => HomeStore()),
      ChangeNotifierProvider<ChatStore>(create: (_) => ChatStore()),
    ];
  }
}
