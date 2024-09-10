import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:flutter_project_template/config/config_notifier.dart';
import 'package:flutter_project_template/localize/language.dart';

export 'package:flutter_project_template/localize/language.dart';

class LocalizedString {
  const LocalizedString(
    this._default, [
    this._map,
  ]);

  final String _default;
  final Map<Language, String>? _map;

  String get default_ => _default;

  LocalizedString operator +(LocalizedString other) {
    var newDefault = _default + other._default;

    var languages = {..._map?.keys ?? [], ...other._map?.keys ?? []};
    var newMap = {
      for (var language in languages)
        // ignore: unnecessary_this
        language: this.in_(language) + other.in_(language)
    };

    return LocalizedString(newDefault, newMap);
  }

  String of(BuildContext context) {
    Language? language = context.watch<ConfigNotifier?>()?.language;

    if (language == null) {
      return _default;
    }

    return _map?[language] ?? _default;
  }

  String in_(Language language) {
    return _map?[language] ?? _default;
  }
}
