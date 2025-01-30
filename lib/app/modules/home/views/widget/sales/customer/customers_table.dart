import 'dart:developer';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:intl/intl.dart' as intl;
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import '../../../../../../../../generated/locales.g.dart';
import '../../../../../../../../global/controllers/language_controller.dart';
import '../../../../controllers/home_controller.dart';
import '../../../../model/sales/getAllCustomers/Data.dart';
import '../../transport/dialog_loading.dart';


class CustomersTable extends GetView {

  final List<AllCustomersList> selectedItems;

  CustomersTable({required this.selectedItems});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return
        kIsWeb
            ?
        SizedBox(
          height: 120,
          child: HorizontalDataTable(
            enableRTL: Get
                .find<LanguageController>()
                .isArabic ||
                Get
                    .find<LanguageController>()
                    .isUrdo ||
                Get
                    .find<LanguageController>()
                    .isHindi
                ? true
                : false,
            verticalScrollbarStyle: const ScrollbarStyle(
              thumbColor: Colors.black,
              thickness: 3.0,
            ),
            horizontalScrollbarStyle: const ScrollbarStyle(
              thumbColor: Colors.black,
              thickness: 3.0,
            ),
            leftHandSideColumnWidth: 60,
            rightHandSideColumnWidth: 1040,
            isFixedHeader: true,
            headerWidgets: _getTitleWidget(),
            isFixedFooter: false,
            leftSideItemBuilder: _generateFirstColumnRow,
            rightSideItemBuilder: _generateRightHandSideColumnRow,
            itemCount: 1,
            rowSeparatorWidget: const Divider(
              color: Colors.transparent,
              height: 1.0,
              thickness: 0.0,
            ),

            leftHandSideColBackgroundColor: Colors.blue.shade50,
            rightHandSideColBackgroundColor: Colors.blue.shade50,
            itemExtent: 70,
          ),
        )
            :
        SizedBox(
          height: selectedItems.length == 1
              ? 130
              : selectedItems.length == 2
              ? 200
              : selectedItems.length == 3
              ? 250
              : selectedItems.length == 4
              ? 300
              : selectedItems.length == 5
              ? 350
              : selectedItems.length == 6
              ? 450
              : 500,
          child: HorizontalDataTable(
            enableRTL: Get
                .find<LanguageController>()
                .isArabic ||
                Get
                    .find<LanguageController>()
                    .isUrdo ||
                Get
                    .find<LanguageController>()
                    .isHindi
                ? true
                : false,
            verticalScrollbarStyle: const ScrollbarStyle(
              thumbColor: Colors.black,
              thickness: 3.0,
            ),
            horizontalScrollbarStyle: const ScrollbarStyle(
              thumbColor: Colors.black,
              thickness: 3.0,
            ),
            leftHandSideColumnWidth: 60,
            rightHandSideColumnWidth: 1040,
            isFixedHeader: true,
            headerWidgets: _getTitleWidget(),
            isFixedFooter: false,
            leftSideItemBuilder: _generateFirstColumnRow,
            rightSideItemBuilder: _generateRightHandSideColumnRow,
            itemCount: selectedItems.length,
            rowSeparatorWidget: const Divider(
              color: Colors.black54,
              height: 1.0,
              thickness: 0.0,
            ),
            leftHandSideColBackgroundColor: Colors.blue.shade50,
            rightHandSideColBackgroundColor: Colors.blue.shade50,
            itemExtent: 55,
          ),

        );
    });
  }
}

List<Widget> _getTitleWidget() {
  return [
    _getTitleFirstColumnWidget(LocaleKeys.code.tr, 100),
    _getTitleItemWidget(LocaleKeys.enName.tr, 100),
    _getTitleItemWidget(LocaleKeys.arName.tr, 100),
    _getTitleItemWidget(LocaleKeys.groupName.tr, 150),
    _getTitleItemWidget(LocaleKeys.addressSender.tr, 100),
    _getTitleItemWidget(LocaleKeys.taxFile.tr, 150),
    _getTitleItemWidget(LocaleKeys.email.tr, 100),
    _getTitleItemWidget(LocaleKeys.phone.tr, 100),
    _getTitleItemWidget(LocaleKeys.dealDate.tr, 100),
    _getTitleItemWidget(LocaleKeys.edit.tr, 70),
    _getTitleItemWidget(LocaleKeys.delete.tr, 70),

    //_getTitleItemWidget('', 30),
  ];
}

