import 'package:chameleon/app/modules/home/views/widget/sales/items/unites_data_table.dart';
import 'package:chameleon/app/modules/home/views/widget/sales/items/unites_table.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../../generated/locales.g.dart';
import '../../../../../../../global/controllers/language_controller.dart';
import '../../../../../../../global/global_widget/custom_text_form_field.dart';
import '../../../../../login/controllers/login_controller.dart';
import '../../../../controllers/home_controller.dart';
import '../../../../model/sales/get_stock_product/Units.dart';
import '../items_groups/custom_list_text_field_with_search.dart';

class BuildUiInItems extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    final login = Get.put(LoginController());
    return Obx(() => Container(

      color: Colors.white,
      child: Column(
        children: [

          (controller.noData.value == true)
              ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              Center(
                child: Text(
                  LocaleKeys.noItemsRequest.tr,
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

                    controller: controller.codeaItemsSales,
                    type: TextInputType.text,
                    color: Colors.white,
                    radius: 2,
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
                    LocaleKeys.group.tr,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 14),
                    textAlign: TextAlign.start,
                  ),
                  GroupsListTextField(
                    suggetionCallBack: (pattern) async {
                      final suggestions = controller.allProductGroups.value
                          .getItemGroupsWithHasChildren(pattern);

                      return suggestions;
                    },
                    onSuggetionSelected: (p) async {
                      controller.selectedListField(p);

                    },
                    controller: controller.itemGroupListField,
                    hintText: LocaleKeys.itemGroups.tr,
                    executeClose: () {},
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  Text(
                    LocaleKeys.productType.tr,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 14),
                    textAlign: TextAlign.start,
                  ),
                  StockProductTypeField(
                    suggetionCallBack: (pattern) async {
                      final suggestions = Get
                          .find<LoginController>()
                          .user.getStockProductBySearchKey(pattern);

                      return suggestions;
                    },
                    onSuggetionSelected: (p) async {
                      controller.selectedProductType(p);

                    },
                    controller: controller.productTypeListField,
                    hintText: LocaleKeys.productType.tr,
                    executeClose: () {},
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

                    controller: controller.enNameItemsSales,
                    type: TextInputType.name,
                    color: Colors.white,
                    radius: 2,
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
                    controller: controller.arNameItemsSales,
                    type: TextInputType.name,
                    color: Colors.white,
                    radius: 2,
                    onChanged: (v) {},
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    LocaleKeys.attribute.tr,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 14),
                    textAlign: TextAlign.start,
                  ),
                  CustomTextFormField(
                    readOnly: true,
                    textAlign:
                    Get.find<LanguageController>().isArabic ||
                        Get.find<LanguageController>().isUrdo ||
                        Get.find<LanguageController>().isHindi
                        ? TextAlign.right
                        : TextAlign.left,
                    controller: TextEditingController(),
                    type: TextInputType.name,
                    color: Colors.white,
                    radius: 2,
                    onChanged: (v) {},
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    LocaleKeys.brand.tr,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 14),
                    textAlign: TextAlign.start,
                  ),
                  CustomTextFormField(
                    readOnly: true,
                    textAlign:
                    Get.find<LanguageController>().isArabic ||
                        Get.find<LanguageController>().isUrdo ||
                        Get.find<LanguageController>().isHindi
                        ? TextAlign.right
                        : TextAlign.left,
                    controller: TextEditingController(),
                    type: TextInputType.name,
                    color: Colors.white,
                    radius: 2,
                    onChanged: (v) {},
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    LocaleKeys.packingList.tr,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 14),
                    textAlign: TextAlign.start,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: CustomTextFormField(

                          textAlign:
                          Get.find<LanguageController>().isArabic ||
                              Get.find<LanguageController>().isUrdo ||
                              Get.find<LanguageController>().isHindi
                              ? TextAlign.right
                              : TextAlign.left,
                          controller: controller.widthItemsSales,
                          type: TextInputType.number,
                          color: Colors.white,
                          hint: LocaleKeys.width.tr,
                          radius: 2,
                          onChanged: (v) {},
                        ),
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Expanded(
                        child: CustomTextFormField(
                          hint: LocaleKeys.height.tr,
                          textAlign:
                          Get.find<LanguageController>().isArabic ||
                              Get.find<LanguageController>().isUrdo ||
                              Get.find<LanguageController>().isHindi
                              ? TextAlign.right
                              : TextAlign.left,
                          controller: controller.heightItemsSales,
                          type: TextInputType.number,
                          color: Colors.white,
                          radius: 2,
                          onChanged: (v) {},
                        ),
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Expanded(
                        child: CustomTextFormField(
                          hint: LocaleKeys.depth.tr,
                          textAlign:
                          Get.find<LanguageController>().isArabic ||
                              Get.find<LanguageController>().isUrdo ||
                              Get.find<LanguageController>().isHindi
                              ? TextAlign.right
                              : TextAlign.left,
                          controller: controller.depthItemsSales,
                          type: TextInputType.number,
                          color: Colors.white,
                          radius: 2,
                          onChanged: (v) {},
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    LocaleKeys.shelfLife.tr,
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
                    controller: controller.shelfLifeItemsSales,
                    type: TextInputType.number,
                    color: Colors.white,
                    radius: 2,
                    onChanged: (v) {},
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: controller.hasExpireDate.value,
                        onChanged: controller.changeHasExpireDate,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(LocaleKeys.hasExpiryDate.tr, style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),),
                    ],
                  ),

                  Row(
                    children: [
                      Checkbox(
                        value: controller.deactivate.value,
                        // activeColor: controller.hasChildrenTree.value == true ? CupertinoColors.activeBlue : Colors.grey,
                        onChanged: controller.changeDeactivate,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(LocaleKeys.deactivate.tr, style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),),
                    ],
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

                    textAlign:
                    Get.find<LanguageController>().isArabic ||
                        Get.find<LanguageController>().isUrdo ||
                        Get.find<LanguageController>().isHindi
                        ? TextAlign.right
                        : TextAlign.left,
                    controller: controller.notesItemsSales,
                    type: TextInputType.name,
                    color: Colors.white,
                    radius: 2,
                    onChanged: (v) {},
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        LocaleKeys.productUnits.tr,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                        textAlign: TextAlign.start,
                      ),
                      Spacer(),
                      InkWell(
                        onTap: (){
                          controller.editUnitesItemsSales.value = false ;
                          UnitsStockProduct unites = UnitsStockProduct(
                            barCode: '',
                            isBaseUnit: false,
                            isDefault: false,
                            rate: 1,
                            unitNameWithCode: '',
                            unitId: 0
                          );
                          controller.addUnites(unites) ;

                        },
                        child: Image.asset(
                          'assets/images/add.png',
                          width: 30,
                          height: 30,
                          fit: BoxFit.fill,
                        ),
                      )
                    ],
                  ),

                  const SizedBox(
                    height: 10,
                  ),


                  SalesBillItemsTable(
                    selectedItems: controller.selectedUnitesStockProduct,
                    isAdded: true,
                    isEdit: false,
                  ),
                  controller.selectedUnitesStockProduct.length != 0 ?
                  const SizedBox(
                    height: 30,
                  )
                  : Container()
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
