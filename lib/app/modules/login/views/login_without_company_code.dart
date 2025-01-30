import 'package:chameleon/app/modules/login/views/widgets/custom_background.dart';
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

class LoginViewWithoutCompanyCode extends GetView<LoginController> {
  final languageController = Get.find<LanguageController>();
  // define loading controller instance
  final loadingController = Get.find<LoadingController>();

  // define new form key instance
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                // textDirection: TextDirection.ltr,
                children: [
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: InkWell(
                          onTap: () async => controller.executeBackLoginView(),
                          child: Icon(
                            Get.find<LanguageController>().isArabic ||
                                    Get.find<LanguageController>().isUrdo ||
                                    Get.find<LanguageController>().isHindi
                                ? Icons.arrow_forward : Icons.arrow_back,
                            color: Colors.grey,
                            size: 35,
                          ),
                        )
                    ),
                  ),
                  SizedBox(
                    height: kIsWeb
                        ? MediaQuery
                        .of(context)
                        .size
                        .height * 0.01
                        : MediaQuery
                        .of(context)
                        .size
                        .height * 0.1,
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

                        CustomBackground(0.1, 0.01, false),
                        // space
                        SizedBox(
                          height:
                          MediaQuery
                              .of(context)
                              .size
                              .height * 0.04,
                        ),

                        Text(
                          LocaleKeys.username.tr,
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.black
                            //color: Colors.orange.shade800
                          ),
                        ),
                        const SizedBox(
                            height: 5
                        ),
                        // username field

                        CustomTextField(
                            controller.usernameFocusNode,
                                () => FocusScope.of(context)
                                .requestFocus(controller.passwordFocusNode),
                            () {},
                            controller.usernameController,
                            'Please enter your username',
                            LocaleKeys.username.tr,
                            Icons.person_2_outlined,
                            Colors.orange,
                            false,
                            TextInputType.text,
                            '•'),

                        // space
                        const SizedBox(height: 10),

                        // password field
                        Text(
                          LocaleKeys.password.tr,
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                        const SizedBox(
                            height: 5
                        ),
                        Obx(
                              () =>
                              CustomTextField(
                                  controller.passwordFocusNode,
                                      () {
                                    if (kIsWeb) {
                                      controller.readFileWeb().then((value) {
                                        controller.loginWithoutPINCodeWeb(
                                            controller.usernameController
                                                .text,
                                            controller.passwordController
                                                .text,
                                            value.companyCode!);
                                      });
                                    }
                                    else {
                                      controller.readFile().then((value) {
                                        controller.loginWithoutPINCode(
                                            controller.usernameController
                                                .text,
                                            controller.passwordController
                                                .text,
                                            value.companyCode!);
                                      });
                                    }
                                  },
                                      () {
                                    controller.obscureText.value =
                                    !controller.obscureText.value;
                            controller.update();
                          },
                              controller.passwordController,
                              'Please enter your password',
                              LocaleKeys.password.tr,
                              controller.obscureText.value
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                                  iconColor,
                              controller.obscureText.value,
                              TextInputType.text,
                              '•'),
                        ),
                        const SizedBox(height: 20),

                        MyTextButton(
                                () {
                              if (kIsWeb) {
                                controller.readFileWeb().then((value) {
                                  controller.loginWithoutPINCodeWeb(
                                      controller.usernameController
                                          .text,
                                      controller.passwordController
                                          .text,
                                      value.companyCode ?? '');
                                });
                              }
                              else {
                                controller.readFile().then((value) {
                                  controller.loginWithoutPINCode(
                                      controller.usernameController
                                          .text,
                                      controller.passwordController
                                          .text,
                                      value.companyCode ?? '');
                                });
                              }
                            },
                            LocaleKeys.login.tr),
                        const SizedBox(
                          height: 30,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
