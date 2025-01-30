import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as t;
import 'package:lottie/lottie.dart';
import '../../../../../../../generated/locales.g.dart';
import '../../../../../../../global/controllers/language_controller.dart';
import '../../../../../../../global/global_widget/custom_date_picker.dart';
import '../../../../../../../global/global_widget/custom_text_form_field.dart';
import '../../../../../login/controllers/login_controller.dart';
import '../../../../controllers/home_controller.dart';
import '../../../../model/sales/getAllCustomers/Data.dart';
import '../../transport/dialog_loading.dart';
import '../items_groups/custom_list_text_field_with_search.dart';

class BuildUiInCustomer extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    final login = Get.put(LoginController());
    return Obx(() => Container(
      color: Colors.white,
      child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
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
                      controller.editCustomersSales.value == true ||
                          controller.addCustomersSales.value == true
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
                                    AllCustomersList data =
                                    AllCustomersList(
                                      id: controller.editCustomersSales
                                          .value ==
                                          true
                                          ? controller
                                          .selectedCustomers.value.id
                                          : 0,
                                      code: controller
                                          .codeCustomersSales.text,
                                      nameA: controller
                                          .arNameCustomersSales.text,
                                      nameE: controller
                                          .enNameCustomersSales.text,
                                      partnerGroupId: controller
                                          .selectedItemGroups.value.id,
                                      dealDateHijri: controller
                                          .editCustomersSales
                                          .value ==
                                          true
                                          ? ""
                                          : DateTime.parse(controller
                                          .invoiceDateV.value
                                          .toString())
                                          .toIso8601String(),
                                      address: controller
                                          .addressCustomersSales.text,
                                      taxFileNo:
                                      controller.taxCustomersSales.text,
                                      email: controller
                                          .emailCustomersSales.text,
                                      telephone:
                                      controller.telCustomersSales.text,
                                    );

                                    if (controller
                                        .editCustomersSales.value ==
                                        true) {
                                      controller.load.value = false;
                                      (controller.load == false)
                                          ? showLoadingDialog(context,
                                          LocaleKeys.loadEdit.tr)
                                          : null;
                                      await controller
                                          .addCustomers(context, () {
                                        login.loginPinCodeController
                                            .clear();
                                      }, data).then((value) {
                                        Get.back();
                                        controller.load.value = true;
                                      });
                                    }
                                    else {
                                      controller.load.value = false;
                                      (controller.load == false)
                                          ? showLoadingDialog(context,
                                          LocaleKeys.loadAdd.tr)
                                          : null;
                                      await controller.addCustomers(context,
                                              () {
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
                                        .addCustomersSales.value ==
                                        true) {
                                      controller.clearItemsAddCustomers();
                                    }
                                    // controller.selectedListField(
                                    //     controller.allProductGroups.value
                                    //         .getGroupName(controller
                                    //         .selectedCustomers
                                    //         .value
                                    //         .partnerGroupId ??
                                    //         0));
                                    controller.selectedCustomerListField(
                                        controller
                                            .selectedCustomers.value);
                                    controller.addCustomersSales.value =
                                    false;
                                    controller.editCustomersSales.value =
                                    false;
                                    controller.salesCustomer.value = true;
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
                      Container(),
                    ],
                  ),
                ),
              ),
              (controller.noDataGetGroupProduct.value == true)
                  ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Text(
                      LocaleKeys.noCustomersRequest.tr,
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
                      right: 12.0, left: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                          textDirection:
                              Get.find<LanguageController>().isArabic ||
                                      Get.find<LanguageController>().isUrdo ||
                                      Get.find<LanguageController>().isHindi
                                  ? TextDirection.rtl
                                  : TextDirection.ltr,
                          children: [
                            controller.addCustomersSales.value == true
                                ? Container()
                                : CustomersListTextField(
                                    suggetionCallBack: (pattern) async {
                                      final suggestions = controller
                                          .getAllCustomers.value
                                          .getAllCustomers(pattern);
                                      return suggestions;
                                    },
                                    onSuggetionSelected: (p) async {
                                      controller.selectedListField(controller
                                          .allProductGroups.value
                                          .getGroupName(p.partnerGroupId));
                                      controller.selectedCustomerListField(p);
                                    },
                                    controller: controller.customersListField,
                                    hintText: LocaleKeys.customers.tr,
                                    executeClose: () {
                                      controller.clearItemsAddCustomers();
                                      controller.customersListField.clear();
                                    },
                                  ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              LocaleKeys.code.tr,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            CustomTextFormField(
                              readOnly: controller.editCustomersSales.value ==
                                          true ||
                                      controller.addCustomersSales.value == true
                                  ? false
                                  : true,
                              controller: controller.codeCustomersSales,
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
                            SizedBox(
                              height: 2,
                            ),
                            CustomTextFormField(
                              textAlign:
                                  Get.find<LanguageController>().isArabic ||
                                          Get.find<LanguageController>().isUrdo ||
                                          Get.find<LanguageController>().isHindi
                                      ? TextAlign.right
                                      : TextAlign.left,
                              readOnly: controller.editCustomersSales.value ==
                                          true ||
                                      controller.addCustomersSales.value == true
                                  ? false
                                  : true,
                              controller: controller.enNameCustomersSales,
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
                            SizedBox(
                              height: 2,
                            ),
                            CustomTextFormField(
                              textAlign:
                                  Get.find<LanguageController>().isArabic ||
                                          Get.find<LanguageController>().isUrdo ||
                                          Get.find<LanguageController>().isHindi
                                      ? TextAlign.right
                                      : TextAlign.left,
                              readOnly: controller.editCustomersSales.value ==
                                          true ||
                                      controller.addCustomersSales.value == true
                                  ? false
                                  : true,
                              controller: controller.arNameCustomersSales,
                              type: TextInputType.name,
                              color: Colors.white,
                              radius: 14,
                              onChanged: (v) {},
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              LocaleKeys.groupName.tr,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            controller.editCustomersSales.value == true ||
                                    controller.addCustomersSales.value == true
                                ? GroupNameListTextField(
                                    suggetionCallBack: (pattern) async {
                                      final suggestions = controller
                                          .allProductGroups.value
                                          .getCustomersWithHasChildren(pattern);
                                      return suggestions;
                                    },
                                    onSuggetionSelected: (p) async {
                                      controller.selectedListField(p);
                                    },
                                    controller: controller.itemGroupListField,
                                    hintText: LocaleKeys.groupName.tr,
                                    executeClose: () {},
                                  )
                                : CustomTextFormField(
                                    readOnly: controller
                                                    .editCustomersSales.value ==
                                                true ||
                                            controller.addCustomersSales.value ==
                                                true
                                        ? false
                                        : true,
                                    textAlign: Get.find<LanguageController>()
                                                .isArabic ||
                                            Get.find<LanguageController>()
                                                .isUrdo ||
                                            Get.find<LanguageController>().isHindi
                                        ? TextAlign.right
                                        : TextAlign.left,
                                    controller: controller.itemGroupListField,
                                    type: TextInputType.name,
                                    color: Colors.white,
                                    radius: 14,
                                    onChanged: (v) {},
                                  ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              LocaleKeys.addressSender.tr,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            CustomTextFormField(
                              readOnly: controller.editCustomersSales.value ==
                                          true ||
                                      controller.addCustomersSales.value == true
                                  ? false
                                  : true,
                              textAlign:
                                  Get.find<LanguageController>().isArabic ||
                                          Get.find<LanguageController>().isUrdo ||
                                          Get.find<LanguageController>().isHindi
                                      ? TextAlign.right
                                      : TextAlign.left,
                              controller: controller.addressCustomersSales,
                              type: TextInputType.name,
                              color: Colors.white,
                              radius: 14,
                              onChanged: (v) {},
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              LocaleKeys.taxFile.tr,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            CustomTextFormField(
                              readOnly: controller.editCustomersSales.value ==
                                          true ||
                                      controller.addCustomersSales.value == true
                                  ? false
                                  : true,
                              textAlign:
                                  Get.find<LanguageController>().isArabic ||
                                          Get.find<LanguageController>().isUrdo ||
                                          Get.find<LanguageController>().isHindi
                                      ? TextAlign.right
                                      : TextAlign.left,
                              controller: controller.taxCustomersSales,
                              type: TextInputType.number,
                              color: Colors.white,
                              radius: 14,
                              onChanged: (v) {},
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              LocaleKeys.email.tr,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            CustomTextFormField(
                              readOnly: controller.editCustomersSales.value ==
                                          true ||
                                      controller.addCustomersSales.value == true
                                  ? false
                                  : true,
                              textAlign:
                                  Get.find<LanguageController>().isArabic ||
                                          Get.find<LanguageController>().isUrdo ||
                                          Get.find<LanguageController>().isHindi
                                      ? TextAlign.right
                                      : TextAlign.left,
                              controller: controller.emailCustomersSales,
                              type: TextInputType.emailAddress,
                              color: Colors.white,
                              radius: 14,
                              onChanged: (v) {},
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              LocaleKeys.tel.tr,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            CustomTextFormField(
                              readOnly: controller.editCustomersSales.value ==
                                          true ||
                                      controller.addCustomersSales.value == true
                                  ? false
                                  : true,
                              textAlign:
                                  Get.find<LanguageController>().isArabic ||
                                          Get.find<LanguageController>().isUrdo ||
                                          Get.find<LanguageController>().isHindi
                                      ? TextAlign.right
                                      : TextAlign.left,
                              controller: controller.telCustomersSales,
                              type: TextInputType.number,
                              color: Colors.white,
                              radius: 14,
                              onChanged: (v) {},
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              LocaleKeys.dealDate.tr,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(14))),
                              child: CustomDateMonthTimePicker(
                                onChange: (value) {

                                  controller.invoiceDateV.value =
                                      value.toString();
                                },
                                controller: controller.birthDayCustomersSales,
                                label: '${DateTime.now()}',
                                format:
                                    Get.find<LanguageController>()
                                                    .selectedLanguage
                                                    ?.id ==
                                                1 ||
                                            Get.find<LanguageController>()
                                                    .selectedLanguage
                                                    ?.id ==
                                                3 ||
                                            Get.find<LanguageController>()
                                                    .selectedLanguage
                                                    ?.id ==
                                                4
                                        ? t.DateFormat('yyyy/MM/dd')
                                        : t.DateFormat('dd/MM/yyyy'),
                              ),
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
