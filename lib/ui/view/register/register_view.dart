import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'register_view_model.dart';

class RegisterView extends StackedView<RegisterViewModel> {
  const RegisterView({super.key});

  @override
  Widget builder(
    BuildContext context,
    RegisterViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: viewModel.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: viewModel.nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  hintText: 'Enter your name',
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(),
                  errorBorder: OutlineInputBorder(),
                  focusedErrorBorder: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20.0),
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
              TextFormField(
                controller: viewModel.confirmPasswordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Confirm Password',
                  hintText: 'Re-enter your password',
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(),
                  errorBorder: OutlineInputBorder(),
                  focusedErrorBorder: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please re-enter your password';
                  } else if (value != viewModel.passwordController.text) {
                    return "Confirm password did not match";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20.0),
              if (viewModel.registerLoading)
                const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(),
                )
              else
                ElevatedButton(
                  onPressed: viewModel.register,
                  child: const Text('Register'),
                ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  RegisterViewModel viewModelBuilder(BuildContext context) =>
      RegisterViewModel();
}
