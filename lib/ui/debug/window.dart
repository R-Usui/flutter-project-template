import 'package:flutter/material.dart';
import 'package:flutter_proj_template/route/pages.dart';
import 'package:go_router/go_router.dart';

import 'package:provider/provider.dart';

import 'package:flutter_proj_template/config/config_notifier.dart';
import 'package:flutter_proj_template/localize/language.dart';
import 'package:flutter_proj_template/localize/localized_string.dart';
import 'package:flutter_proj_template/theme/theme.dart';

class DebugWindowOpenButton extends StatelessWidget {
  const DebugWindowOpenButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
          onPressed: () {
            showDialog(context: context, builder: (_) => const _DebugWindow());
          },
          icon: const Icon(Icons.settings),
        ),
      ],
    );
  }
}

class _DebugWindow extends StatelessWidget {
  const _DebugWindow();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: const BorderRadius.all(
              Radius.circular(5),
            ),
            border: Border.all(color: Theme.of(context).colorScheme.secondary),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                _MaterialVersionSettingButton(),
                _ThemeModeSettingButton(),
                _SwitchColorSchemeSeedButton(),
                _LanguageSettingButton(),
                _GoToTerminalPageButton(),
              ]
                  .map((e) => Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: e,
                      ))
                  .toList(),
            ),
          ),
        ),
      ),
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
            context.push(Pages.debugTerminal.path);
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
    "Go to ${Pages.debugTerminal.path}",
    {
      Language.japanese: "${Pages.debugTerminal.path} へ行く",
      Language.kana: "${Pages.debugTerminal.path} へ いく",
    },
  );
}
