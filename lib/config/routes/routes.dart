import 'package:stacked/stacked_annotations.dart';

import '../../features/counter/counter_view.dart';
import '../../features/home/home_view.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: CounterView),
  ],
)
class Routes {}
