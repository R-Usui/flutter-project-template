import 'package:flutter/material.dart';
import 'package:flutter_proj_template/system/config/config.dart';
import 'package:flutter_proj_template/system/localize/language.dart';
import 'package:provider/provider.dart';

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
