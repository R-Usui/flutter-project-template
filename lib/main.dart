import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:flutter_proj_template/theme/theme.dart';
import 'package:flutter_proj_template/config.dart';
import 'package:flutter_proj_template/localize/language.dart';
import 'package:flutter_proj_template/localize/localized_string.dart';
import 'package:flutter_proj_template/provider.dart';

void main() {
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
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: _LocalizedStrings.flutterProjectSample.of(context),
          themeMode: themeNotifier.themeMode,
          theme: themeNotifier.theme,
          darkTheme: themeNotifier.darkTheme,
          home: const Scaffold(
            body: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _MaterialVersionSettingButton(),
                      SizedBox(height: 20),
                      _ThemeModeSettingButton(),
                      SizedBox(height: 20),
                      _LanguageSettingButton(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _MaterialVersionSettingButton extends StatelessWidget {
  const _MaterialVersionSettingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var themeNotifier = context.watch<ThemeNotifier>();

    return TextButton(
      onPressed: () {
        themeNotifier.setUseMaterial3(!themeNotifier.useMaterial3);
      },
      child: Text(
        _LocalizedStrings.switchMaterialVersion.of(context),
      ),
    );
  }
}

class _ThemeModeSettingButton extends StatelessWidget {
  const _ThemeModeSettingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var themeNotifier = context.watch<ThemeNotifier>();

    return TextButton(
      onPressed: () {
        themeNotifier.setThemeMode(
          switch (themeNotifier.themeMode) {
            ThemeMode.light => ThemeMode.dark,
            ThemeMode.dark => ThemeMode.system,
            ThemeMode.system => ThemeMode.light,
          },
        );
      },
      child: Text(
        _LocalizedStrings.switchThemeMode.of(context),
      ),
    );
  }
}

class _LanguageSettingButton extends StatelessWidget {
  const _LanguageSettingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var configNotifier = context.watch<ConfigNotifier>();

    return TextButton(
      onPressed: () {
        configNotifier.setLanguage(configNotifier.language.next);
      },
      child: Text(
        _LocalizedStrings.switchLanguage.of(context),
      ),
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

  static var switchMaterialVersion = const LocalizedString(
    "Switch Material Version",
    {
      Language.japanese: "マテリアルバージョンを変更",
      Language.kana: "まてりあるばーじょんをへんこう",
    },
  );

  static var switchThemeMode = const LocalizedString(
    "Switch Theme Mode",
    {
      Language.japanese: "テーマモードを変更",
      Language.kana: "てーまもーどをへんこう",
    },
  );

  static var switchLanguage = const LocalizedString(
    "Switch Language",
    {
      Language.japanese: "言語を変更",
      Language.kana: "げんごをへんこう",
    },
  );
}
