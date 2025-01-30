import 'dart:developer';

import 'package:chameleon/app/modules/home/controllers/home_controller.dart';
import 'package:chameleon/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../global/controllers/language_controller.dart';
import '../../../../../global/models/language_model.dart';

class ChooseLanguageDropDown extends StatelessWidget {
  const ChooseLanguageDropDown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LanguageController>(
      builder: (logic) {
        return PopupMenuButton<LanguageModel>(

          icon: Container(
            margin: EdgeInsets.all(3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  logic.selectedLanguage?.name ?? '',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.black),
                ),

                Spacer(),
                const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.black,
                )
              ],
            ),
          ),

          padding: const EdgeInsets.all(0),
          onSelected: (language) async {
            var cont = Get.put(HomeController());
            await logic.changeLanguageAsWeNeed(language);
            if (cont.transport.value == true) {
              cont.label.value = LocaleKeys.transport.tr;
            }
            else if (cont.hr.value == true) {
              cont.label.value = LocaleKeys.humanResource.tr;
            }
            else if (cont.sales.value == true) {
              cont.label.value = LocaleKeys.sales.tr;
            }
            else if (cont.settings.value == true) {
              cont.label.value = LocaleKeys.settings.tr;
            }
            else {
              cont.label.value = LocaleKeys.logOff.tr;
            }

            logic.writeLangInFile(language);
            log('lang choose = ${language.name}');
          },
          itemBuilder: (BuildContext context) {
            return LanguageModel.supportedLanguages
                .map(
                  (lang) => PopupMenuItem<LanguageModel>(
                    value: lang,
                    child: Text(
                      lang.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.black),
                    ),
                  ),
                )
                .toList();
          },
        );
      },
    );
  }
}
