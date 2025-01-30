import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import '../../../../../../../generated/locales.g.dart';
import '../../../../../../../global/controllers/language_controller.dart';
import '../../../../../../../global/global_widget/custom_text_form_field.dart';
import '../../../../../login/controllers/login_controller.dart';
import '../../../../controllers/home_controller.dart';
import '../../../../model/model_class.dart';
import '../../../../model/sales/getAllDiscountType/Data.dart';
import '../../transport/dialog_loading.dart';
import '../items_groups/custom_list_text_field_with_search.dart';

class BuildUiInDiscountType extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    final List<DropdownOption> dropdownOptions = [
      DropdownOption(id: 1, name: LocaleKeys.value2.tr),
      DropdownOption(id: 2, name: LocaleKeys.percent.tr),
    ];
     controller.selectedOption.value = dropdownOptions[0];
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
                      controller.editDiscountSales.value == true ||
                              controller.addDiscountSales.value == true
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
                                          DiscountTypeList data =
                                              DiscountTypeList(
                                                  id: controller.editDiscountSales
                                                              .value ==
                                                          true
                                                      ? controller
                                                          .selectedDiscountType
                                                          .value
                                                          .id
                                                      : 0,
                                                  code:
                                                      controller.codeDTSales.text,
                                                  nameA: controller
                                                      .nameADTSales.text,
                                                  nameE: controller
                                                      .nameEDTSales.text,
                                                  notes: controller
                                                      .notesDTSales.text,
                                                  value: controller.valueDT.value,
                                                  type: controller.selectedOption
                                                          .value?.id ??
                                                      0);

                                          if (controller
                                                  .editDiscountSales.value ==
                                              true) {
                                            if (controller.discountTypeListField
                                                .text.isNotEmpty) {
                                              controller.load.value = false;
                                              (controller.load == false)
                                                  ? showLoadingDialog(context,
                                                      LocaleKeys.loadEdit.tr)
                                                  : null;
                                              await controller.addDT(context, () {
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
                                            await controller.addDT(context, () {
                                              login.loginPinCodeController
                                                  .clear();
                                            }, data).then((value) {
                                              controller.discountType.text = controller
                                                  .selectedDiscountType
                                                  .value
                                                  .type ==
                                                  1
                                                  ? dropdownOptions.first.name
                                                  : dropdownOptions.last.name;
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
                                          if (controller.addDiscountSales.value ==
                                              true) {
                                            controller.clearItemsDiscountType();
                                          }

                                          if (controller.discountTypeListField
                                              .text.isNotEmpty) {
                                            controller
                                                .selectedDiscountTypeListField(
                                                    controller
                                                        .selectedDiscountType
                                                        .value);
                                          }
                                          controller.addDiscountSales.value =
                                              false;
                                          controller.editDiscountSales.value =
                                              false;
                                          controller.salesdiscountType.value =
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
                            LocaleKeys.noDTRequest.tr,
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
                              readOnly: controller.editDiscountSales.value ==
                                          true ||
                                      controller.addDiscountSales.value == true
                                  ? false
                                  : true,
                              controller: controller.codeDTSales,
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
                              readOnly: controller.editDiscountSales.value ==
                                          true ||
                                      controller.addDiscountSales.value == true
                                  ? false
                                  : true,
                              controller: controller.nameEDTSales,
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
                              readOnly: controller.editDiscountSales.value ==
                                          true ||
                                      controller.addDiscountSales.value == true
                                  ? false
                                  : true,
                              controller: controller.nameADTSales,
                              type: TextInputType.name,
                              color: Colors.white,
                              radius: 14,
                              onChanged: (v) {},
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            InkWell(
                              onTap: (){
                                log('ggggggggg = ${controller.selectedOption.value?.name}');
                              },
                              child: Text(
                                LocaleKeys.dt.tr,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 14),
                                textAlign: TextAlign.start,
                              ),
                            ),
                            controller.editDiscountSales.value == true ||
                                    controller.addDiscountSales.value == true
                                ? Obx(
                                    () => DropdownButton<DropdownOption>(
                                      // hint: const Text('Select an Option'),
                                      value: controller.editDiscountSales.value ==
                                          true ?controller
                                          .selectedDiscountType
                                          .value
                                          .type ==
                                          1
                                          ? dropdownOptions.first
                                          : dropdownOptions.last
                                      :
                                      controller.selectedOption.value,
                                      isExpanded: true,
                                      items: dropdownOptions.map((option) {
                                        return DropdownMenuItem<DropdownOption>(
                                          value: option,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(option.name),
                                          ),
                                        );
                                      }).toList(),
                                      onChanged: (DropdownOption? newValue) {
                                        controller.updateSelectedOption(newValue);

                                        // Handle the selected value
                                        if (newValue != null) {
                                          log('Selected: ${newValue.name}, ID: ${newValue.id}');
                                        }
                                      },
                                    ),
                                  )
                                : CustomTextFormField(
                                    readOnly: true,
                                    textAlign: Get.find<LanguageController>()
                                                .isArabic ||
                                            Get.find<LanguageController>()
                                                .isUrdo ||
                                            Get.find<LanguageController>().isHindi
                                        ? TextAlign.right
                                        : TextAlign.left,
                                    controller: controller.discountType,
                                    type: TextInputType.name,
                                    color: Colors.white,
                                    radius: 14,
                                    onChanged: (v) {
                                      // if(controller.valueDTSales.text.isNotEmpty){
                                      //
                                      //   controller.valueDT.value = double.parse(controller.valueDTSales.text);
                                      // }
                                    },
                                  ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              LocaleKeys.value.tr,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                              textAlign: TextAlign.start,
                            ),
                            CustomTextFormField(
                              readOnly: controller.editDiscountSales.value ==
                                          true ||
                                      controller.addDiscountSales.value == true
                                  ? false
                                  : true,
                              textAlign:
                                  Get.find<LanguageController>().isArabic ||
                                          Get.find<LanguageController>().isUrdo ||
                                          Get.find<LanguageController>().isHindi
                                      ? TextAlign.right
                                      : TextAlign.left,
                              controller: controller.valueDTSales,
                              type: TextInputType.number,
                              color: Colors.white,
                              radius: 14,
                              onChanged: (v) {
                                if (controller.valueDTSales.text.isNotEmpty) {
                                  controller.valueDT.value =
                                      double.parse(controller.valueDTSales.text);
                                }
                              },
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
                              readOnly: controller.editDiscountSales.value ==
                                          true ||
                                      controller.addDiscountSales.value == true
                                  ? false
                                  : true,
                              textAlign:
                                  Get.find<LanguageController>().isArabic ||
                                          Get.find<LanguageController>().isUrdo ||
                                          Get.find<LanguageController>().isHindi
                                      ? TextAlign.right
                                      : TextAlign.left,
                              controller: controller.notesDTSales,
                              type: TextInputType.name,
                              color: Colors.white,
                              radius: 14,
                              onChanged: (v) {},
                            ),
                            const SizedBox(
                              height: 10,
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
