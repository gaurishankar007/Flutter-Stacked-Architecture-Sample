import 'package:flutter/material.dart';
import 'package:stacked_architecture/core/services/locator.dart';
import 'package:stacked_services/stacked_services.dart';

import 'config/routes/routes.router.dart';

void main() {
  setupLocators();
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
