import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'home_view_model.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({super.key});

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stacked Example"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.logout_rounded),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: viewModel.navigateToCounterView,
                  child: const Text("Counter View"),
                ),
                ElevatedButton(
                  onPressed: viewModel.navigateToContactView,
                  child: const Text("Contact View"),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: viewModel.currentIndex,
        onTap: viewModel.setIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contacts_rounded),
            label: "Contacts",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.av_timer_rounded),
            label: "Counter",
          ),
        ],
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();
}
