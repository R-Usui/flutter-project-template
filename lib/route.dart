import 'package:flutter/material.dart';
import 'package:flutter_proj_template/config/config.dart';
import 'package:flutter_proj_template/ui/debug_window.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: "/home",
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return Scaffold(
          body: Stack(
            children: [
              child,
              if (Config.showDebugWindow)
                const Align(
                  alignment: Alignment.topLeft,
                  child: DebugWindow(),
                ),
            ],
          ),
        );
      },
      routes: [
        GoRoute(
          path: "/home",
          builder: (context, state) => const Placeholder(),
        ),
        GoRoute(
          path: "/sub",
          builder: (context, state) => const Placeholder(),
        ),
      ],
    ),
  ],
);
