import 'package:flutter/material.dart';
import 'package:flutter_proj_template/ui/debug/font_sample_page.dart';
import 'package:flutter_proj_template/ui/sample/drawer.dart';

import 'package:go_router/go_router.dart';

import 'package:flutter_proj_template/ui/debug/terminal_page.dart';
import 'package:flutter_proj_template/ui/debug/color_scheme_sample_page.dart';
import 'package:flutter_proj_template/ui/debug/typography_sample_page.dart';

class Pages {
  static final debugTerminal =
      _Page("/debugTerminal", const DebugTerminalPage());
  static final colorSchemeSample =
      _Page("/colorSchemeSample", const ColorSchemeSamplePage());
  static final typographySample =
      _Page("/typographySample", const TypographySamplePage());
  static final fontSample = _Page("/fontSample", const FontSamplePage());
  static final drawerSample =
      _Page("/drawerSample", const DrawerSamplePage());

  static final values = <_Page>[
    debugTerminal,
    colorSchemeSample,
    typographySample,
    fontSample,
    drawerSample,
  ];
}

class _Page {
  const _Page.fromBuilder(this.path, this.builder);

  _Page(String path, Widget page) : this.fromBuilder(path, (_, __) => page);

  final String path;
  final Widget Function(BuildContext, GoRouterState) builder;
}