Widget _getTitleItemWidget(String label, double width) {
  return Container(
    color: const Color.fromRGBO(58, 116, 170, 1),
    width: width,
    height: 56,
    padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
    alignment: Get.find<LanguageController>().isArabic ||
        Get.find<LanguageController>().isUrdo ||
        Get.find<LanguageController>().isHindi
        ? Alignment.centerRight
        : Alignment.centerLeft,
    child: Text(label,
        style: const TextStyle(
            fontWeight: FontWeight.bold, color: Colors.white, fontSize: 14)),
  );
}

Widget _getTitleFirstColumnWidget(String label, double width) {
  return Container(
    color: const Color.fromRGBO(58, 116, 170, 1),
    width: width,
    height: 56,
    padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
    alignment: Alignment.center,
    child: Text(label,
        style: const TextStyle(
            fontWeight: FontWeight.bold, color: Colors.white, fontSize: 14)),
  );
}

Widget _generateFirstColumnRow(BuildContext context, int index) {

  var controller = Get.put(HomeController());
  return Obx(
      ()=> Container(
          width: 60,
          height: 52,
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.center,
          child: controller.getAllCustomers.value.data?[index].code == null ?
          Text('')
          :Text(
            '${controller.getAllCustomers.value.data?[index].code}',
          ),)

  );
}

