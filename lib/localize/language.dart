enum Language {
  english,
  japanese,
  kana;

  Language get next => switch (this) {
        english => japanese,
        japanese => kana,
        kana => english,
      };

  @override
  String toString() {
    return switch (this) {
      Language.english => "English",
      Language.japanese => "日本語",
      Language.kana => "にほんご",
    };
  }
}
