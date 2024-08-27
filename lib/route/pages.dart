import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:flutter_proj_template/ui/debug/terminal_page.dart';

class Pages {
  static final debugTerminal =
      _Page("/debugTerminal", const DebugTerminalPage());
  static final sample00 = _Page("/sample00", const Placeholder());
  static final sample01 = _Page("/sample01", const Placeholder());
  static final sample02 = _Page("/sample02", const Placeholder());
  static final sample03 = _Page("/sample03", const Placeholder());
  static final sample04 = _Page("/sample04", const Placeholder());
  static final sample05 = _Page("/sample05", const Placeholder());
  static final sample06 = _Page("/sample06", const Placeholder());
  static final sample07 = _Page("/sample07", const Placeholder());
  static final sample08 = _Page("/sample08", const Placeholder());
  static final sample09 = _Page("/sample09", const Placeholder());
  static final sample10 = _Page("/sample10", const Placeholder());
  static final sample11 = _Page("/sample11", const Placeholder());
  static final sample12 = _Page("/sample12", const Placeholder());
  static final sample13 = _Page("/sample13", const Placeholder());
  static final sample14 = _Page("/sample14", const Placeholder());
  static final sample15 = _Page("/sample15", const Placeholder());
  static final sample16 = _Page("/sample16", const Placeholder());
  static final sample17 = _Page("/sample17", const Placeholder());
  static final sample18 = _Page("/sample18", const Placeholder());
  static final sample19 = _Page("/sample19", const Placeholder());

  static final values = [
    debugTerminal,
    sample00,
    sample01,
    sample02,
    sample03,
    sample04,
    sample05,
    sample06,
    sample07,
    sample08,
    sample09,
    sample10,
    sample11,
    sample12,
    sample13,
    sample14,
    sample15,
    sample16,
    sample17,
    sample18,
    sample19,
  ];
}

class _Page {
  const _Page.fromBuilder(this.path, this.builder);

  _Page(String path, Widget page) : this.fromBuilder(path, (_, __) => page);

  final String path;
  final Widget Function(BuildContext, GoRouterState) builder;
}
