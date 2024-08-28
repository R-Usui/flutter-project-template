import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:flutter_proj_template/config/config.dart';
import 'package:flutter_proj_template/route/pages.dart';
import 'package:flutter_proj_template/ui/debug/window.dart';

final router = GoRouter(
  initialLocation: Pages.debugTerminal.path,
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return Scaffold(
          floatingActionButton:
              Config.showDebugWindow ? const DebugWindowOpenButton() : null,
          body: child,
        );
      },
      routes: [
        for (var page in Pages.values)
          GoRoute(path: page.path, builder: page.builder),
      ],
    ),
  ],
);
