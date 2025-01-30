
import 'package:chameleon/app/modules/home/views/widget/custom_menu_home.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../generated/locales.g.dart';
import '../../../../../global/controllers/language_controller.dart';
import '../../../login/controllers/login_controller.dart';
import '../../controllers/home_controller.dart';

class CustomHeaderHome extends GetView<HomeController> {

  @override
  Widget build(BuildContext context) {

    var isWeb = kIsWeb;
    final login = Get.put(LoginController());
    return Row(
      textDirection: Get
          .find<LanguageController>()
          .isArabic
          ? TextDirection.rtl
          : Get
          .find<LanguageController>()
          .isUrdo
          ? TextDirection.rtl
          : Get
          .find<LanguageController>()
          .isHindi
          ? TextDirection.rtl
          : TextDirection.ltr,
      mainAxisAlignment:
      isWeb ? MainAxisAlignment.center : MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Text(
            LocaleKeys.goodEvening.tr,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.red, fontSize: 22),
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          '${login.user.data?.mobileUserName}',
          style: const TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16),
        ),
        Spacer(),

        SizedBox(
            width: Get
                .find<LanguageController>()
                .isArabic
                ? (controller.indexSystem.value == 0 ||
                controller.indexSystem.value == 3 ||
                controller.indexSystem.value == 2)
                ? 90
                : 120
                : Get
                .find<LanguageController>()
                .isEn
                ? (controller.indexSystem.value == 0)
                ? 140
                : (controller.indexSystem.value == 1||
                controller.indexSystem.value == 2)
                ? 70
                : 90
                :
            Get
                .find<LanguageController>()
                .isUrdo ?
            (controller.indexSystem.value == 1) ?
            110 :
            (controller.indexSystem.value == 0) ? 60 : 80
                :
            Get
                .find<LanguageController>()
                .isHindi ?
            (controller.indexSystem.value == 1) ?
            120 :
            controller.indexSystem.value == 4 ? 100 : 80
                :
            (controller.indexSystem.value == 0)
                ? 140
                : (controller.indexSystem.value == 1)
                ? 70
                : (controller.indexSystem.value == 4) ?
            140
                : 120

            ,
            child: CustomMenuHome()),
        SizedBox(
          width: 8,
        )

      ],
    );
  }
}
