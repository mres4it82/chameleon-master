import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../../../../../../generated/locales.g.dart';
import '../../../../../../../global/controllers/language_controller.dart';
import '../../../../../../../global/global_widget/custom_text_form_field.dart';
import '../../../../../login/controllers/login_controller.dart';
import '../../../../controllers/home_controller.dart';
import '../../../../model/sales/getAllProductUnit/Data.dart';
import '../../transport/dialog_loading.dart';

class BuildUiInProductUnit extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    final login = Get.put(LoginController());
    return Obx(() => Container(

      color: Colors.white,
      child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 5),
                child: Container(
                  alignment: Get.find<LanguageController>().isArabic ||
                          Get.find<LanguageController>().isUrdo ||
                          Get.find<LanguageController>().isHindi
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  child: Row(
                    children: [
                      controller.editProductUnitSales.value == true ||
                              controller.addProductUnitSales.value == true
                          ? Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Row(
                                children: [
                                  SizedBox(
                                      width: 40,
                                      height: 40,
                                      child: InkWell(
                                        onTap: () async {
                                          ProductUnitList data = ProductUnitList(
                                            id: controller.editProductUnitSales
                                                        .value ==
                                                    true
                                                ? controller.idPU.value
                                                : 0,
                                            code: controller.codePUSales.text,
                                            nameA: controller.arNamePUSales.text,
                                            nameE: controller.enNamePUSales.text,
                                            notes: controller.notesPUSales.text,
                                          );

                                          if (controller
                                                  .editProductUnitSales.value ==
                                              true) {
                                            if (controller.productUnitListField
                                                .text.isNotEmpty) {
                                              controller.load.value = false;
                                              (controller.load == false)
                                                  ? showLoadingDialog(context,
                                                      LocaleKeys.loadEdit.tr)
                                                  : null;


                                              await controller.addPU(context, () {
                                                login.loginPinCodeController
                                                    .clear();
                                              }, data).then((value) {
                                                Get.back();
                                                controller.load.value = true;
                                              });
                                            }
                                          } else {
                                            controller.load.value = false;
                                            (controller.load == false)
                                                ? showLoadingDialog(context,
                                                    LocaleKeys.loadAdd.tr)
                                                : null;
                                            await controller.addPU(context, () {
                                              login.loginPinCodeController
                                                  .clear();
                                            }, data).then((value) {
                                              Get.back();
                                              controller.load.value = true;
                                            });
                                          }
                                        },
                                        child: Image.asset(
                                          'assets/images/accept.png',
                                          width: 35,
                                          height: 35,
                                          fit: BoxFit.fill,
                                        ),
                                      )),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  SizedBox(
                                      width: 40,
                                      height: 40,
                                      child: InkWell(
                                        onTap: () {
                                          if (controller
                                                  .addProductUnitSales.value ==
                                              true) {
                                            controller.clearItemsProductUnit();
                                          }

                                          if (controller.productUnitListField.text
                                              .isNotEmpty) {
                                            controller
                                                .selectedProductUnitListField(
                                                    controller.selectedProductUnit
                                                        .value);
                                          }
                                          controller.addProductUnitSales.value =
                                              false;
                                          controller.editProductUnitSales.value =
                                              false;
                                          controller.salesProductUnit.value =
                                              true;
                                          controller.expandedCustomerRequest
                                              .value = true;
                                        },
                                        child: Image.asset(
                                          'assets/images/close.png',
                                          width: 35,
                                          height: 35,
                                          fit: BoxFit.fill,
                                        ),
                                      )),
                                ],
                              ),
                            )
                          : const Text(
                              '',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 16),
                            ),
                      const Spacer(),
                      Container()
                    ],
                  ),
                ),
              ),
              (controller.noDataGetProductUnit.value == true)
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Center(
                          child: Text(
                            LocaleKeys.noPURequest.tr,
                            style: const TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Text(
                            LocaleKeys.thankYou.tr,
                            style: const TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Lottie.asset(
                          'assets/images/lottie.json',
                          width: 200,
                          height: 200,
                          fit: BoxFit.fill,
                        )
                      ],
                    )
                  : Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            right: 12.0, left: 12.0, bottom: 12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          textDirection:
                              Get.find<LanguageController>().isArabic ||
                                      Get.find<LanguageController>().isUrdo ||
                                      Get.find<LanguageController>().isHindi
                                  ? TextDirection.rtl
                                  : TextDirection.ltr,
                          children: [

                            Text(
                              LocaleKeys.code.tr,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                              textAlign: TextAlign.start,
                            ),
                            CustomTextFormField(
                              readOnly: controller.editProductUnitSales.value ==
                                          true ||
                                      controller.addProductUnitSales.value == true
                                  ? false
                                  : true,
                              controller: controller.codePUSales,
                              type: TextInputType.text,
                              color: Colors.white,
                              radius: 14,
                              textAlign:
                                  Get.find<LanguageController>().isArabic ||
                                          Get.find<LanguageController>().isUrdo ||
                                          Get.find<LanguageController>().isHindi
                                      ? TextAlign.right
                                      : TextAlign.left,
                              onChanged: (v) {},
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              LocaleKeys.enName.tr,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                              textAlign: TextAlign.start,
                            ),
                            CustomTextFormField(
                              textAlign:
                                  Get.find<LanguageController>().isArabic ||
                                          Get.find<LanguageController>().isUrdo ||
                                          Get.find<LanguageController>().isHindi
                                      ? TextAlign.right
                                      : TextAlign.left,
                              readOnly: controller.editProductUnitSales.value ==
                                          true ||
                                      controller.addProductUnitSales.value == true
                                  ? false
                                  : true,
                              controller: controller.enNamePUSales,
                              type: TextInputType.name,
                              color: Colors.white,
                              radius: 14,
                              onChanged: (v) {},
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              LocaleKeys.arName.tr,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                              textAlign: TextAlign.start,
                            ),
                            CustomTextFormField(
                              textAlign:
                                  Get.find<LanguageController>().isArabic ||
                                          Get.find<LanguageController>().isUrdo ||
                                          Get.find<LanguageController>().isHindi
                                      ? TextAlign.right
                                      : TextAlign.left,
                              readOnly: controller.editProductUnitSales.value ==
                                          true ||
                                      controller.addProductUnitSales.value == true
                                  ? false
                                  : true,
                              controller: controller.arNamePUSales,
                              type: TextInputType.name,
                              color: Colors.white,
                              radius: 14,
                              onChanged: (v) {},
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              LocaleKeys.note.tr,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                              textAlign: TextAlign.start,
                            ),
                            CustomTextFormField(
                              readOnly: controller.editProductUnitSales.value ==
                                          true ||
                                      controller.addProductUnitSales.value == true
                                  ? false
                                  : true,
                              textAlign:
                                  Get.find<LanguageController>().isArabic ||
                                          Get.find<LanguageController>().isUrdo ||
                                          Get.find<LanguageController>().isHindi
                                      ? TextAlign.right
                                      : TextAlign.left,
                              controller: controller.notesPUSales,
                              type: TextInputType.name,
                              color: Colors.white,
                              radius: 14,
                              onChanged: (v) {},
                            ),

                          ],
                        ),
                      ),
                    ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
    ));
  }
}
