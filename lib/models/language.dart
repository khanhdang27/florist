class Language {
  final int id;
  final String name;
  final String languageCode;
  final String code;

  Language(this.id, this.name, this.languageCode, this.code);

  static List<Language> languageList() {
    return <Language>[
      Language(1, 'English', 'en', 'en'),
      Language(2, '繁體中文', 'zh', 'zh'),   //Traditional Chinese
      Language(3, '简体中文', 'zh', 'zh_CN'),//Simplify Chinese
    ];
  }
}