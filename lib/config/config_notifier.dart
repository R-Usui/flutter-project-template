import 'package:flutter/material.dart';

import 'package:flutter_proj_template/localize/language.dart';

class ConfigNotifier extends ChangeNotifier {
  // ====================================================
  // Language
  Language _language = Language.japanese;

  Language get language => _language;

  void setLanguage(Language value) {
    _language = value;
    notifyListeners();
  }
}
