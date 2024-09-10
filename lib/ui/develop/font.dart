import 'package:flutter/material.dart';
import 'package:flutter_proj_template/localize/localized_string.dart';
import 'package:flutter_proj_template/font/font_family.dart';

class FontPalettePage extends StatelessWidget {
  const FontPalettePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_LocalizedStrings.fontSample.of(context)),
      ),
      body: ListView(
        children: [
          for (var family in FontFamilies.values)
            for (var isItalic in [false, true]) ...[
              FontSampleGroup(fontFamily: family, isItalic: isItalic),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                child: Container(
                  height: 3,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ]
        ],
      ),
    );
  }
}

class FontSampleGroup extends StatelessWidget {
  const FontSampleGroup({
    required this.fontFamily,
    required this.isItalic,
    super.key,
  });

  final FontFamily fontFamily;
  final bool isItalic;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var weight in FontWeight.values)
          _FontSample(
            englishText: "ABC abc 123",
            japaneseText: "あいう アイウ 海山森",
            fontFamily: fontFamily,
            fontWeight: weight,
            isItalic: isItalic,
          ),
      ],
    );
  }
}

class _FontSample extends StatelessWidget {
  const _FontSample({
    required this.englishText,
    required this.japaneseText,
    required this.fontFamily,
    this.fontWeight = FontWeight.normal,
    this.isItalic = false,
  });

  final String englishText;
  final String japaneseText;
  final FontFamily fontFamily;
  final FontWeight fontWeight;
  final bool isItalic;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Card(
      child: Column(
        children: [
          Tooltip(
            message:
                "(${fontFamily.name}, ${fontWeight.toString()}${isItalic ? ", Italic" : ""})",
            textStyle: textTheme.titleLarge!
                .copyWith(color: Theme.of(context).colorScheme.surface),
            child: Text(
              "$englishText ${fontFamily.isEnglishOnly ? japaneseText.replaceAll(RegExp("."), "*") : japaneseText}",
              style: textTheme.headlineMedium!.copyWith(
                fontFamily: fontFamily.name,
                fontWeight: fontWeight,
                fontStyle: isItalic ? FontStyle.italic : FontStyle.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _LocalizedStrings {
  static const fontSample = LocalizedString(
    "Font Sample",
    {
      Language.japanese: "フォントサンプル",
      Language.kana: "ふぉんとさんぷる",
    },
  );
}
