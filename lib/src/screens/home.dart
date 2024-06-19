import 'package:flutter/material.dart';
import 'package:flutter_localization/src/widgets/language_picker.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [LanguagePicker()],
      ),
      body: Center(
        child: Text(
          "message".tr,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
    );
  }
}
