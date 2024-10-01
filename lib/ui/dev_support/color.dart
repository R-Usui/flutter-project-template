import 'package:flutter/material.dart';

import 'package:flutter_project_template/localize/localized_string.dart';

class ColorSamplePage extends StatelessWidget {
  const ColorSamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    var devider = Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: Container(
        height: 3,
        color: Theme.of(context).colorScheme.onSurface,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(_LocalizedStrings.colorSchemeSample.of(context)),
      ),
      body: ListView(
        children: [
          ColorSampleGroup(
            children: [
              ColorSample(
                label: 'primary',
                color: colorScheme.primary,
              ),
              ColorSample(
                label: 'onPrimary',
                color: colorScheme.onPrimary,
              ),
              ColorSample(
                label: 'primaryContainer',
                color: colorScheme.primaryContainer,
              ),
              ColorSample(
                label: 'onPrimaryContainer',
                color: colorScheme.onPrimaryContainer,
              ),
            ],
          ),
          devider,
          ColorSampleGroup(
            children: [
              ColorSample(
                label: 'primaryFixed',
                color: colorScheme.primaryFixed,
              ),
              ColorSample(
                label: 'onPrimaryFixed',
                color: colorScheme.onPrimaryFixed,
              ),
              ColorSample(
                label: 'primaryFixedDim',
                color: colorScheme.primaryFixedDim,
              ),
              ColorSample(
                label: 'onPrimaryFixedVariant',
                color: colorScheme.onPrimaryFixedVariant,
              ),
            ],
          ),
          devider,
          ColorSampleGroup(
            children: [
              ColorSample(
                label: 'secondary',
                color: colorScheme.secondary,
              ),
              ColorSample(
                label: 'onSecondary',
                color: colorScheme.onSecondary,
              ),
              ColorSample(
                label: 'secondaryContainer',
                color: colorScheme.secondaryContainer,
              ),
              ColorSample(
                label: 'onSecondaryContainer',
                color: colorScheme.onSecondaryContainer,
              ),
            ],
          ),
          devider,
          ColorSampleGroup(
            children: [
              ColorSample(
                label: 'secondaryFixed',
                color: colorScheme.secondaryFixed,
              ),
              ColorSample(
                label: 'onSecondaryFixed',
                color: colorScheme.onSecondaryFixed,
              ),
              ColorSample(
                label: 'secondaryFixedDim',
                color: colorScheme.secondaryFixedDim,
              ),
              ColorSample(
                label: 'onSecondaryFixedVariant',
                color: colorScheme.onSecondaryFixedVariant,
              ),
            ],
          ),
          devider,
          ColorSampleGroup(
            children: [
              ColorSample(
                label: 'tertiary',
                color: colorScheme.tertiary,
              ),
              ColorSample(
                label: 'onTertiary',
                color: colorScheme.onTertiary,
              ),
              ColorSample(
                label: 'tertiaryContainer',
                color: colorScheme.tertiaryContainer,
              ),
              ColorSample(
                label: 'onTertiaryContainer',
                color: colorScheme.onTertiaryContainer,
              ),
            ],
          ),
          devider,
          ColorSampleGroup(
            children: [
              ColorSample(
                label: 'tertiaryFixed',
                color: colorScheme.tertiaryFixed,
              ),
              ColorSample(
                label: 'onTertiaryFixed',
                color: colorScheme.onTertiaryFixed,
              ),
              ColorSample(
                label: 'tertiaryFixedDim',
                color: colorScheme.tertiaryFixedDim,
              ),
              ColorSample(
                label: 'onTertiaryFixedVariant',
                color: colorScheme.onTertiaryFixedVariant,
              ),
            ],
          ),
          devider,
          ColorSampleGroup(
            children: [
              ColorSample(
                label: 'error',
                color: colorScheme.error,
              ),
              ColorSample(
                label: 'onError',
                color: colorScheme.onError,
              ),
              ColorSample(
                label: 'errorContainer',
                color: colorScheme.errorContainer,
              ),
              ColorSample(
                label: 'onErrorContainer',
                color: colorScheme.onErrorContainer,
              ),
            ],
          ),
          devider,
          ColorSampleGroup(
            children: [
              ColorSample(
                label: 'surfaceDim',
                color: colorScheme.surfaceDim,
              ),
              ColorSample(
                label: 'surface',
                color: colorScheme.surface,
              ),
              ColorSample(
                label: 'surfaceBright',
                color: colorScheme.surfaceBright,
              ),
              ColorSample(
                label: 'surfaceContainerLowest',
                color: colorScheme.surfaceContainerLowest,
              ),
              ColorSample(
                label: 'surfaceContainerLow',
                color: colorScheme.surfaceContainerLow,
              ),
              ColorSample(
                label: 'surfaceContainer',
                color: colorScheme.surfaceContainer,
              ),
              ColorSample(
                label: 'surfaceContainerHigh',
                color: colorScheme.surfaceContainerHigh,
              ),
              ColorSample(
                label: 'surfaceContainerHighest',
                color: colorScheme.surfaceContainerHighest,
              ),
              ColorSample(
                label: 'onSurface',
                color: colorScheme.onSurface,
              ),
              ColorSample(
                label: 'onSurfaceVariant',
                color: colorScheme.onSurfaceVariant,
              ),
            ],
          ),
          devider,
          ColorSampleGroup(
            children: [
              ColorSample(
                label: 'outline',
                color: colorScheme.outline,
              ),
              ColorSample(
                label: 'shadow',
                color: colorScheme.shadow,
              ),
              ColorSample(
                label: 'inverseSurface',
                color: colorScheme.inverseSurface,
              ),
              ColorSample(
                label: 'onInverseSurface',
                color: colorScheme.onInverseSurface,
              ),
              ColorSample(
                label: 'inversePrimary',
                color: colorScheme.inversePrimary,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ColorSampleGroup extends StatelessWidget {
  const ColorSampleGroup({super.key, required this.children});

  final List<ColorSample> children;

  @override
  Widget build(BuildContext context) {
    return Column(children: children);
  }
}

class ColorSample extends StatelessWidget {
  const ColorSample({
    super.key,
    required this.label,
    required this.color,
  });

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Card(
          clipBehavior: Clip.antiAlias,
          child: Container(
            width: 100,
            height: 25,
            color: color,
          ),
        ),
        Text(label, style: Theme.of(context).textTheme.titleLarge),
      ],
    );
  }
}

class _LocalizedStrings {
  static const colorSchemeSample = LocalizedString(
    "Color Sample",
    {
      Language.japanese: "色サンプル",
      Language.kana: "いろ さんぷる",
    },
  );
}
