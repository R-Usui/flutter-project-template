import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'package:flutter_proj_template/theme/theme.dart';
import 'package:flutter_proj_template/config/config_notifier.dart';

/// A widget that provides all providers used in app
class CompleteProvider extends StatelessWidget {
  CompleteProvider({
    super.key,
    this.child,
    this.builder,
  });

  final Widget? child;
  final Widget Function(BuildContext, Widget?)? builder;

  final List<SingleChildWidget> _providers = [
    ChangeNotifierProvider(create: (_) => ThemeNotifier()),
    ChangeNotifierProvider(create: (_) => ConfigNotifier()),
  ];

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      key: key,
      providers: _providers,
      builder: builder,
      child: child,
    );
  }
}
