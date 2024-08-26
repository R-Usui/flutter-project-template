import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:flutter_proj_template/config/config_notifier.dart';
import 'package:flutter_proj_template/localize/language.dart';

class LocalizedString {
  const LocalizedString(
    this._defaultString, [
    this._stringMap,
  ]);

  final String _defaultString;
  final Map<Language, String>? _stringMap;

  String of(BuildContext context) {
    Language? language = context.watch<ConfigNotifier?>()?.language;

    if (language == null) {
      return _defaultString;
    }

    return _stringMap?[language] ?? _defaultString;
  }
}
