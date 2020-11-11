import 'dart:developer';

import 'package:test/test.dart';
import 'package:show_off/stores/counter_store/counter_store.dart';

void main(){
  test('increment in counter', (){
    final counter = CounterStore();

    counter.increment();
    counter.increment();
    counter.increment();
    counter.increment();
    counter.increment();

    expect(counter.counter, 5);
  });

  test('decrement in counter', (){
    final counter = CounterStore();
    counter.increment();
    counter.increment();
    counter.increment();
    counter.increment();
    counter.decrement();

    expect(counter.counter, 3);
  });
}