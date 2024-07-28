import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_architecture/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../services/user_service.dart';
import 'user_model.dart';

class LoginViewModel extends BaseViewModel {
  final navigator = locator<NavigationService>();
  final dialog = locator<DialogService>();
  final userService = locator<UserService>();

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool showPassword = false;
  bool loginLoading = false;

  togglePasswordVisibility() {
    showPassword = !showPassword;
    rebuildUi();
  }

  login() async {
    if (!formKey.currentState!.validate()) return;

    loginLoading = true;
    rebuildUi();

    bool userExist = userService.registeredUsers.any(
      (e) =>
          e.email == emailController.text &&
          e.password == passwordController.text,
    );
    await Future.delayed(const Duration(seconds: 1));

    if (!userExist) {
      loginLoading = false;
      rebuildUi();
      return;
    }

    UserModel user = userService.registeredUsers.firstWhere(
      (e) => e.email == emailController.text,
    );
    userService.setCurrentUser(user);

    loginLoading = false;
    rebuildUi();

    navigator.replaceWithHomeView();
  }

  navigateToRegister() => navigator.navigateToRegisterView();
}
