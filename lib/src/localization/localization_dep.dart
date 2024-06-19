import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_localization/src/localization/localization_controller.dart';
import 'package:flutter_localization/src/models/language_model.dart';
import 'package:flutter_localization/src/constants/languages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<Map<String, Map<String, String>>> init() async {
  Get.lazyPut(() => GetStorage());

  Get.lazyPut(() => LocalizationController(deviceStorage: Get.find()));

  Map<String, Map<String, String>> languages = {};

  for (LanguageModel languageModel in AppLanguages.languages) {
    String jsonStringValues = await rootBundle
        .loadString('lib/src/assets/langs/${languageModel.languageCode}.json');
    Map<String, dynamic> mappedJson = json.decode(jsonStringValues);
    Map<String, String> _json = {};
    mappedJson.forEach((key, value) {
      _json[key] = value.toString();
    });
    languages['${languageModel.languageCode}_${languageModel.countryCode}'] =
        _json;
  }

  return languages;
}
