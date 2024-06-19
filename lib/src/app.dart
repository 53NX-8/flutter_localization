import 'package:flutter/material.dart';
import 'package:flutter_localization/src/constants/messages.dart';
import 'package:flutter_localization/src/localization/localization_controller.dart';
import 'package:flutter_localization/src/constants/languages.dart';
import 'package:flutter_localization/src/screens/home.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key, required this.languages});

  final Map<String, Map<String, String>> languages;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocalizationController>(
        builder: (localizationController) {
      return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.system,
          locale: localizationController.locale,
          translations: Messages(languages: languages),
          fallbackLocale: (Locale(AppLanguages.languages[0].languageCode,
              AppLanguages.languages[0].countryCode)),
          title: 'Flutter Localized',
          home: const HomeScreen());
    });
  }
}
