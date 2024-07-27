import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'counter_view_model.dart';
import 'widgets/counter_widget.dart';
import 'widgets/random_count_widget.dart';

class CounterView extends StackedView<CounterViewModel> {
  const CounterView({super.key});

  @override
  Widget builder(
    BuildContext context,
    CounterViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(title: const Text("Counter")),
      body: const SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CounterViewWidget(),
            SizedBox(height: 40),
            RandomCountWidget(),
          ],
        ),
      ),
    );
  }

  @override
  CounterViewModel viewModelBuilder(BuildContext context) => CounterViewModel();
}
