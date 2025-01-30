
import 'package:chameleon/app/modules/home/model/sales/Iinsert_items/InsertItems.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../generated/locales.g.dart';
import '../../../../../../../global/controllers/language_controller.dart';
import '../../../../../../../global/global_widget/custom_text_form_field.dart';
import '../../../../../login/controllers/login_controller.dart';
import '../../../../controllers/home_controller.dart';
import '../../../../model/sales/getAllProductUnit/Data.dart';
import '../../transport/dialog_loading.dart';
import 'build_ui_in_items.dart';
import 'items_table.dart';


class CustomSalesItems extends GetView<HomeController> {
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
                      LocaleKeys.items.tr,
                      style:
                      const TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 15),
                    ),
                    const Spacer(),

                    controller.editItemsSales.value == true ||
                        controller.addItemsSales.value == true
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

                                  InsertItems insertData = InsertItems(
                                    id: controller.addItemsSales.value == true ? 0 : controller.idItemsSales.value,
                                    code: controller.codeaItemsSales.text,
                                    groupId: controller.selectedItemGroups.value.id,
                                    nameA: controller.arNameItemsSales.text,
                                    nameE: controller.enNameItemsSales.text,
                                    itemType: controller.selectedStockProduc.value.id,
                                    active: controller.hasExpireDate.value,
                                    deactivate: controller.deactivate.value,
                                    width: int.tryParse(controller.widthItemsSales.text)?? 0,
                                    height: int.tryParse(controller.heightItemsSales.text)?? 0,
                                    depth: int.tryParse(controller.depthItemsSales.text)?? 0,
                                    notes: controller.notesItemsSales.text,
                                    warranty: int.tryParse(controller.shelfLifeItemsSales.text)?? 0
                                  );
                                  if (controller.editItemsSales.value ==
                                      true) {

                                    controller.load.value = false;
                                    (controller.load == false)
                                        ? showLoadingDialog(context,
                                        LocaleKeys.loadEdit.tr)
                                        : null;


                                    await controller.insertItems(context, () {
                                      login.loginPinCodeController
                                          .clear();
                                    }, insertData).then((value) {
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
                                    await controller.insertItems(context, () {
                                      login.loginPinCodeController
                                          .clear();
                                    }, insertData).then((value) {
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
                                      .addItemsSales.value ==
                                      true) {
                                    controller.clearItemsAddItems();
                                  }

                                  controller.addItemsSales.value =
                                  false;
                                  controller.editItemsSales.value =
                                  false;
                                  controller.salesItems.value =
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
                        :
                    InkWell(
                        onTap: () {
                          if (controller.editItemsSales.value == true) {
                          } else {
                            controller.clearItemsAddItems();

                            controller.addItemsSales.value = true;
                            controller.editItemsSales.value = false;
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

                controller.editItemsSales.value ==
                    true ||
                    controller.addItemsSales.value == true ?
                Container()
                    :
                SizedBox(
                  height: 10,
                ),
                controller.editItemsSales.value ==
                    true ||
                    controller.addItemsSales.value == true ?
                Container()

                    : Stack(
                  children: [
                    CustomTextFormField(
                      color: Colors.grey.shade100,
                      radius: 12,
                      onChanged: (v) async {
                        await controller.loadStockProduct(
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
                      // right: 0,
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
                                await controller.loadStockProduct(
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
                                await controller.loadStockProduct(
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
                controller.editItemsSales.value ==
                    true ||
                    controller.addItemsSales.value == true ?
                Container()
                    : SizedBox(
                  height: 10,
                ),
                controller.editItemsSales.value ==
                    true ||
                    controller.addItemsSales.value == true ?
                Container()
                    :
                StockProductTable(
                    selectedItems:
                    controller.getAllStockProduct.value.data ??
                        [])
                ,
              ],
            ),
          ),
          controller.editItemsSales.value ==
              true ||
              controller.addItemsSales.value == true ?
          BuildUiInItems()
              :Container(),

          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
