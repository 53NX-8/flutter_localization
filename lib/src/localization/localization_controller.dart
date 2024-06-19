import 'package:flutter/material.dart';
import 'package:flutter_localization/src/models/language_model.dart';
import 'package:flutter_localization/src/constants/languages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LocalizationController extends GetxController implements GetxService {
  final GetStorage deviceStorage;

  LocalizationController({required this.deviceStorage}) {
    loadLanguage();
  }

  Locale _locale = Locale(AppLanguages.languages[0].languageCode,
      AppLanguages.languages[0].countryCode);
  Locale get locale => _locale;

  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  List<LanguageModel> _languages = [];

  List<LanguageModel> get languages => _languages;

  void loadLanguage() async {
    _locale = Locale(
        deviceStorage.read(AppLanguages.LANGUAGE_CODE) ??
            AppLanguages.languages[0].languageCode,
        deviceStorage.read(AppLanguages.COUNTRY_CODE) ??
            AppLanguages.languages[0].countryCode);

    for (int index = 0; index < AppLanguages.languages.length; index++) {
      if (AppLanguages.languages[index].languageCode == _locale.languageCode) {
        _selectedIndex = index;
        break;
      }
    }

    _languages = [];
    _languages.addAll(AppLanguages.languages);

    update();
  }

  void setLanguage(Locale locale) {
    Get.updateLocale(locale);
    _locale = locale;
    saveLanguage(_locale);
    update();
  }

  void setSelectIndex(int index) {
    _selectedIndex = index;
    update();
  }

  void saveLanguage(Locale locale) async {
    deviceStorage.write(AppLanguages.LANGUAGE_CODE, locale.languageCode);
    deviceStorage.write(AppLanguages.COUNTRY_CODE, locale.countryCode);
  }
}
