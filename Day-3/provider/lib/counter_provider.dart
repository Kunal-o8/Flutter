import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
import 'package:provider_example/counter_model.dart';

class CounterProvider with ChangeNotifier {
  final CounterModel _counter = CounterModel();

  CounterModel get counter => _counter;

  void increment() {
    _counter.increment();
    notifyListeners();
  }
}
