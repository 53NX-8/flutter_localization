// ignore_for_file: constant_identifier_names

import 'package:flutter_localization/src/models/language_model.dart';

class AppLanguages {
  static const String COUNTRY_CODE = 'country_code';
  static const String LANGUAGE_CODE = 'language_code';

  static List<LanguageModel> languages = [
    LanguageModel(name: "English", languageCode: "en", countryCode: "US"),
    LanguageModel(name: "አማርኛ", languageCode: "am", countryCode: "ET"),
  ];

  static String getLanguageName(String languageCode) {
    final language = languages.firstWhere(
      (lang) => lang.languageCode == languageCode,
    );
    return language.name;
  }
}
