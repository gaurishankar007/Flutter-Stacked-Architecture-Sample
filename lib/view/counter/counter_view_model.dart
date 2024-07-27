import 'dart:math';

import 'package:stacked/stacked.dart';

class CounterViewModel extends BaseViewModel {
  int counter = 0;
  int randomCount = 0;
  bool randomLoading = false;

  String get getCounterLabel => "Counter label is: $counter";

  void increaseCounter() {
    counter++;
    rebuildUi();
  }

  void decreaseCounter() {
    counter--;
    rebuildUi();
  }

  void getRandomCount() async {
    rebuildUi();
    randomLoading = true;
    await Future.delayed(const Duration(seconds: 3));
    randomCount = Random().nextInt(100);
    randomLoading = false;
    rebuildUi();
  }
}
