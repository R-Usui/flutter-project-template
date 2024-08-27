import 'package:flutter/material.dart';
import 'package:flutter_proj_template/route/pages.dart';
import 'package:go_router/go_router.dart';

import 'package:provider/provider.dart';

import 'package:flutter_proj_template/config/config_notifier.dart';
import 'package:flutter_proj_template/localize/language.dart';
import 'package:flutter_proj_template/localize/localized_string.dart';
import 'package:flutter_proj_template/theme/theme.dart';

class DebugMenuWindow extends StatefulWidget {
  const DebugMenuWindow({super.key});

  @override
  State<DebugMenuWindow> createState() => _DebugMenuWindowState();
}

class _DebugMenuWindowState extends State<DebugMenuWindow> {
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
                    _SwitchColorSchemeSeedButton(),
                    _LanguageSettingButton(),
                    _GoToTerminalPageButton(),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}

//=========================================================
//Widgets to change theme

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

class _SwitchColorSchemeSeedButton extends StatelessWidget {
  const _SwitchColorSchemeSeedButton();

  @override
  Widget build(BuildContext context) {
    var themeNotifier = context.watch<ThemeNotifier>();

    return TextButton(
      onPressed: () {
        themeNotifier.setColorSchemeSeed(
          switch (themeNotifier.colorSchemeSeed) {
            Colors.red => Colors.blue,
            Colors.blue => Colors.purple,
            _ => Colors.red,
          },
        );
      },
      child: Text(
        _LocalizedStrings.switchColorSchemeSeed.of(context),
      ),
    );
  }
}

//=========================================================
//Widget to change config

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

//=========================================================
//Widget to go to terminal page

class _GoToTerminalPageButton extends StatelessWidget {
  const _GoToTerminalPageButton();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextButton(
          onPressed: () {
            context.push(Pages.terminal.path);
          },
          child: Text(_LocalizedStrings.goToTerminal.of(context)),
        ),
      ],
    );
  }
}

//=========================================================

class _LocalizedStrings {
  static const switchMaterialVersion = LocalizedString(
    "Switch Material Version",
    {
      Language.japanese: "マテリアルバージョンを変更",
      Language.kana: "まてりあるばーじょんをへんこう",
    },
  );

  static const switchThemeMode = LocalizedString(
    "Switch Theme Mode",
    {
      Language.japanese: "テーマモードを変更",
      Language.kana: "てーまもーどをへんこう",
    },
  );

  static const switchColorSchemeSeed = LocalizedString(
    "Switch Color Scheme Seed",
    {
      Language.japanese: "カラースキームシードを変更",
      Language.kana: "からーすきーむしーどをへんこう",
    },
  );

  static const switchLanguage = LocalizedString(
    "Switch Language",
    {
      Language.japanese: "言語を変更",
      Language.kana: "げんごをへんこう",
    },
  );

  static var goToTerminal = LocalizedString(
    "Go to ${Pages.terminal.path}",
    {
      Language.japanese: "${Pages.terminal.path} へ行く",
      Language.kana: "${Pages.terminal.path} へ いく",
    },
  );
}
