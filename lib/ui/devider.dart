import 'package:flutter/material.dart';

class Devider extends StatelessWidget {
  const Devider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: Container(
        height: 3,
        color: Theme.of(context).colorScheme.onSurface,
      ),
    );
  }
}
