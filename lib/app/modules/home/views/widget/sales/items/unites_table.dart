import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import '../../../../../../../../generated/locales.g.dart';
import '../../../../../../../../global/controllers/language_controller.dart';
import '../../../../controllers/home_controller.dart';
import '../../../../model/sales/get_stock_product/Units.dart';


class UnitesStockProductTable extends GetView {

  final List<UnitsStockProduct> selectedItems;

  UnitesStockProductTable({required this.selectedItems});

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
              : selectedItems.length == 0 ? 110 : 500,
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
            leftHandSideColumnWidth: 80,
            rightHandSideColumnWidth: 570,
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
    _getTitleFirstColumnWidget(LocaleKeys.m.tr, 80),
    _getTitleItemWidget(LocaleKeys.unit.tr, 100),
    _getTitleItemWidget(LocaleKeys.mainUnites.tr, 90),
    _getTitleItemWidget( LocaleKeys.rate.tr, 70),
    _getTitleItemWidget(LocaleKeys.barcode.tr, 70),
    _getTitleItemWidget(LocaleKeys.defaultUnites.tr, 100),
    _getTitleItemWidget(LocaleKeys.edit.tr, 70),
    _getTitleItemWidget(LocaleKeys.delete.tr, 70),

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

  return Container(
        width: 80,
        height: 52,
        padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
        alignment: Alignment.center,
        child: Text(
          '${index +1}',
        ),);
}

Widget _generateRightHandSideColumnRow(BuildContext context, int index) {
  var controller = Get.put(HomeController());
  return  Obx(
    //  100
        ()=> Row(
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
          child: Text(
            '${controller.selectedUnitesStockProduct[index].unitName}',
          ),
        ),
        Container(
          width: 90, // 130
          height: 52,
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Get.find<LanguageController>().isArabic ||
              Get.find<LanguageController>().isUrdo ||
              Get.find<LanguageController>().isHindi
              ? Alignment.centerRight
              : Alignment.centerLeft,
          child: Checkbox(
            value: controller.mainUnit.value,
            onChanged: controller.changeMainUnit,
          ),
          // Text(
          //   '${controller.selectedUnitesStockProduct[index].isBaseUnit}',
          // ),
        ),

        Container(
          width: 70,  // 100
          height: 52,
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Get.find<LanguageController>().isArabic ||
              Get.find<LanguageController>().isUrdo ||
              Get.find<LanguageController>().isHindi
              ? Alignment.centerRight
              : Alignment.centerLeft,
          child: Text(
            '${controller.selectedUnitesStockProduct[index].rate}',
          )
          ,
        ),
        ////////
        Container(
          width: 70,  // 100
          height: 52,
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Get.find<LanguageController>().isArabic ||
              Get.find<LanguageController>().isUrdo ||
              Get.find<LanguageController>().isHindi
              ? Alignment.centerRight
              : Alignment.centerLeft,
          child: Text(
            '${controller.selectedUnitesStockProduct[index].barCode}',
          )
          ,
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
          child: Text(
            '${controller.selectedUnitesStockProduct[index].isDefault}',
          )
          ,
        ),
        InkWell(
            onTap: () {

              controller.editUnitesItemsSales.value = true;

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
          onTap: (){
            controller.removeUnit(index);
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
