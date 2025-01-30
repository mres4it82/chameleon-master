import 'dart:developer';

import 'package:chameleon/app/modules/home/model/sales/getAllProductUnit/Data.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import '../../../../../../../../generated/locales.g.dart';
import '../../../../../../../../global/controllers/language_controller.dart';
import '../../../../../../../global/global_widget/custom_text_form_field.dart';
import '../../../../controllers/home_controller.dart';
import '../../../../model/sales/get_stock_product/Units.dart';
import '../items_groups/custom_list_text_field_with_search.dart';


class SalesBillItemsTable extends GetView {
  final List<UnitsStockProduct> selectedItems;

  bool? isAdded = false;
  bool? isEdit = false;

  //bool? isEdit = false;

  SalesBillItemsTable(
      {required this.selectedItems,
        this.isAdded,
        this.isEdit,
        });

  Widget buildCellText(String text) {
    return SizedBox(width: 60, child: Center(child: Text(text)));
  }

  DataCell buildPrivilegesDataCell(
      int i,
      TextEditingController textEditingController,
      bool privileges,
      controller) {
    return DataCell(
      privileges
          ? TextField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
        ),
        onChanged: (count) {
          controller.update();
        },
        // onChangedTextField: (count) => controller.update(),
        controller: textEditingController,
      )
          : buildCellText(textEditingController.text),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      // Salesmen? sal = controller.allSalesBillData.value.getSalesMenById(invoiceItems[i].salesManId);
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: (isAdded == true && isEdit == false)
            ? DataTable(
          dataRowHeight: 80,
          columnSpacing: 40.0,
          columns: [
            DataColumn(
              label: Text(
                LocaleKeys.m.tr,
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
            DataColumn(
              label: Text(
                LocaleKeys.unit.tr,
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
            DataColumn(
              label: Text(
                LocaleKeys.mainUnites.tr,
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
            DataColumn(
              label: Text(
                LocaleKeys.rate.tr,
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
            DataColumn(
              label: Text(
                LocaleKeys.barcode.tr,
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
            DataColumn(
              label: Text(
                LocaleKeys.defaultUnites.tr,
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),

            DataColumn(
              label: Text(
                LocaleKeys.delete.tr,
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),

          ],
          dataRowColor:
          MaterialStateProperty.all(const Color(0xffF2F2F2)),
          headingTextStyle:
          GoogleFonts.cairo(fontWeight: FontWeight.bold),
          headingRowColor: MaterialStateProperty.all(Color.fromRGBO(58, 116, 170, 1)),
          rows:[
            for (int i = 0; i < selectedItems.length; i++)

              DataRow(cells: [
                // Display the ID (not editable)
                DataCell(Text('${i + 1}')),

                // Editable Barcode Cell
                DataCell(
                  SizedBox(
                    width: 120,
                    child: ProductUnitListTextField(
                      suggetionCallBack: (pattern) async {
                        final suggestions = controller.getAllProductUnit.value
                            .getAllProductUnit(pattern);

                        return suggestions;
                      },
                      onSuggetionSelected: (p) async {
                        controller.selectedUnitesStockProduct[i].unitId = p.id?.toInt() ;
                        controller.selectedUnitesStockProduct[i].unitNameWithCode = p.unitNameWithCode ?? '' ;
                        controller.selectedUnitesStockProduct[i].unitcontroller?.text = p.unitNameWithCode ?? '' ;

                      },
                      controller: controller.selectedUnitesStockProduct[i].unitcontroller,
                      hintText: LocaleKeys.productUnit.tr,
                      executeClose: () {},
                    ),
                  ),

                ),

                // Checkbox for Is Base Unit
                DataCell(
                   Checkbox(
                      value: selectedItems[i].isBaseUnit,
                      onChanged: (value) {
                        controller.updateBaseUnit(i, value ?? false) ;
                      },
                  ),
                ),

                // Checkbox for Is Default Unit
                DataCell(
                  SizedBox(
                    width: 70,
                    child: CustomTextFormField(

                      textAlign:
                      Get.find<LanguageController>().isArabic ||
                          Get.find<LanguageController>().isUrdo ||
                          Get.find<LanguageController>().isHindi
                          ? TextAlign.right
                          : TextAlign.left,
                      controller: TextEditingController(text: '${selectedItems[i].rate}'),
                      type: TextInputType.number,
                      color: Colors.white,
                      radius: 2,
                      onChanged: (value) {
                        controller.selectedUnitesStockProduct[i].rate = int.tryParse(value)?? 0 ;
                      },
                    ),
                  ),
                ),

                // Editable Rate Cell
                DataCell(
                  SizedBox(
                    width: 100,
                    child: CustomTextFormField(

                      textAlign:
                      Get.find<LanguageController>().isArabic ||
                          Get.find<LanguageController>().isUrdo ||
                          Get.find<LanguageController>().isHindi
                          ? TextAlign.right
                          : TextAlign.left,
                      controller: TextEditingController(text: '${selectedItems[i].barCode}'),
                      type: TextInputType.name,
                      color: Colors.white,
                      radius: 2,
                      onChanged: (value) {
                        controller.selectedUnitesStockProduct[i].barCode = value ;
                      },
                    ),
                  ),
                ),

                // Dropdown for Unit Name
                DataCell(
                  Checkbox(
                    value: selectedItems[i].isDefault,
                    onChanged: (value) {
                      controller.updateDefaultUnit(i, value ?? false) ;
                    },
                  ),
                ),


                // Action Buttons (Delete Row)
                DataCell(
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {

                      controller.removeUnit(i);

                    },
                  ),
                ),
              ]),
          ],



        )
            : null,
      );
    });
  }
}
