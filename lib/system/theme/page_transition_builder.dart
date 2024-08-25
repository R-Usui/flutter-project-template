import 'package:flutter/material.dart';

class MyPageTransitionsBuilder extends PageTransitionsBuilder {
  const MyPageTransitionsBuilder();

  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    var slideTween = Tween(begin: const Offset(0, 0.5), end: Offset.zero);

    var scaleTween = Tween(begin: 0.0, end: 1.0);
    var scaleCurveTween = CurveTween(curve: Curves.easeOutCubic);
    scaleTween.chain(scaleCurveTween);

    var secondarySlideTween =
        Tween(begin: Offset.zero, end: const Offset(0, -0.5));

    var secondaryScaleTween = Tween(begin: 1.0, end: 0.0);
    var secondaryScaleCurveTween = CurveTween(curve: Curves.easeOutCubic);
    secondaryScaleTween.chain(secondaryScaleCurveTween);

    return SlideTransition(
      position: slideTween.animate(animation),
      child: ScaleTransition(
        scale: scaleTween.animate(animation),
        child: SlideTransition(
          position: secondarySlideTween.animate(secondaryAnimation),
          child: ScaleTransition(
            scale: secondaryScaleTween.animate(secondaryAnimation),
            child: child,
          ),
        ),
      ),
    );
  }
}
