import 'package:flutter/material.dart';
import 'package:stacked_architecture/app/app.bottomsheets.dart';
import 'package:stacked_architecture/app/app.dialogs.dart';
import 'package:stacked_services/stacked_services.dart';

import 'app/app.locator.dart';
import 'app/app.router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();
  runApp(const StackedArchitecture());
}

class StackedArchitecture extends StatelessWidget {
  const StackedArchitecture({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stacked Architecture Sample',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: Routes.homeView,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      navigatorObservers: [
        StackedService.routeObserver,
      ],
    );
  }
}
