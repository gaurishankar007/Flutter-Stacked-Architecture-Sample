import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'counter_view_model.dart';
import 'widgets/counter_widget.dart';

class CounterView extends StackedView<CounterViewModel> {
  const CounterView({super.key});

  @override
  Widget builder(
    BuildContext context,
    CounterViewModel viewModel,
    Widget? child,
  ) {
    return const Scaffold(
      body: SafeArea(
        child: CounterViewWidget(),
      ),
    );
  }

  @override
  CounterViewModel viewModelBuilder(BuildContext context) => CounterViewModel();
}
