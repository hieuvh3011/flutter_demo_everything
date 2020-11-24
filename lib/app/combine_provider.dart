import 'package:provider/provider.dart';
import 'package:show_off/stores/app_store/app_store.dart';
import 'package:show_off/stores/counter_store/counter_store.dart';
import 'package:show_off/stores/home_store/home_store.dart';
import 'package:show_off/stores/login_store/login_store.dart';
import 'package:show_off/stores/splash_store/splash_store.dart';

class CombineProvider {
  static List<Provider> combine() {
    return [
      Provider<CounterStore>(create: (_) => CounterStore()),
      Provider<AppStore>(create: (_) => AppStore()),
      Provider<LoginStore>(create: (_) => LoginStore()),
      Provider<SplashStore>(create: (_) => SplashStore()),
      Provider<HomeStore>(create: (_) => HomeStore()),
    ];
  }
}
