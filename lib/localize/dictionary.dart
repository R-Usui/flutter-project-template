import 'package:flutter_project_template/localize/localized_string.dart';

class LocalizedDictionary {
  static const business = LocalizedString(
    "Business",
    {
      Language.japanese: "ビジネス",
      Language.kana: "びじねす",
    },
  );

  static const home = LocalizedString(
    "Home",
    {
      Language.japanese: "ホーム",
      Language.kana: "ほーむ",
    },
  );

  static const index = LocalizedString(
    "Index",
    {
      Language.japanese: "インデックス",
      Language.kana: "いんでっくす",
    },
  );

  static const sample = LocalizedString(
    "Sample",
    {
      Language.japanese: "サンプル",
      Language.kana: "さんぷる",
    },
  );

  static const school = LocalizedString(
    "School",
    {
      Language.japanese: "ガッコウ",
      Language.kana: "がっこう",
    },
  );
}
