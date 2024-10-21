import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:flutter_project_template/config/config.dart';
import 'package:flutter_project_template/pages_and_route/pages.dart';
import 'package:flutter_project_template/ui/dev_support/window.dart';

final router = GoRouter(
  initialLocation: Pages.textFieldSample.path,
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return Scaffold(
          floatingActionButton: Config.showDeveloperWindow
              ? const DeveloperWindowOpenButton()
              : null,
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
