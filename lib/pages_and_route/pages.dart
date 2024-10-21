import 'package:flutter/material.dart';
import 'package:flutter_project_template/ui/sample/text_filed.dart';
import 'package:flutter_project_template/ui/util/map2d/map2d.dart';

import 'package:go_router/go_router.dart';

import 'package:flutter_project_template/ui/dev_support/font.dart';
import 'package:flutter_project_template/ui/dev_support/color.dart';
import 'package:flutter_project_template/ui/dev_support/typography.dart';

import 'package:flutter_project_template/ui/sample/drawer.dart';
import 'package:flutter_project_template/ui/sample/animation.dart';
import 'package:flutter_project_template/ui/sample/custom_paint.dart';

class Pages {
  static final colorSample = _Page(
    "/colorSample",
    const ColorSamplePage(),
  );

  static final typographySample = _Page(
    "/typographySample",
    const TypographySamplePage(),
  );

  static final fontSample = _Page(
    "/fontSample",
    const FontSamplePage(),
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

  static final textFieldSample = _Page(
    "/textFieldSampe",
    const TextFieldSamplePage(),
  );

  static final map2dSample = _Page(
    "/map2dSample",
    const Map2dSamplePage(),
  );

  static final values = <_Page>[
    colorSample,
    typographySample,
    fontSample,
    drawerSample,
    animationSample,
    customPaintSample,
    textFieldSample,
    map2dSample,
  ];
}

class _Page {
  const _Page.fromBuilder(this.path, this.builder);

  _Page(String path, Widget page) : this.fromBuilder(path, (_, __) => page);

  final String path;
  final Widget Function(BuildContext, GoRouterState) builder;
}