Widget _generateRightHandSideColumnRow(BuildContext context, int index) {
  var controller = Get.put(HomeController());
  return  Row(
        children: <Widget>[
          Container(
            width: 100, // 70
            height: 52,
            padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
            alignment: Get.find<LanguageController>().isArabic ||
                Get.find<LanguageController>().isUrdo ||
                Get.find<LanguageController>().isHindi
                ? Alignment.centerRight
                : Alignment.centerLeft,
            child: controller.getAllCustomers.value.data?[index].nameE == null ?
            Text('')
                :Text(
              '${controller.getAllCustomers.value.data?[index].nameE}',
            ),
          ),
          Container(
            width: 100, // 130
            height: 52,
            padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
            alignment: Get.find<LanguageController>().isArabic ||
                Get.find<LanguageController>().isUrdo ||
                Get.find<LanguageController>().isHindi
                ? Alignment.centerRight
                : Alignment.centerLeft,
            child: controller.getAllCustomers.value.data?[index].nameA == null ?
            Text('')
                :Text(
              '${controller.getAllCustomers.value.data?[index].nameA}',
            ),
          ),
          Container(
            width: 150,  // 100
            height: 52,
            padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
            alignment: Get.find<LanguageController>().isArabic ||
                Get.find<LanguageController>().isUrdo ||
                Get.find<LanguageController>().isHindi
                ? Alignment.centerRight
                : Alignment.centerLeft,
            child: controller.selectedListField(controller
                .allProductGroups.value
                .getGroupName(
                controller.getAllCustomers.value.data?[index].partnerGroupId ??0)).groupNameWithCode == null ?
            Text('')
                :Text(
              '${controller.selectedListField(controller
                  .allProductGroups.value
                  .getGroupName(
                  controller.getAllCustomers.value.data?[index].partnerGroupId ??0)).groupNameWithCode}',
            ),
          ),
          Container(
            width: 100,
            height: 52,
            padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
            alignment: Get.find<LanguageController>().isArabic ||
                Get.find<LanguageController>().isUrdo ||
                Get.find<LanguageController>().isHindi
                ? Alignment.centerRight
                : Alignment.centerLeft,
            child: controller.getAllCustomers.value.data?[index].address == null ?
            Text('')
                :Text(
              '${controller.getAllCustomers.value.data?[index].address}',
            ),
          ),
          Container(
            width: 150,  // 100
            height: 52,
            padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
            alignment: Get.find<LanguageController>().isArabic ||
                Get.find<LanguageController>().isUrdo ||
                Get.find<LanguageController>().isHindi
                ? Alignment.centerRight
                : Alignment.centerLeft,
            child: controller.getAllCustomers.value.data?[index].taxFileNo == null ?
            Text('')
                :Text(
              '${controller.getAllCustomers.value.data?[index].taxFileNo}',
            ),
          ),
          Container(
            width: 100,
            height: 52,
            padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
            alignment: Get.find<LanguageController>().isArabic ||
                Get.find<LanguageController>().isUrdo ||
                Get.find<LanguageController>().isHindi
                ? Alignment.centerRight
                : Alignment.centerLeft,
            child: controller.getAllCustomers.value.data?[index].email == null ?
            Text('')
                :Text(
              '${controller.getAllCustomers.value.data?[index].email}',
            ),
          ),
          Container(
            width: 100,
            height: 52,
            padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
            alignment: Get.find<LanguageController>().isArabic ||
                Get.find<LanguageController>().isUrdo ||
                Get.find<LanguageController>().isHindi
                ? Alignment.centerRight
                : Alignment.centerLeft,
            child: controller.getAllCustomers.value.data?[index].telephone == null ?
            Text('')
                :Text(
              '${controller.getAllCustomers.value.data?[index].telephone}',
            ),
          ),
          Container(
            width: 100,
            height: 52,
            padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
            alignment: Get.find<LanguageController>().isArabic ||
                Get.find<LanguageController>().isUrdo ||
                Get.find<LanguageController>().isHindi
                ? Alignment.centerRight
                : Alignment.centerLeft,
            child: controller
                .getAllCustomers.value.data?[index].dealDateGregi ==
                null
                ? const Text('')
                : Get
                .find<LanguageController>()
                .isArabic ||
                Get
                    .find<LanguageController>()
                    .isUrdo ||
                Get
                    .find<LanguageController>()
                    .isHindi
                ? Text(
              intl.DateFormat('yyyy-MM-dd').format(
                  DateTime.parse(
                      controller.getAllCustomers.value.data?[index].dealDateGregi ?? '')),
            )
                : Text(
              intl.DateFormat('dd-MM-yyyy').format(DateTime.parse(
                  controller
                      .getAllCustomers.value.data?[index].dealDateGregi ??
                      '')),
            ),
          ),
          InkWell(
              onTap: () {
                controller.editCustomersSales.value = true;

                controller.selectedListField(controller
                    .allProductGroups.value
                    .getGroupName(controller.getAllCustomers.value.data?[index].partnerGroupId ??0));
                controller.selectedCustomerListField(controller.getAllCustomers.value.data?[index]?? AllCustomersList());
                },
              child: Container(
                width: 70,
                height: 52,
                padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                alignment: Get.find<LanguageController>().isArabic ||
                    Get.find<LanguageController>().isUrdo ||
                    Get.find<LanguageController>().isHindi
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                child: Icon(Icons.edit, color: Colors.green,),
              )
          ),
          InkWell(
            onTap: () async {
              if (controller.addCustomersSales
                  .value ==
                  false &&
                  controller.editCustomersSales
                      .value ==
                      false) {

                  QuickAlert.show(
                    context: context,
                    title: '',
                    type: QuickAlertType.warning,
                    barrierDismissible: false,
                    text:
                    ' ${LocaleKeys.makeDelete.tr}',
                    headerBackgroundColor:
                    Colors.orange,
                    confirmBtnColor: Colors.green,
                    // cancelBtnColor: Colors.red.shade700,
                    showConfirmBtn: true,
                    cancelBtnTextStyle:
                    const TextStyle(
                        color: Colors.white,
                        fontWeight:
                        FontWeight.bold,
                        fontSize: 16),
                    confirmBtnText:
                    LocaleKeys.ok.tr,
                    cancelBtnText:
                    LocaleKeys.cancel.tr,
                    showCancelBtn: true,
                    onConfirmBtnTap: () async {
                      Get.back();
                      controller.load.value = false;
                      (controller.load == false)
                          ? showLoadingDialog(
                          context,
                          LocaleKeys
                              .loadDele.tr)
                          : null;
                      await controller
                          .deleteCustomers(
                          context,
                              () {},
                          controller
                              .getAllCustomers.value.data?[index]
                              .id ??
                              0)
                          .then((value) {
                        controller.load.value =
                        true;
                        Get.back();
                      });
                    },
                    onCancelBtnTap: () =>
                        Get.back(),
                  );

              }
            },
            child: Container(
              width: 70,
              height: 52,
              padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
              alignment: Get.find<LanguageController>().isArabic ||
                  Get.find<LanguageController>().isUrdo ||
                  Get.find<LanguageController>().isHindi
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              child: Icon(Icons.delete, color: Colors.red,),
            ),
          ),

        ],
      );
}
