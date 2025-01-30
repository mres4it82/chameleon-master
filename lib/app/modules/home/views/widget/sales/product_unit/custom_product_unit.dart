import 'dart:developer';

import 'package:chameleon/app/modules/home/views/widget/sales/product_unit/product_unit_table.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../generated/locales.g.dart';
import '../../../../../../../global/controllers/language_controller.dart';
import '../../../../../../../global/global_widget/custom_expansion_tile.dart';
import '../../../../../../../global/global_widget/custom_text_form_field.dart';
import '../../../../../login/controllers/login_controller.dart';
import '../../../../controllers/home_controller.dart';
import '../items_groups/custom_list_text_field_with_search.dart';
import 'build_ui_in_product_unit.dart';

class CustomProductUnit extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    final login = Get.put(LoginController());
    return Obx(
      () => Column(
        children: [
          SizedBox(
            height: 20,
          ),

          Container(
            padding: EdgeInsets.only(right: 12,left: 12,top: 12),
            color: Colors.white,
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Row(
                  children: [
                    Text(
                      LocaleKeys.productUnit.tr,
                      style:
                      const TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 15),
                    ),
                    const Spacer(),

                    InkWell(
                        onTap: () {
                          if (controller.editProductUnitSales.value == true) {
                          } else {

                              controller.clearItemsProductUnit();

                            controller.addProductUnitSales.value = true;
                            controller.editProductUnitSales.value = false;
                          }
                        },
                        child: Image.asset(
                          'assets/images/add.png',
                          width: 30,
                          height: 30,
                          fit: BoxFit.fill,
                        )),
                  ],
                ),

                controller.editProductUnitSales.value ==
                    true ||
                    controller.addProductUnitSales.value == true ?
                    Container()
                :
                SizedBox(
                  height: 10,
                ),
                controller.editProductUnitSales.value ==
                    true ||
                    controller.addProductUnitSales.value == true ?
                Container()

                    : Stack(
                  children: [
                    CustomTextFormField(
                      color: Colors.grey.shade100,
                      radius: 12,
                      onChanged: (v) async {
                        await controller.loadProductUnit(
                            context, () {
                          login.loginPinCodeController
                              .clear();
                        }, 2, controller.search.text);
                      },
                      labelText: LocaleKeys.search.tr,
                      controller: controller.search,
                      textAlign: Get.find<LanguageController>().isArabic ||
                          Get.find<LanguageController>().isUrdo ||
                          Get.find<LanguageController>().isHindi ? TextAlign.right :TextAlign.left,
                    ),
                    Get.find<LanguageController>().isArabic ||
                        Get.find<LanguageController>().isUrdo ||
                        Get.find<LanguageController>().isHindi ?
                    Positioned(
                      bottom: 2,
                      left: 10,
                      child:  Row(
                        children: [
                          Icon(CupertinoIcons.search_circle_fill,color: Colors.grey,size: 30,),
                          const SizedBox(
                            width: 10,
                          ),
                          InkWell(
                              onTap: () async {
                                controller.search.clear();
                                await controller.loadProductUnit(
                                    context, () {
                                  login.loginPinCodeController
                                      .clear();
                                }, 2, '');
                              },
                              child: Icon(CupertinoIcons.clear_circled_solid,color: Colors.grey,size: 30,))
                        ],
                      ),
                    )
                        :Positioned(
                      bottom: 2,
                      right: 10,
                      child:  Row(
                        children: [
                          Icon(CupertinoIcons.search_circle_fill,color: Colors.grey,size: 30,),
                          const SizedBox(
                            width: 10,
                          ),
                          InkWell(
                              onTap: () async {
                                controller.search.clear();
                                await controller.loadProductUnit(
                                    context, () {
                                  login.loginPinCodeController
                                      .clear();
                                }, 2, '');
                              },
                              child: Icon(CupertinoIcons.clear_circled_solid,color: Colors.grey,size: 30,))
                        ],
                      ),
                    )
                  ],
                ),
                controller.editProductUnitSales.value ==
                    true ||
                    controller.addProductUnitSales.value == true ?
                Container()
                    : SizedBox(
                  height: 10,
                ),
                controller.editProductUnitSales.value ==
                    true ||
                    controller.addProductUnitSales.value == true ?
                Container()
                    :
                ProductUnitTable(
                    selectedItems:
                    controller.getAllProductUnit.value.data ??
                        [])
                ,
              ],
            ),
          ),
          controller.editProductUnitSales.value ==
              true ||
              controller.addProductUnitSales.value == true ?
          BuildUiInProductUnit()
              :Container(),

          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
