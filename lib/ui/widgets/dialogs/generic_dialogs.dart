import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

class GenericDialog extends StatelessWidget {
  final Function(DialogResponse) completer;
  final DialogRequest request;
  final Widget? child;

  const GenericDialog({
    super.key,
    required this.completer,
    required this.request,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      backgroundColor: Colors.white,
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [],
        ),
      ),
    );
  }
}
