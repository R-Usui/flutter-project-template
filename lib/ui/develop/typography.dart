import 'package:flutter/material.dart';
import 'package:flutter_proj_template/localize/localized_string.dart';

class TypographyPalettePage extends StatelessWidget {
  const TypographyPalettePage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context)
        .textTheme
        .apply(displayColor: Theme.of(context).colorScheme.onSurface);

    var devider = Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: Container(
        height: 3,
        color: Theme.of(context).colorScheme.onSurface,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(_LocalizedStrings.typograpySample.of(context)),
      ),
      body: ListView(
        children: <Widget>[
          _TypographySampleText('Display Large',
              style: textTheme.displayLarge!),
          _TypographySampleText('Display Medium',
              style: textTheme.displayMedium!),
          _TypographySampleText('Display Small',
              style: textTheme.displaySmall!),
          devider,
          _TypographySampleText('Headline Large',
              style: textTheme.headlineLarge!),
          _TypographySampleText('Headline Medium',
              style: textTheme.headlineMedium!),
          _TypographySampleText('Headline Small',
              style: textTheme.headlineSmall!),
          devider,
          _TypographySampleText('Title Large', style: textTheme.titleLarge!),
          _TypographySampleText('Title Medium', style: textTheme.titleMedium!),
          _TypographySampleText('Title Small', style: textTheme.titleSmall!),
          devider,
          _TypographySampleText('Label Large', style: textTheme.labelLarge!),
          _TypographySampleText('Label Medium', style: textTheme.labelMedium!),
          _TypographySampleText('Label Small', style: textTheme.labelSmall!),
          devider,
          _TypographySampleText('Body Large', style: textTheme.bodyLarge!),
          _TypographySampleText('Body Medium', style: textTheme.bodyMedium!),
          _TypographySampleText('Body Small', style: textTheme.bodySmall!),
        ],
      ),
    );
  }
}

class _TypographySampleText extends StatelessWidget {
  const _TypographySampleText(
    this.text, {
    required this.style,
  });

  final String text;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
          "$text ${style.fontSize?.toStringAsFixed(1)}${_LocalizedStrings.pts.of(context)}",
          style: style),
    );
  }
}

class _LocalizedStrings {
  static const typograpySample = LocalizedString(
    "Typography Sample",
    {
      Language.japanese: "タイポグラフィサンプル",
      Language.kana: "たいぽぐらふぃさんぷる",
    },
  );

  static const pts = LocalizedString(
    "pt(s)",
    {
      Language.japanese: "ポイント",
      Language.kana: "ぽいんと",
    },
  );
}
