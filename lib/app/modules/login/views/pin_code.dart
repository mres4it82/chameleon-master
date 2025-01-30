import 'package:chameleon/app/modules/login/views/widgets/custom_text_form_field.dart';
import 'package:chameleon/app/modules/login/views/widgets/my_text_button.dart';
import 'package:chameleon/generated/locales.g.dart';
import 'package:chameleon/global/constants/constants.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../global/controllers/language_controller.dart';
import '../../../../global/controllers/loading_controller.dart';
import '../controllers/login_controller.dart';

class PinCode extends GetView<LoginController> {
  final formKey = GlobalKey<FormState>();

  final loadingController = Get.find<LoadingController>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      backgroundColor: Colors.white,
      //resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
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
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SizedBox(height: 20),
                Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: InkWell(
                        onTap: () async {
                          await controller.executeBackPinCode();
                        },
                        child: Icon(
                          Get
                              .find<LanguageController>()
                              .isArabic ||
                              Get
                                  .find<LanguageController>()
                                  .isUrdo ||
                              Get
                                  .find<LanguageController>()
                                  .isHindi
                              ? Icons.arrow_forward : Icons.arrow_back,
                          color: Colors.grey,
                          size: 35,
                        ),
                      ),
                    )
                ),
                SizedBox(
                  height: kIsWeb ? size.height * 0.1 : size.height * 0.2,
                ),
                Padding(
                  padding: kIsWeb
                      ? controller.isLargeScreen(context) == true
                      ? const EdgeInsets.symmetric(horizontal: 240.0)
                      : controller.isMediumScreen(context) == true
                      ? const EdgeInsets.symmetric(horizontal: 170.0)
                      : const EdgeInsets.symmetric(horizontal: 50.0)
                      : const EdgeInsets.symmetric(horizontal: 50.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Image.asset(
                          'assets/images/ShortIcon.png',
                          height: 170,
                          width: 220,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        LocaleKeys.createPinCode.tr,
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                      const SizedBox(
                        height: 10,
                      ),

                      Obx(
                            () => CustomTextField(controller.cureentPin, () async {
                          await controller.onTapSubmittPinCode(context);
                        }, () {
                          controller.obscureText.value =
                              !controller.obscureText.value;
                          controller.update();
                        },
                            controller.pinCodeController,
                            'Please enter PIN code',
                            LocaleKeys.pinCode.tr,
                            controller.obscureText.value
                                ? Icons.visibility_off
                                : Icons.visibility,
                                iconColor,
                            controller.obscureText.value,
                            TextInputType.number,
                            '•'),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
                MyTextButton(
                    () async => await controller.onTapSubmittPinCode(context),
                    LocaleKeys.create.tr),
                const SizedBox(
                  height: 50,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
