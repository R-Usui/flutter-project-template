import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:flutter_project_template/pages_and_route/route.dart';
import 'package:flutter_project_template/theme/theme.dart';
import 'package:flutter_project_template/localize/localized_string.dart';
import 'package:flutter_project_template/provider.dart';

void main() {
  // setupWindow();
  runApp(const MyApp());
}

/// Customized [MaterialApp] wrapped with [CompleteProvider]
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CompleteProvider(
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
