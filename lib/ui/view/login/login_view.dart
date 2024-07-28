import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'login_view_model.dart';

class LoginView extends StackedView<LoginViewModel> {
  const LoginView({super.key});

  @override
  Widget builder(
    BuildContext context,
    LoginViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: viewModel.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: viewModel.emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  hintText: 'Enter your email',
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(),
                  errorBorder: OutlineInputBorder(),
                  focusedErrorBorder: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                controller: viewModel.passwordController,
                obscureText: !viewModel.showPassword,
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  suffixIcon: IconButton(
                    icon: Icon(viewModel.showPassword
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: viewModel.togglePasswordVisibility,
                  ),
                  enabledBorder: const OutlineInputBorder(),
                  focusedBorder: const OutlineInputBorder(),
                  errorBorder: const OutlineInputBorder(),
                  focusedErrorBorder: const OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20.0),
              if (viewModel.loginLoading)
                const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(),
                )
              else
                ElevatedButton(
                  onPressed: viewModel.login,
                  child: const Text('Login'),
                ),
              const SizedBox(height: 20.0),
              TextButton(
                onPressed: viewModel.navigateToRegister,
                child: const Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  LoginViewModel viewModelBuilder(BuildContext context) => LoginViewModel();
}
