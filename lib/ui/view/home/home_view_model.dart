import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../contact/contact_view.dart';
import '../counter/counter_view.dart';

class HomeViewModel extends BaseViewModel {
  final navigator = locator<NavigationService>();
  int currentIndex = 0;

  setIndex(int index) {
    currentIndex = index;
    rebuildUi();
  }

  navigateToCounterView() => navigator.navigateToView(const CounterView());

  navigateToContactView() => navigator.navigateToView(const ContactView());
}
