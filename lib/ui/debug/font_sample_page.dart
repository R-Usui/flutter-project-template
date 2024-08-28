import 'package:flutter/material.dart';
import 'package:flutter_proj_template/localize/localized_string.dart';
import 'package:flutter_proj_template/theme/font_families.dart';

class FontSamplePage extends StatelessWidget {
  const FontSamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_LocalizedStrings.fontSample.of(context)),
      ),
      body: ListView(children: _buildFontSampleTextList(context)),
    );
  }

  List<Widget> _buildFontSampleTextList(BuildContext context) {
    List<Widget> result = [];

    for (var family in FontFamilies.values) {
      for (var isItalic in [false, true]) {
        for (var weight in FontWeight.values) {
          result.add(
            _FontSampleText(
              text: "ABC abc 123 あいう アイウ 海山森",
              family: family.name,
              weight: weight,
              isItalic: isItalic,
            ),
          );
        }

        result.add(
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
            child: Container(
              height: 3,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        );
      }
    }

    return result;
  }
}

class _FontSampleText extends StatelessWidget {
  const _FontSampleText({
    required this.text,
    required this.family,
    this.weight = FontWeight.normal,
    this.isItalic = false,
  });

  final String text;
  final String family;
  final FontWeight weight;
  final bool isItalic;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Card(
      child: Column(
        children: [
          Tooltip(
            message:
                "($family, ${weight.toString()}${isItalic ? ", Italic" : ""})",
            textStyle: textTheme.titleLarge!
                .copyWith(color: Theme.of(context).colorScheme.surface),
            child: Text(
              text,
              style: textTheme.headlineMedium!.copyWith(
                fontFamily: family,
                fontWeight: weight,
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
