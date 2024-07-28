import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_architecture/app/app.locator.dart';
import 'package:stacked_architecture/ui/view/login/user_model.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../services/user_service.dart';

class RegisterViewModel extends BaseViewModel {
  final navigator = locator<NavigationService>();
  final dialog = locator<DialogService>();
  final userService = locator<UserService>();

  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool showPassword = false;
  bool registerLoading = false;

  togglePasswordVisibility() {
    showPassword = !showPassword;
    rebuildUi();
  }

  register() async {
    if (!formKey.currentState!.validate()) return;

    registerLoading = true;
    rebuildUi();

    bool userAlreadyExist = userService.registeredUsers.any(
      (e) => e.email == emailController.text,
    );
    await Future.delayed(const Duration(seconds: 1));

    if (userAlreadyExist) {
      registerLoading = false;
      rebuildUi();
      return;
    }

    final user = UserModel(
      name: nameController.text,
      email: emailController.text,
      password: passwordController.text,
    );
    userService.registerUser(user);

    registerLoading = false;
    rebuildUi();

    navigator.back();
  }
}
