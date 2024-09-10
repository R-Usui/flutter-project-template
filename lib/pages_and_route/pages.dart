import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:flutter_proj_template/ui/develop/font.dart';
import 'package:flutter_proj_template/ui/develop/color.dart';
import 'package:flutter_proj_template/ui/develop/typography.dart';

import 'package:flutter_proj_template/ui/note/drawer.dart';
import 'package:flutter_proj_template/ui/note/animation.dart';
import 'package:flutter_proj_template/ui/note/custom_paint.dart';

class Pages {
  static final colorSample = _Page(
    "/colorSample",
    const ColorPalettePage(),
  );

  static final typographySample = _Page(
    "/typographySample",
    const TypographyPalettePage(),
  );

  static final fontSample = _Page(
    "/fontSample",
    const FontPalettePage(),
  );

  static final drawerSample = _Page(
    "/drawerSample",
    const DrawerSamplePage(),
  );

  static final animationSample = _Page(
    "/animationSample",
    const AnimationSamplePage(),
  );

  static final customPaintSample = _Page(
    "/customPaintSample",
    const CustomPaintSample(),
  );

  static final values = <_Page>[
    colorSample,
    typographySample,
    fontSample,
    drawerSample,
    animationSample,
    customPaintSample,
  ];
}

class _Page {
  const _Page.fromBuilder(this.path, this.builder);

  _Page(String path, Widget page) : this.fromBuilder(path, (_, __) => page);

  final String path;
  final Widget Function(BuildContext, GoRouterState) builder;
}
