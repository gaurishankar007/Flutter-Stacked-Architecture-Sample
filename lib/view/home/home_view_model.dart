import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app/app.locator.dart';
import '../counter/counter_view.dart';

class HomeViewModel extends BaseViewModel {
  final navigator = locator<NavigationService>();

  navigateToCounterView() => navigator.navigateToView(const CounterView());
}
