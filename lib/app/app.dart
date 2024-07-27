import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../view/counter/counter_view.dart';
import '../view/home/home_view.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: CounterView),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
  ],
)
class App {}
