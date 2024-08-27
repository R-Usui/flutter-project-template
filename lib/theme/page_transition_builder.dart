import 'package:flutter/material.dart';

class VerticalPageTransitionsBuilder extends PageTransitionsBuilder {
  const VerticalPageTransitionsBuilder();

  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    final tween = Tween(
      begin: const Offset(0.0, 1.0),
      end: Offset.zero,
    );
    final curvedAnimation = CurvedAnimation(
      parent: animation,
      curve: Curves.ease,
    );

    final secondaryTween = Tween(
      begin: Offset.zero,
      end: const Offset(0.0, 1.0),
    );

    final secondaryCurvedAnimation = CurvedAnimation(
      parent: secondaryAnimation,
      curve: Curves.ease,
    );

    return SlideTransition(
      position: secondaryTween.animate(secondaryCurvedAnimation),
      child: SlideTransition(
        position: tween.animate(curvedAnimation),
        child: child,
      ),
    );
  }
}
