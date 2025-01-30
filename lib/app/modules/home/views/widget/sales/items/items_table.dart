import 'dart:developer';

import 'package:chameleon/app/modules/home/model/sales/getItemGroup/Data.dart';
import 'package:chameleon/app/modules/login/models/StockProductType.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import '../../../../../../../../generated/locales.g.dart';
import '../../../../../../../../global/controllers/language_controller.dart';
import '../../../../controllers/home_controller.dart';
import '../../../../model/sales/get_stock_product/Data.dart';
import '../../transport/dialog_loading.dart';


class StockProductTable extends GetView {

  final List<StockProductList> selectedItems;

  StockProductTable({required this.selectedItems});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return
        kIsWeb
            ?
        SizedBox(
          height: selectedItems.length == 1
              ? 110
              : selectedItems.length == 2
              ? 170
              : selectedItems.length == 3
              ? 220
              : selectedItems.length == 4
              ? 260
              : selectedItems.length == 5
              ? 290
              : selectedItems.length == 6
              ? 350
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
            rightHandSideColumnWidth: 480,
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

        )
            :
        SizedBox(
          height: selectedItems.length == 1
              ? 110
              : selectedItems.length == 2
              ? 170
              : selectedItems.length == 3
              ? 220
              : selectedItems.length == 4
              ? 260
              : selectedItems.length == 5
              ? 290
              : selectedItems.length == 6
              ? 350
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
            rightHandSideColumnWidth: 480,
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
    _getTitleItemWidget(LocaleKeys.group.tr, 130),
    _getTitleItemWidget(LocaleKeys.productType.tr, 110),
    _getTitleItemWidget(Get.find<LanguageController>().isArabic ?LocaleKeys.arName.tr: LocaleKeys.enName.tr, 100),
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
        width: 100,
        height: 52,
        padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
        alignment: Alignment.center,
        child: controller.getAllStockProduct.value.data?[index].code == null ?
        Text('')
            :Text(
          '${controller.getAllStockProduct.value.data?[index].code}',
        ),)

  );
}

Widget _generateRightHandSideColumnRow(BuildContext context, int index) {
  var controller = Get.put(HomeController());
  return  Obx(
    //  100
        ()=> Row(
      children: <Widget>[
        Container(
          width: 130, // 70
          height: 52,
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Get.find<LanguageController>().isArabic ||
              Get.find<LanguageController>().isUrdo ||
              Get.find<LanguageController>().isHindi
              ? Alignment.centerRight
              : Alignment.centerLeft,
          child: controller.getAllStockProduct.value.data?[index].groupNameWithCode == null ?
          Text('')
              :Text(
            '${controller.getAllStockProduct.value.data?[index].groupNameWithCode}',
          ),
        ),
        Container(
          width: 110, // 130
          height: 52,
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Get.find<LanguageController>().isArabic ||
              Get.find<LanguageController>().isUrdo ||
              Get.find<LanguageController>().isHindi
              ? Alignment.centerRight
              : Alignment.centerLeft,
          child: controller.getAllStockProduct.value.data?[index].typeName == null ?
          Text('')
              :Text(
            '${controller.getAllStockProduct.value.data?[index].typeName}',
          ),
        ),

        Container(
          width: 100,  // 100
          height: 52,
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Get.find<LanguageController>().isArabic ||
              Get.find<LanguageController>().isUrdo ||
              Get.find<LanguageController>().isHindi
              ? Alignment.centerRight
              : Alignment.centerLeft,
          child:Get.find<LanguageController>().isArabic ?

          (controller.getAllStockProduct.value.data?[index].nameA) == null ?
          Text('')
              :Text(
            '${controller.getAllStockProduct.value.data?[index].nameA}',
          )
          :
          (controller.getAllStockProduct.value.data?[index].nameE) == null ?
          Text('')
              :Text(
            '${controller.getAllStockProduct.value.data?[index].nameE}',
          )
          ,
        ),
        InkWell(
            onTap: () {

              controller.idItemsSales.value = controller.getAllStockProduct.value.data?[index].id?.toInt() ?? 0;
              controller.codeaItemsSales.text = controller.getAllStockProduct.value.data?[index].code ??'';
              controller.selectedItemGroups.value = DataProductGroups(
                id: controller.getAllStockProduct.value.data?[index].groupId?.toInt() ??0,
                groupNameWithCode: controller.getAllStockProduct.value.data?[index].groupNameWithCode ??'',
              );
              controller.itemGroupListField.text = controller.getAllStockProduct.value.data?[index].groupNameWithCode ??'';
              controller.selectedStockProduc.value = StockProductType(

                nameA: controller.getAllStockProduct.value.data?[index].typeName ??'' ,
                nameE: controller.getAllStockProduct.value.data?[index].typeName??'',
                name: controller.getAllStockProduct.value.data?[index].typeName??'',
                id: controller.getAllStockProduct.value.data?[index].itemType??0
              );

              controller.productTypeListField.text = controller.getAllStockProduct.value.data?[index].typeName ??'';
              controller.enNameItemsSales.text = controller.getAllStockProduct.value.data?[index].nameE ??'';
              controller.arNameItemsSales.text = controller.getAllStockProduct.value.data?[index].nameA ??'';
              controller.hasExpireDate.value = controller.getAllStockProduct.value.data?[index].active ?? false ;
              controller.deactivate.value = controller.getAllStockProduct.value.data?[index].deactivate ?? false ;
              if(controller.getAllStockProduct.value.data?[index].width == null ){
                controller.widthItemsSales.text = 0.toString() ;
              }
              else {

                controller.widthItemsSales.text = controller.getAllStockProduct.value.data?[index].width.toString() ??'';

              }
              if(controller.getAllStockProduct.value.data?[index].height == null ){
                controller.heightItemsSales.text = 0.toString() ;
              }
              else {
                controller.heightItemsSales.text = controller.getAllStockProduct.value.data?[index].height.toString() ??'';

              }
              if(controller.getAllStockProduct.value.data?[index].depth == null ){
                controller.depthItemsSales.text = 0.toString() ;
              }
              else {
                controller.depthItemsSales.text = controller.getAllStockProduct.value.data?[index].depth.toString() ??'';

              }
              if(controller.getAllStockProduct.value.data?[index].warranty == null ){
                controller.shelfLifeItemsSales.text = 0.toString() ;
              }
              else {
                controller.shelfLifeItemsSales.text = controller.getAllStockProduct.value.data?[index].warranty.toString() ??'';

              }

              controller.notesItemsSales.text = controller.getAllStockProduct.value.data?[index].notes ??'';

              controller.selectedUnitesStockProduct = controller.getAllStockProduct.value.data?[index].units ??[];
              controller.selectedUnitesStockProduct[0].unitcontroller =
                  TextEditingController(text:controller.getAllStockProduct.value.data?[index].units?[0] .unitNameWithCode) ;
              controller.editItemsSales.value = true ;

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
            if (controller.addItemsSales
                .value ==
                false &&
                controller.editItemsSales
                    .value ==
                    false) {

               await QuickAlert.show(
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
                        .deleteStockProduct(context, () {},
                        controller.getAllStockProduct.value.data?[index].id?.toInt()??0)
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
    ),
  );
}
