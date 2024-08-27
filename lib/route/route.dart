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
            body: Stack(
              children: [
                child,
                if (Config.showDebugWindow)
                  const Align(
                    alignment: Alignment.topLeft,
                    child: DebugWindowOpenButton(),
                  ),
              ],
            ),
          );
        },
        routes: [
          for (var page in Pages.values)
            GoRoute(path: page.path, builder: page.builder),
        ]),
  ],
);
