import 'package:flutter/material.dart';
import 'package:flutter_localization/src/localization/localization_controller.dart';
import 'package:flutter_localization/src/constants/languages.dart';
import 'package:get/get.dart';

class LanguagePicker extends StatelessWidget {
  const LanguagePicker({super.key, this.showIcon = true});

  final bool showIcon;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocalizationController>(
        builder: (localizationController) {
      return GestureDetector(
        onTap: () {
          showModalBottomSheet(
              context: context,
              backgroundColor: Colors.white,
              barrierColor: Colors.black.withOpacity(0.3),
              isDismissible: false,
              showDragHandle: false,
              builder: (BuildContext context) => SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(Get.context!).size.height * 0.2,
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.language,
                                      size: 20,
                                    ),
                                    const SizedBox(
                                      width: 16,
                                    ),
                                    Text(
                                      "change_language".tr,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall,
                                    ),
                                  ],
                                ),
                                IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: const Icon(Icons.clear))
                              ],
                            ),
                            const SizedBox(height: 20),
                            GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: localizationController
                                            .languages.length,
                                        mainAxisExtent: 40,
                                        crossAxisSpacing: 10),
                                itemCount:
                                    localizationController.languages.length,
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, index) =>
                                    GestureDetector(
                                      onTap: () {
                                        // Navigator.of(context).pop();
                                        localizationController.setLanguage(
                                            Locale(
                                                AppLanguages.languages[index]
                                                    .languageCode,
                                                AppLanguages.languages[index]
                                                    .countryCode));
                                        localizationController
                                            .setSelectIndex(index);
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 10),
                                        child: Text(
                                          localizationController
                                              .languages[index].name,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .apply(
                                                decoration:
                                                    localizationController
                                                                .selectedIndex ==
                                                            index
                                                        ? TextDecoration
                                                            .underline
                                                        : null,
                                              ),
                                        ),
                                      ),
                                    ))
                          ],
                        ),
                      ),
                    ),
                  ));
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                showIcon ? Icons.translate : null,
                size: 16,
                color: Colors.grey,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                AppLanguages.getLanguageName(
                    localizationController.locale.languageCode),
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .apply(color: Colors.grey, fontSizeFactor: 1.1),
              ),
            ],
          ),
        ),
      );
    });
  }
}
