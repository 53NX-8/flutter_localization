import 'package:flutter/material.dart';
import 'package:flutter_localization/src/app.dart';
import 'package:get_storage/get_storage.dart';
import 'src/localization/localization_dep.dart' as dep;

Future<void> main() async {
  await GetStorage.init();
  Map<String, Map<String, String>> languages = await dep.init();
  runApp(App(
    languages: languages,
  ));
}
