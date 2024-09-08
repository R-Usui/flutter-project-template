import 'dart:math';

import 'package:flutter/material.dart';

/*
  Animation = 
   (1) AnimationController (controls the progress)
    x
   (2) Tween (convert progress (0 ~ 1) into value (ex: Red => Blue))
    x
   (3) Curve (linear, easeIn, ...)

  ========================================================
   Two ways to build animation from tween & controller
  
   1. Animation = AnimationController.drive(Tween);
   2. Animation = Tween.animate(AnimationController);

  ========================================================
   Three ways to implement an animation widget

   1. Implicit Widgets
    > Customization lv : low
    > No need to create a controller yourself.
    > classes : Animated*** (e.g. AnimatedOpacity)
    > limitations : only "forward" animation can be implemented  

   2. Transition Widgets
    > Customization lv : middle
    > classes : ***Transition (e.g. OpacityTransition)

   3. Explicit Widgets
    > Customization lv : high
    > choose this way, for example, 
       to implement several anims to single widget.
*/

class AnimationSamplePage extends StatelessWidget {
  const AnimationSamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          RotatingNeedleWidget(),
          BasicAnimationWidget(),
          AnimatedOpacityWidget(),
        ],
      ),
    );
  }
}

//

//Example of Explicit Widget 1/2
class BasicAnimationWidget extends StatefulWidget {
  const BasicAnimationWidget({super.key});

  @override
  State<BasicAnimationWidget> createState() => _BasicAnimationWidgetState();
}

class _BasicAnimationWidgetState extends State<BasicAnimationWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late ColorTween _tween;
  late Animation<Color?> _animation;

  bool _isForwardButtonEnabled = true;
  bool _isReverseButtonEnabled = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _controller.addListener(_updateButtonStates);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _tween = ColorTween(
      begin: Theme.of(context).colorScheme.primary,
      end: Theme.of(context).colorScheme.secondary,
    )..chain(CurveTween(curve: Curves.linear));

    _animation = _controller.drive(_tween);
  }

  void _updateButtonStates() {
    setState(() {
      _isForwardButtonEnabled = _controller.value < 1.0;
      _isReverseButtonEnabled = _controller.value > 0.0;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _AnimationPlayer(
      onPressedLeft: () => _controller.reverse(),
      onPressedRight: () => _controller.forward(),
      canPressLeft: _isReverseButtonEnabled,
      canPressRight: _isForwardButtonEnabled,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (_, __) {
          return Container(
            width: 100,
            height: 100,
            color: _animation.value,
          );
        },
      ),
    );
  }
}

//

//Example of Explicit Widget 2/2
class RotatingNeedleWidget extends StatefulWidget {
  const RotatingNeedleWidget({super.key});

  @override
  State<RotatingNeedleWidget> createState() => _RotatingNeedleWidgetState();
}

class _RotatingNeedleWidgetState extends State<RotatingNeedleWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late CurveTween _curveTween;
  late Animation<double> _animation;

  bool _isForwardButtonEnabled = true;
  bool _isReverseButtonEnabled = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _controller.addListener(_updateButtonStates);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _curveTween = CurveTween(curve: Curves.easeInOutBack);

    _animation = _controller.drive(_curveTween);
  }

  void _updateButtonStates() {
    setState(() {
      _isForwardButtonEnabled = _controller.value < 1.0;
      _isReverseButtonEnabled = _controller.value > 0.0;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _AnimationPlayer(
      onPressedLeft: () => _controller.reverse(),
      onPressedRight: () => _controller.forward(),
      canPressLeft: _isReverseButtonEnabled,
      canPressRight: _isForwardButtonEnabled,
      child: Container(
        width: 100,
        height: 100,
        color: Theme.of(context).colorScheme.primary,
        child: Center(
          child: AnimatedBuilder(
            animation: _animation,
            builder: (_, __) {
              return Transform.rotate(
                angle: 2 * pi * _animation.value,
                child: Transform.translate(
                  offset: const Offset(0, -25),
                  child: Container(
                    width: 10,
                    height: 50,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

//

//Example of Implicit Widget
class AnimatedOpacityWidget extends StatefulWidget {
  const AnimatedOpacityWidget({super.key});

  @override
  State<AnimatedOpacityWidget> createState() => _AnimatedOpacityWidgetState();
}

class _AnimatedOpacityWidgetState extends State<AnimatedOpacityWidget> {
  double opacity = 0.0;

  @override
  Widget build(BuildContext context) {
    return _AnimationPlayer(
      onPressedLeft: () => setState(
        () {
          opacity = 0.0;
        },
      ),
      onPressedRight: () => setState(
        () {
          opacity = 1.0;
        },
      ),
      canPressLeft: 0 < opacity,
      canPressRight: opacity < 1,
      child: AnimatedOpacity(
        opacity: opacity,
        curve: Curves.fastEaseInToSlowEaseOut,
        duration: const Duration(seconds: 1),
        child: Container(
          width: 100,
          height: 100,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}

class _AnimationPlayer extends StatelessWidget {
  const _AnimationPlayer({
    this.onPressedLeft,
    this.onPressedRight,
    this.canPressLeft = true,
    this.canPressRight = true,
    required this.child,
  });

  final Widget child;
  final VoidCallback? onPressedLeft;
  final VoidCallback? onPressedRight;
  final bool canPressLeft;
  final bool canPressRight;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        child,
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(
              onPressed: canPressLeft ? onPressedLeft : null,
              child: const Text("<<"),
            ),
            TextButton(
              onPressed: canPressRight ? onPressedRight : null,
              child: const Text(">>"),
            ),
          ],
        ),
      ],
    );
  }
}
