import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../counter_view_model.dart';

class CounterViewWidget extends StackedView<CounterViewModel> {
  const CounterViewWidget({super.key});

  @override
  Widget builder(
    BuildContext context,
    CounterViewModel viewModel,
    Widget? child,
  ) {
    log("Counter Widget Rebuilt");

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(width: double.maxFinite),
        Text("Counter: ${viewModel.counter}"),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: viewModel.increaseCounter,
              child: const Text("Increase Counter"),
            ),
            ElevatedButton(
              onPressed: viewModel.decreaseCounter,
              child: const Text("Decrease Counter"),
            ),
          ],
        ),
      ],
    );
  }

  @override
  CounterViewModel viewModelBuilder(BuildContext context) => CounterViewModel();
}
