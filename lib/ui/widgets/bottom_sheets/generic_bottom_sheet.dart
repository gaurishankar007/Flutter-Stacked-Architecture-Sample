import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

class GenericBottomSheet extends StatelessWidget {
  final Function(SheetResponse) completer;
  final SheetRequest request;
  final Widget? child;

  const GenericBottomSheet({
    super.key,
    required this.completer,
    required this.request,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Column(
        children: [],
      ),
    );
  }
}
