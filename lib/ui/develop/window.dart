import 'package:flutter/material.dart';
import 'package:flutter_proj_template/route/pages.dart';
import 'package:flutter_proj_template/theme/color_seed.dart';
import 'package:go_router/go_router.dart';

import 'package:provider/provider.dart';

import 'package:flutter_proj_template/config/config_notifier.dart';
import 'package:flutter_proj_template/localize/localized_string.dart';
import 'package:flutter_proj_template/theme/theme.dart';

class DevelopWindowOpenButton extends StatelessWidget {
  const DevelopWindowOpenButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showDialog(
          context: context,
          barrierColor: Theme.of(context).colorScheme.surface.withOpacity(0.15),
          builder: (_) => const _DevelopWindow(),
        );
      },
      tooltip: _LocalizedStrings.openDevelopWindow.of(context),
      mini: true,
      child: const Icon(Icons.widgets),
    );
  }
}

class _DevelopWindow extends StatelessWidget {
  const _DevelopWindow();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        margin: const EdgeInsets.all(60.0),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: const BorderRadius.all(
            Radius.circular(5),
          ),
          border: Border.all(color: Theme.of(context).colorScheme.secondary),
        ),
        child: const SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _SeedColorSelectButton(),
              _MaterialVersionSelectButton(),
              _ThemeModeSelectButton(),
              _LanguageSelectButton(),
              _GoToPageButtons(),
            ],
          ),
        ),
      ),
    );
  }
}

//=========================================================
//Widgets to change theme

class _SeedColorSelectButton extends StatelessWidget {
  const _SeedColorSelectButton();

  static final int _numberSeeds = ColorSeed.values.length;

  static const int _rowMax = 5; // 0, 1, 2, ...

  static int get _colMax => _numberSeeds ~/ _rowMax; // 0, 1, 2, ...

  static int _firstIndexOfCol(int col) => col * (_rowMax + 1);

  static int _lastIndexOfCol(int col) => _firstIndexOfCol(col + 1) - 1;

  @override
  Widget build(BuildContext context) {
    if (_numberSeeds == 0) {
      return const Text("No ColorSeed to Select");
    }

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: const BorderRadius.all(
            Radius.circular(5),
          ),
          border: Border.all(color: Theme.of(context).colorScheme.secondary),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (var col = 0; col <= _colMax; ++col)
              _buildRow(context, _firstIndexOfCol(col), _lastIndexOfCol(col)),
          ],
        ),
      ),
    );
  }

  Widget _buildRow(BuildContext context, int startIndex, int endIndex) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (var index = startIndex; index <= endIndex; ++index)
          _buildIconButton(context, index),
      ],
    );
  }

  Widget _buildIconButton(BuildContext context, int index) {
    if (index < 0 || ColorSeed.values.length <= index) {
      return Container();
    }
    var notifier = context.watch<ThemeNotifier>();

    ColorSeed targetColorSeed = ColorSeed.values[index];
    String targetName = targetColorSeed.name;
    Color targetColor = targetColorSeed.color;
    Color currentColor = notifier.seedColor;

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        child: IconButton(
          onPressed: () {
            notifier.setSeedColor(targetColor);
          },
          tooltip: targetName,
          isSelected: targetColor == currentColor,
          icon: Icon(
            Icons.palette_outlined,
            color: ColorSeed.values[index].color,
          ),
          selectedIcon: Icon(
            Icons.palette_outlined,
            color: ColorSeed.values[index].color,
          ),
        ),
      ),
    );
  }
}

class _MaterialVersionSelectButton extends StatelessWidget {
  const _MaterialVersionSelectButton();

  @override
  Widget build(BuildContext context) {
    var notifier = context.watch<ThemeNotifier>();

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SegmentedButton(
        segments: const [
          ButtonSegment(
              value: 2, label: Text('Ver. 2'), icon: Icon(Icons.filter_2)),
          ButtonSegment(
              value: 3, label: Text('Ver. 3'), icon: Icon(Icons.filter_3)),
        ],
        selected: {notifier.useMaterial3 ? 3 : 2},
        onSelectionChanged: (newSelection) {
          notifier.setUseMaterial3(newSelection.first == 3 ? true : false);
        },
        showSelectedIcon: false,
      ),
    );
  }
}

class _ThemeModeSelectButton extends StatelessWidget {
  const _ThemeModeSelectButton();

  @override
  Widget build(BuildContext context) {
    var notifier = context.watch<ThemeNotifier>();
    var current = notifier.themeMode;

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SegmentedButton(
        segments: const [
          ButtonSegment(
              value: ThemeMode.light,
              label: Text('Light'),
              icon: Icon(Icons.light_mode)),
          ButtonSegment(
              value: ThemeMode.dark,
              label: Text('Dark'),
              icon: Icon(Icons.dark_mode)),
          ButtonSegment(
              value: ThemeMode.system,
              label: Text('System'),
              icon: Icon(Icons.devices)),
        ],
        selected: {current},
        onSelectionChanged: (newSelection) {
          notifier.setThemeMode(newSelection.first);
        },
        showSelectedIcon: false,
      ),
    );
  }
}

//=========================================================
//Widget to change config

class _LanguageSelectButton extends StatelessWidget {
  const _LanguageSelectButton();

  @override
  Widget build(BuildContext context) {
    var notifier = context.watch<ConfigNotifier>();

    var current = notifier.language;

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SegmentedButton(
        segments: Language.values.map((language) {
          return ButtonSegment(
              value: language,
              label: Text(language.toString()),
              icon: const Icon(Icons.language));
        }).toList(),
        selected: {current},
        onSelectionChanged: (newSelection) {
          notifier.setLanguage(newSelection.first);
        },
        showSelectedIcon: false,
      ),
    );
  }
}

//=========================================================
//Widget to go to all pages

class _GoToPageButtons extends StatelessWidget {
  const _GoToPageButtons();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: Pages.values
          .map(
            (page) => TextButton(
              onPressed: () {
                context.pop();
                context.push(page.path);
              },
              child: Text(
                _LocalizedStrings.goTo(page.path).of(context),
              ),
            ),
          )
          .toList(),
    );
  }
}

//=========================================================

class _LocalizedStrings {
  static const openDevelopWindow = LocalizedString(
    "Open Develop Window",
    {
      Language.japanese: "開発メニュー",
      Language.kana: "かいはつ めにゅー を ひらく",
    },
  );

  static LocalizedString goTo(String path) => LocalizedString(
        "Go to $path",
        {
          Language.japanese: "$path へ",
          Language.kana: "$path へ いく",
        },
      );
}
