import 'dart:developer';

import 'package:chameleon/app/modules/login/views/widgets/choose_language_drop_down.dart';
import 'package:chameleon/app/modules/login/views/widgets/custom_text_form_field.dart';
import 'package:chameleon/generated/locales.g.dart';
import 'package:chameleon/global/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../../global/controllers/language_controller.dart';
import '../../../../global/controllers/loading_controller.dart';
import '../../../routes/app_pages.dart';
import '../controllers/login_controller.dart';

class LoginPinCode extends GetView<LoginController> {
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: size.height * 0.2,
                ),
                kIsWeb
                    ? Padding(
                  padding: controller.isLargeScreen(context) == true
                      ? EdgeInsets.symmetric(horizontal: 240.0)
                      : controller.isMediumScreen(context) == true
                      ? EdgeInsets.symmetric(horizontal: 170.0)
                      : EdgeInsets.symmetric(horizontal: 50.0),
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
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            LocaleKeys.pinCode.tr,
                            style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: Colors.black),
                            textAlign: TextAlign.end,
                          ),
                          const Padding(
                            padding:
                            EdgeInsets.symmetric(horizontal: 15.0),
                            child: ChooseLanguageDropDown(),
                          ),
                        ],
                      ),
                      Obx(
                            () =>
                            Row(
                              children: [
                                  Expanded(
                                    child: CustomTextField(
                                        controller.passwordFocusNode, () {
                                      controller
                                          .onTapSubmittLoginButton(context);
                                    }, () {
                                      controller.changeObscure();
                                    },
                                        controller.loginPinCodeController,
                                        'Please enter PIN code',
                                        LocaleKeys.pinCode.tr,
                                        controller.obscureTextPinCode.value
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                        iconColor,
                                        controller.obscureTextPinCode.value,
                                        TextInputType.number,
                                        '*'),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  InkWell(
                                    onTap: () => controller
                                        .onTapSubmittLoginButton(context),
                                    child: CircleAvatar(
                                        radius: 20,
                                        backgroundColor: Colors.green,
                                        child: Get.find<LanguageController>()
                                                    .isArabic ||
                                                Get.find<LanguageController>()
                                                    .isUrdo
                                            ? const Icon(
                                                CupertinoIcons.arrow_left,
                                        color: Colors.white,
                                      )
                                          : const Icon(
                                        CupertinoIcons.arrow_right,
                                        color: Colors.white,
                                      )),
                                )
                              ],
                            ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(
                            FontAwesomeIcons.user,
                            color: Colors.green,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          InkWell(
                            onTap: () {
                              controller.pinCodeController.clear();
                              controller.loginPinCodeController.clear();
                              controller.usernameController.clear();
                              controller.passwordController.clear();

                              controller.readFile().then((value) {
                                      Get.toNamed(
                                  Routes.LOGINWITHOUTCOMPANYCODE,
                                );
                              });
                            },
                            child: Text(
                              LocaleKeys.changeUser.tr,
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                           Icon(
                            Icons.work_history_outlined,
                            color: iconColor,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          InkWell(
                            onTap: () {
                              //log('pinCodeController = ${controller.pinCodeController.text}');
                              controller.pinCodeController.clear();
                              controller.loginPinCodeController.clear();
                              controller.companyCodeController.clear();
                              controller.usernameController.clear();
                              controller.passwordController.clear();
                              controller.readFile().then((value) {
                                      Get.toNamed(
                                  Routes.LOGIN,
                                );
                              });
                            },
                            child: Text(
                              LocaleKeys.changeComapny.tr,
                              style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                           Icon(
                            Icons.change_circle_outlined,
                            color: iconColor,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          InkWell(
                            onTap: () {
                              controller.pinCodeController.clear();
                              controller.loginPinCodeController.clear();
                              controller.oldPinCodeController.clear();
                              controller.newPinCodeController.clear();

                              controller.readFile().then((value) {
                                      Get.toNamed(
                                  Routes.CHANGEPIN,
                                );
                              });
                            },
                            child: Text(
                              LocaleKeys.changePINCode.tr,
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.fingerprint,
                            color: Colors.green.shade700,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          InkWell(
                            onTap: () async {
                              bool auth = await controller
                                  .authenticateWithFingerment(context);
                              if (auth) {
                                      controller.readFile().then((value) {
                                        controller.loginPINCode(
                                      value.userName!,
                                      value.password!,
                                      value.companyCode!,
                                      Get
                                          .find<LanguageController>()
                                          .selectedLanguage
                                          ?.id ??
                                          2);
                                });
                              } else {
                                log('auth value xxxxxxx= $auth');
                                return;
                              }
                            },
                            child: Text(
                              LocaleKeys.fingerprint.tr,
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
                    : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            LocaleKeys.pinCode.tr,
                            style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: Colors.black),
                            textAlign: TextAlign.end,
                          ),
                          Padding(
                            padding:
                            EdgeInsets.symmetric(horizontal: 15.0),
                            child: SizedBox(
                                width: Get
                                    .find<LanguageController>()
                                    .isUrdo ||
                                    Get
                                        .find<LanguageController>()
                                        .isHindi
                                    ? 60
                                    : 80,
                                child: ChooseLanguageDropDown()),
                          ),
                        ],
                      ),
                      Obx(
                            () =>
                            Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    obscureText: controller.obscureTextPinCode
                                        .value,
                                    obscuringCharacter: '*',

                                    style: const TextStyle(fontSize: 12),
                                    cursorColor: Colors.black,
                                    controller: controller
                                        .loginPinCodeController,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter PIN code';
                                      }
                                      return null;
                                    },
                                    keyboardType: TextInputType.number,
                                    onFieldSubmitted: (s) {
                                      if (controller.loginPinCodeController
                                          .text ==
                                          controller.pinCodeController.text) {
                                        controller.readFile().then((value) {
                                            controller.loginPINCode(
                                              value.userName!,
                                              value.password!,
                                              value.companyCode!,

                                              Get
                                                  .find<LanguageController>()
                                                  .selectedLanguage
                                                  ?.id ??
                                                  2);
                                        });
                                      } else {
                                        var snackBar = SnackBar(
                                          content: Text(
                                            LocaleKeys.pinCodeNotCorrect.tr,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w900,
                                                fontSize: 18),
                                          ),
                                          backgroundColor: Colors.red,
                                        );
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          snackBar,
                                        );

                                        return;
                                      }
                                    },
                                    decoration: InputDecoration(
                                      suffixIcon: Container(
                                          margin: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.transparent,
                                              border:
                                              Border.all(color: Colors.grey)),
                                          child: InkWell(
                                            onTap: () =>
                                                controller.changeObscure(),
                                            child: Icon(
                                                controller
                                                    .obscureTextPinCode.value
                                                    ? Icons.visibility_off
                                                    : Icons.visibility,
                                                color: iconColor,
                                                size: 20),
                                          )),
                                      hintText: LocaleKeys.pinCode.tr,
                                      filled: true,
                                      fillColor: Colors.grey.shade200,
                                      hintStyle: const TextStyle(
                                          fontSize: 14, color: Colors.grey),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey.shade200,
                                              width: 1)),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey.shade200,
                                              width: 1)),
                                      disabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey.shade200,
                                              width: 1)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey.shade200,
                                              width: 1)),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                InkWell(
                                  onTap: () {
                                    if (controller.loginPinCodeController
                                        .text ==
                                        controller.pinCodeController.text) {
                                      controller.readFile().then((value) {
                                          controller.loginPINCode(
                                            value.userName!,
                                            value.password!,
                                            value.companyCode!,

                                            Get
                                                .find<LanguageController>()
                                                .selectedLanguage
                                                ?.id ??
                                                2);
                                      });
                                    } else {
                                      var snackBar = SnackBar(
                                        content: Text(
                                          LocaleKeys.pinCodeNotCorrect.tr,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w900,
                                              fontSize: 18),
                                        ),
                                        backgroundColor: Colors.red,
                                      );
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        snackBar,
                                      );

                                      return;
                                    }
                                  },
                                  child: CircleAvatar(
                                      radius: 20,
                                      backgroundColor: iconColor,
                                      child: Get
                                          .find<LanguageController>()
                                          .isArabic ||
                                          Get
                                              .find<LanguageController>()
                                              .isUrdo
                                          ? const Icon(
                                        CupertinoIcons.arrow_left,
                                        color: Colors.white,
                                      )
                                          : const Icon(
                                        CupertinoIcons.arrow_right,
                                        color: Colors.white,
                                      )),
                                )
                              ],
                            ),
                      ),

                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                           Icon(
                            FontAwesomeIcons.user,
                            color: iconColor,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          InkWell(
                            onTap: () {
                              controller.pinCodeController.clear();
                              controller.loginPinCodeController.clear();
                              controller.usernameController.clear();
                              controller.passwordController.clear();

                              controller.readFile().then((value) {
                                      Get.toNamed(
                                  Routes.LOGINWITHOUTCOMPANYCODE,
                                );
                              });
                            },
                            child: Text(
                              LocaleKeys.changeUser.tr,
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                           Icon(
                            Icons.work_history_outlined,
                            color: iconColor,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          InkWell(
                            onTap: () {
                              //log('pinCodeController = ${controller.pinCodeController.text}');
                              controller.pinCodeController.clear();
                              controller.loginPinCodeController.clear();
                              controller.companyCodeController.clear();
                              controller.usernameController.clear();
                              controller.passwordController.clear();
                              controller.readFile().then((value) {
                                      Get.toNamed(
                                  Routes.LOGIN,
                                );
                              });
                            },
                            child: Text(
                              LocaleKeys.changeComapny.tr,
                              style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                           Icon(
                            Icons.change_circle_outlined,
                            color: iconColor,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          InkWell(
                            onTap: () {
                              controller.pinCodeController.clear();
                              controller.loginPinCodeController.clear();
                              controller.oldPinCodeController.clear();
                              controller.newPinCodeController.clear();

                              controller.readFile().then((value) {
                                      Get.toNamed(
                                  Routes.CHANGEPIN,
                                );
                              });
                            },
                            child: Text(
                              LocaleKeys.changePINCode.tr,
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.fingerprint,
                            color: iconColor,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          InkWell(
                            onTap: () async {
                              bool auth = await controller
                                  .authenticateWithFingerment(context);
                              if (auth) {
                                      controller.readFile().then((value) {
                                        controller.loginPINCode(
                                      value.userName!,
                                      value.password!,
                                      value.companyCode!,

                                      Get
                                          .find<LanguageController>()
                                          .selectedLanguage
                                          ?.id ??
                                          2);
                                });
                              } else {
                                log('auth value xxxxxxx= $auth');
                                return;
                              }
                            },
                            child: Text(
                              LocaleKeys.fingerprint.tr,
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
