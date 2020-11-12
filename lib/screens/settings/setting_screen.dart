import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:show_off/stores/counter_store/counter_store.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('rebuild setting_screen');
    CounterStore _counterStore = Provider.of<CounterStore>(context);
    return Container(
      child: Center(
        child: Observer(
          builder: (_) => Text(
            '${_counterStore.counter}',
            style: TextStyle(fontSize: 20.0, color: Colors.black87),
          ),
        ),
      ),
    );
  }
}
