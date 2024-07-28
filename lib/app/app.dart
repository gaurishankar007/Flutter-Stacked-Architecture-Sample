import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../services/user_service.dart';
import '../ui/view/login/login_view.dart';
import '../ui/view/register/register_view.dart';
import '../ui/view/contact/contact_view.dart';
import '../ui/widgets/bottom_sheets/generic_bottom_sheet.dart';
import '../ui/view/counter/counter_view.dart';
import '../ui/widgets/dialogs/generic_dialogs.dart';
import '../ui/view/home/home_view.dart';

@StackedApp(
  dialogs: [
    StackedDialog(classType: GenericDialog),
  ],
  bottomsheets: [
    StackedBottomsheet(classType: GenericBottomSheet),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: UserService),
  ],
  routes: [
    CustomRoute(
      page: HomeView,
      guards: [],
      children: [
        CustomRoute(page: ContactView),
        CustomRoute(page: CounterView),
      ],
    ),
    CustomRoute(page: LoginView),
    CustomRoute(
      page: RegisterView,
      transitionsBuilder: TransitionsBuilders.slideLeft,
    ),
  ],
)
class App {}
