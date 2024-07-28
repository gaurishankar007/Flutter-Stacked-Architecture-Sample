import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../counter_view_model.dart';

class RandomCountWidget extends StatelessWidget {
  const RandomCountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CounterViewModel>.reactive(
      viewModelBuilder: () => CounterViewModel(),
      builder: (context, viewModel, child) {
        log("Random Counter ViewModelBuilder Widget Rebuilt");

        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: viewModel.getRandomCount,
              child: const Text("Random Count"),
            ),
            const SizedBox(width: 20),
            if (viewModel.randomLoading)
              const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(strokeWidth: 2),
              )
            else
              Text("Random Count: ${viewModel.randomCount}"),
          ],
        );
      },
    );
  }
}
