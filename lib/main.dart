import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:flutter_proj_template/route/route.dart';
import 'package:flutter_proj_template/theme/theme.dart';
import 'package:flutter_proj_template/localize/localized_string.dart';
import 'package:flutter_proj_template/provider.dart';

void main() {
  // setupWindow();
  runApp(const MyApp());
}

/// Customized material app wrapped with [MyMultiProvider]
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MyMultiProvider(
      builder: (context, child) {
        var themeNotifier = context.watch<ThemeNotifier>();
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: _LocalizedStrings.flutterProjectSample.of(context),
          themeMode: themeNotifier.themeMode,
          theme: themeNotifier.theme,
          darkTheme: themeNotifier.darkTheme,
          routerConfig: router,
        );
      },
    );
  }
}

class _LocalizedStrings {
  static var flutterProjectSample = const LocalizedString(
    "Flutter Project Sample",
    {
      Language.japanese: "Flutter プロジェクトサンプル",
      Language.kana: "ふらったー ぷろじぇくとさんぷる"
    },
  );
}
