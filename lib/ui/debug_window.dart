import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:provider/provider.dart';

import 'package:flutter_proj_template/config.dart';
import 'package:flutter_proj_template/localize/language.dart';
import 'package:flutter_proj_template/localize/localized_string.dart';
import 'package:flutter_proj_template/theme/theme.dart';

class DebugWindow extends StatefulWidget {
  const DebugWindow({super.key});

  @override
  State<DebugWindow> createState() => _DebugWindowState();
}

class _DebugWindowState extends State<DebugWindow> {
  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
          onPressed: () {
            setState(() {
              isOpen = !isOpen;
            });
          },
          icon: isOpen ? const Icon(Icons.close) : const Icon(Icons.settings),
        ),
        if (isOpen)
          const Expanded(
            child: Card(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _MaterialVersionSettingButton(),
                    _ThemeModeSettingButton(),
                    _LanguageSettingButton(),
                    _PageTransitionButtons(),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class _PageTransitionButtons extends StatelessWidget {
  const _PageTransitionButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextButton(
          onPressed: () {
            context.push("/home");
          },
          child: const Text(
            "go to /home",
          ),
        ),
        TextButton(
          onPressed: () {
            context.push("/sub");
          },
          child: const Text(
            "go to /sub",
          ),
        ),
      ],
    );
  }
}

class _MaterialVersionSettingButton extends StatelessWidget {
  const _MaterialVersionSettingButton();

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
  const _ThemeModeSettingButton();

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
  const _LanguageSettingButton();

  @override
  Widget build(BuildContext context) {
    var configNotifier = context.watch<ConfigNotifier>();

    return TextButton(
      onPressed: () {
        configNotifier.setLanguage(configNotifier.language.next);
      },
      child: Text(_LocalizedStrings.switchLanguage.of(context)),
    );
  }
}

class _LocalizedStrings {
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
