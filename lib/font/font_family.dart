class FontFamilies {
  static const roboto = FontFamily("Roboto");
  static const mPlusRounded =
      FontFamily("MPLUSRounded1c", isEnglishOnly: false);

  static const values = [roboto, mPlusRounded];
}

class FontFamily {
  const FontFamily(this.name, {this.isEnglishOnly = true});

  final String name;
  final bool isEnglishOnly;
}
