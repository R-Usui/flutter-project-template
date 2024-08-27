import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:flutter_proj_template/ui/terminal_page.dart';

class Pages {
  static final terminal = _Page("/terminal", const TerminalPage());
  static final sample01 = _Page("/sample01", const Placeholder());
  static final sample02 = _Page("/sample02", const Placeholder());

  static final values = [
    terminal,
    sample01,
    sample02,
  ];
}

class _Page {
  const _Page.fromBuilder(this.path, this.builder);

  _Page(String path, Widget page) : this.fromBuilder(path, (_, __) => page);

  final String path;
  final Widget Function(BuildContext, GoRouterState) builder;
}
