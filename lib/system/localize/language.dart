enum Language {
  english,
  japanese,
  kana;

  Language get next => switch (this) {
        english => japanese,
        japanese => kana,
        kana => english,
      };
}
