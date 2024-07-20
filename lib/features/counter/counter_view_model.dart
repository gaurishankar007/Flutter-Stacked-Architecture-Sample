import 'package:stacked/stacked.dart';

class CounterViewModel extends BaseViewModel {
  int counter = 0;
  int randomCounter = 0;

  String get getCounterLabel => "Counter label is: $counter";

  void increaseCounter() {
    counter++;
    rebuildUi();
  }

  void decreaseCounter() {
    counter--;
    rebuildUi();
  }
}
