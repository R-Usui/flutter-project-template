import 'package:flutter/material.dart';
import 'package:flutter_proj_template/ui/sample/animation.dart';
import 'package:flutter_proj_template/ui/sample/font.dart';
import 'package:flutter_proj_template/ui/sample/drawer.dart';

import 'package:go_router/go_router.dart';

import 'package:flutter_proj_template/ui/debug/terminal_page.dart';
import 'package:flutter_proj_template/ui/sample/color.dart';
import 'package:flutter_proj_template/ui/sample/typography.dart';

class Pages {
  static final debugTerminal =
      _Page("/debugTerminal", const DebugTerminalPage());
  static final colorSchemeSample =
      _Page("/colorSample", const ColorSamplePage());
  static final typographySample =
      _Page("/typographySample", const TypographySamplePage());
  static final fontSample = _Page("/fontSample", const FontSamplePage());
  static final drawerSample = _Page("/drawerSample", const DrawerSamplePage());
  static final animationSample =
      _Page("/animationSample", const AnimationSamplePage());

  static final values = <_Page>[
    debugTerminal,
    colorSchemeSample,
    typographySample,
    fontSample,
    drawerSample,
    animationSample,
  ];
}

class _Page {
  const _Page.fromBuilder(this.path, this.builder);

  _Page(String path, Widget page) : this.fromBuilder(path, (_, __) => page);

  final String path;
  final Widget Function(BuildContext, GoRouterState) builder;
}
