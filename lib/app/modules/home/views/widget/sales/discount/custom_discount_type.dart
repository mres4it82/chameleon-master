import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../generated/locales.g.dart';
import '../../../../../../../global/controllers/language_controller.dart';
import '../../../../../../../global/global_widget/custom_expansion_tile.dart';
import '../../../../../../../global/global_widget/custom_text_form_field.dart';
import '../../../../../login/controllers/login_controller.dart';
import '../../../../controllers/home_controller.dart';
import '../../../../model/model_class.dart';
import '../items_groups/custom_list_text_field_with_search.dart';
import 'build_ui_in_discount_type.dart';
import 'discount_table.dart';

class CustomSalesDiscount extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {

    final login = Get.put(LoginController());
    return Obx(
      () => Column(
        children: [
          const SizedBox(
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
                      LocaleKeys.discountTypes.tr,
                      style:
                      const TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 15),
                    ),
                    const Spacer(),

                    InkWell(
                        onTap: () {
                          if (controller.editDiscountSales.value == true) {
                          } else {

                              controller.clearItemsDiscountType();

                            controller.addDiscountSales.value = true;
                            controller.editDiscountSales.value = false;
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

                controller.editDiscountSales.value ==
                    true ||
                    controller.addDiscountSales.value == true ?
                Container()

                    :SizedBox(
                  height: 10,
                ),
                controller.editDiscountSales.value ==
                    true ||
                    controller.addDiscountSales.value == true ?
                Container()

                    : Stack(
                  children: [
                    CustomTextFormField(
                      color: Colors.grey.shade100,
                      radius: 12,
                      onChanged: (v) async {
                        await controller.loadDiscountType(
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
                                await controller.loadDiscountType(
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
                                await controller.loadDiscountType(
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
                controller.editDiscountSales.value ==
                    true ||
                    controller.addDiscountSales.value == true ?
                Container()

                    : SizedBox(
                  height: 10,
                ),
                controller.editDiscountSales.value ==
                    true ||
                    controller.addDiscountSales.value == true ?
                Container()
                    :
                DiscountTable(
                    selectedItems:
                    controller.getAllDiscountType.value.data ??
                        [])
                ,
              ],
            ),
          ),
          controller.editDiscountSales.value ==
              true ||
              controller.addDiscountSales.value == true ?
          BuildUiInDiscountType()
              :Container(),


          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
