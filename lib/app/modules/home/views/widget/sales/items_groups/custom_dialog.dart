import 'dart:developer';

import 'package:chameleon/app/modules/home/controllers/home_controller.dart';
import 'package:chameleon/app/modules/home/model/sales/getRetailGroups/Data.dart';
import 'package:chameleon/app/modules/home/model/sales/tax/Data.dart';
import 'package:chameleon/global/global_widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

import '../../../../../../../generated/locales.g.dart';
import '../../../../../../../global/controllers/language_controller.dart';
import '../../../../model/sales/getItemGroup/Data.dart';
import '../../transport/dialog_loading.dart';
import 'custom_list_text_field_with_search.dart';

void CustomDialog(BuildContext context) {
  var controller = Get.put(HomeController());

  Get.dialog(
    barrierDismissible: false,
    Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: SizedBox(
        width: 350,
         height: 700,
        child: Obx(
            ()=> Column(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 5),
                  child: Obx(
                    ()=> SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          const SizedBox(
                            height: 20,
                          ),
                          controller.addStateinProductGroupsTree.value == true ?

                          Text(LocaleKeys.mainGroup.tr, style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),)
                              : Text(
                            LocaleKeys.group.tr, style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),),
                          SizedBox(
                            height: 4,
                          ),
                          (controller.addStateinProductGroupsTree.value == true
                              ||
                              controller.editStateinProductGroupsTree.value ==
                                  true) ?

                          GroupsListTextField(

                            suggetionCallBack: (pattern) async {
                              final suggestions = controller
                                  .allProductGroups.value
                                  .getItemGroupsWithHasChildren(
                                  pattern);
                                    return suggestions;
                                  },
                                  onSuggetionSelected: (p) async {
                                    controller.selectedListField(p);
                                    if (p.parentId != null) {
                                      controller.FetchMainGroupName(
                                          controller.allProductGroups.value
                                                  .data ??
                                              [],
                                          p.parentId);
                                    }
                                  },
                                  controller: controller.itemGroupListField,
                                  hintText:
                                      LocaleKeys.leaveEmptyToCreateLeavel1.tr,
                                  executeClose: () {},
                                )
                              :

                          Container(
                            width: double.infinity,
                            margin: const EdgeInsets.only(top: 4),
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                border: Border.all(
                                    color: Colors.black12
                                ),
                                borderRadius: BorderRadius.circular(12)
                            ),
                            child: Text(controller.itemGroupListField.text,
                              style: const TextStyle(
                                  fontSize: 14
                              ),),

                          ),
                          const SizedBox(
                            height: 10,
                          ),

                          (controller.addStateinProductGroupsTree.value == true
                              ||
                              controller.editStateinProductGroupsTree.value ==
                                  true) ?
                          Container()
                              :
                          controller.selectedItemGroups.value.levels != 1 ?

                          controller.mainGroupName.value.parentName == '' ?
                          Container() :
                          Text(LocaleKeys.mainGroup.tr, style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),)
                              : Container(),
                          (controller.addStateinProductGroupsTree.value == true
                              || controller.editStateinProductGroupsTree.value == true) ?
                          Container()
                              :
                          controller.selectedItemGroups.value.levels != 1 ?
                          controller.mainGroupName.value.parentName == '' ?
                          Container()
                              :
                          Container(
                            width: double.infinity,
                            margin: const EdgeInsets.only(top: 4),
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                border: Border.all(
                                    color: Colors.black12
                                ),
                                borderRadius: BorderRadius.circular(12)
                            ),
                            child: Obx(
                                  () =>
                                  Text('${controller.mainGroupName.value
                                      .parentName}', style: const TextStyle(
                                      fontSize: 14
                                  ),),
                            ),
                          )
                          :Container(),

                          (controller.addStateinProductGroupsTree.value == true
                              || controller.editStateinProductGroupsTree.value == true) ?
                          Container()
                              :
                          controller.selectedItemGroups.value.levels != 1 ?
                          const SizedBox(
                            height: 10,
                          ):Container(),

                          Text(LocaleKeys.code.tr, style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),),
                          (controller.addStateinProductGroupsTree.value == true
                              || controller.editStateinProductGroupsTree.value == true) ?
                          SizedBox(
                            height: 38,
                            child: CustomTextFormField(
                              color: Colors.grey.shade100,
                              radius: 12,
                              controller: controller.codeProductGroups,
                              textAlign: Get.find<LanguageController>().isArabic ||
                                  Get.find<LanguageController>().isUrdo ||
                                  Get.find<LanguageController>().isHindi ? TextAlign.right :TextAlign.left,
                            ),
                          )
                              :
                          Container(
                            width: double.infinity,
                            margin: const EdgeInsets.only(top: 4),
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                border: Border.all(
                                    color: Colors.black12
                                ),
                                borderRadius: BorderRadius.circular(12)
                            ),
                            child: Obx(
                                  ()=> Text('${controller.selectedItemGroups.value.code}', style: const TextStyle(
                                  fontSize: 14
                              ),),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(LocaleKeys.arName.tr, style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),),
                          (controller.addStateinProductGroupsTree.value == true
                              || controller.editStateinProductGroupsTree.value == true) ?
                          SizedBox(
                            height: 38,
                            child: CustomTextFormField(
                              color: Colors.grey.shade100,
                              radius: 12,
                              controller: controller.nameArProductGroups,
                              textAlign: Get.find<LanguageController>().isArabic ||
                                  Get.find<LanguageController>().isUrdo ||
                                  Get.find<LanguageController>().isHindi ? TextAlign.right :TextAlign.left,
                            ),
                          )
                              :
                          Container(
                            width: double.infinity,
                            margin: const EdgeInsets.only(top: 4),
                            padding: const EdgeInsets.all(8),

                            decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                border: Border.all(
                                    color: Colors.black12
                                ),
                                borderRadius: BorderRadius.circular(12)
                            ),
                            child: Obx(
                                  ()=> Text('${controller.selectedItemGroups.value.nameA}', style: const TextStyle(
                                  fontSize: 14
                              ),),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(LocaleKeys.enName.tr, style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),),
                          (controller.addStateinProductGroupsTree.value == true
                              || controller.editStateinProductGroupsTree.value == true) ?
                          SizedBox(
                            height: 38,
                            child: CustomTextFormField(
                              color: Colors.grey.shade100,
                              radius: 12,
                              controller: controller.nameEnProductGroups,
                              textAlign: Get.find<LanguageController>().isArabic ||
                                  Get.find<LanguageController>().isUrdo ||
                                  Get.find<LanguageController>().isHindi ? TextAlign.right :TextAlign.left,
                            ),
                          )
                              :
                          Container(
                            width: double.infinity,
                            margin: const EdgeInsets.only(top: 4),
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                border: Border.all(
                                    color: Colors.black12
                                ),
                                borderRadius: BorderRadius.circular(12)
                            ),
                            child: Obx(
                                  ()=> Text('${controller.selectedItemGroups.value.nameE}', style: const TextStyle(
                                  fontSize: 14
                              ),),
                            ),
                          ),

                          const SizedBox(
                            height: 10,
                          ),

                          (controller.addStateinProductGroupsTree.value == true
                              || controller.editStateinProductGroupsTree.value == true) ?
                          Container()
                              :Text(LocaleKeys.levels.tr, style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),),
                          (controller.addStateinProductGroupsTree.value == true
                              || controller.editStateinProductGroupsTree.value == true) ?
                          Container()
                              :Container(
                            width: double.infinity,
                            margin: const EdgeInsets.only(top: 4),
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                border: Border.all(
                                    color: Colors.black12
                                ),
                                borderRadius: BorderRadius.circular(12)
                            ),
                            child: Obx(
                                  () => Text(
                                      '${controller.selectedItemGroups.value.levels}',
                                      style: const TextStyle(fontSize: 14),
                                    ),
                                  ),
                                ),
                          const SizedBox(
                            height: 10,
                          ),
                          controller.salesCustomerGroups.value == true
                              ? Text(
                                  LocaleKeys.mainAccounts.tr,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              : Text(
                                  LocaleKeys.supplier.tr,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                          (controller.addStateinProductGroupsTree.value ==
                                      true ||
                                  controller
                                          .editStateinProductGroupsTree.value ==
                                      true)
                              ? const SizedBox(
                                  height: 4,
                                )
                              : Container(),
                          (controller.addStateinProductGroupsTree.value ==
                                      true ||
                                  controller
                                          .editStateinProductGroupsTree.value ==
                                      true)
                              ? controller.salesCustomerGroups.value == true
                                  ? Container(
                                      width: double.infinity,
                                      margin: const EdgeInsets.only(top: 4),
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          color: Colors.grey.shade100,
                                          border:
                                              Border.all(color: Colors.black12),
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      child: const Text(''),
                                    )
                                  : SuppliersListTextField(
                                      suggetionCallBack: (pattern) async {
                                        final suggestions = controller
                                            .allRetailSuppliers.value
                                            .getRetailSuppliersWithSearchKey(
                                                pattern);
                                        return suggestions;
                                      },
                                      onSuggetionSelected: (p) async {
                                        controller.selectedSupplierListField(p);
                                      },
                                      controller:
                                          controller.supplierProductGroups,
                                      execute: () {},
                                    )
                              : controller.salesCustomerGroups.value == true
                                  ? Container(
                                      width: double.infinity,
                                      margin: const EdgeInsets.only(top: 4),
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          color: Colors.grey.shade100,
                                          border:
                                              Border.all(color: Colors.black12),
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      child: Obx(
                                        () => controller
                                                        .selectedItemGroups
                                                        .value
                                                        .mainAccountName ==
                                                    '' ||
                                                controller
                                                        .selectedItemGroups
                                                        .value
                                                        .mainAccountName ==
                                                    null
                                            ? Text('')
                                            : Text(
                                                '${controller.selectedItemGroups.value.mainAccountName}',
                                                style: const TextStyle(
                                                    fontSize: 14),
                                              ),
                                      ),
                                    )
                                  : Container(
                                      width: double.infinity,
                                      margin: const EdgeInsets.only(top: 4),
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          color: Colors.grey.shade100,
                                          border:
                                              Border.all(color: Colors.black12),
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      child: Obx(
                                        () => controller.selectedItemGroups.value
                                  .supplierName == '' ||
                                  controller.selectedItemGroups.value
                                      .supplierName == null ?
                              Text('')
                                  : Text('${controller.selectedItemGroups.value.supplierName}',
                                                style: const TextStyle(
                                                    fontSize: 14),
                                              ),
                                      ),
                                    ),
                          const SizedBox(
                            height: 10,
                          ),
                          controller.salesCustomerGroups.value == true
                              ? Text(
                                  LocaleKeys.customerAccount.tr,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              : Text(
                                  LocaleKeys.taxName.tr,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                          (controller.addStateinProductGroupsTree.value ==
                                      true ||
                                  controller
                                          .editStateinProductGroupsTree.value ==
                                      true)
                              ? const SizedBox(
                                  height: 4,
                                )
                              : Container(),
                          (controller.addStateinProductGroupsTree.value ==
                                      true ||
                                  controller
                                          .editStateinProductGroupsTree.value ==
                                      true)
                              ? controller.salesCustomerGroups.value == true
                                  ? Container(
                                      width: double.infinity,
                                      margin: const EdgeInsets.only(top: 4),
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          color: Colors.grey.shade100,
                                          border:
                                              Border.all(color: Colors.black12),
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      child: Text(
                                        '',
                                        style: const TextStyle(fontSize: 14),
                                      ),
                                    )
                                  : TaxListTextField(
                                      suggetionCallBack: (pattern) async {
                                        final suggestions = controller
                                            .allRetailTax.value
                                            .getRetailTaxWithSearchKey(pattern);
                                        return suggestions;
                                      },
                                      onSuggetionSelected: (p) async {
                                        controller.selectedTaxListField(p);
                                      },
                                      controller: controller.taxProductGroups,
                                      executeClose: () {},
                                    )
                              : controller.salesCustomerGroups.value == true
                                  ? Container(
                                      width: double.infinity,
                                      margin: const EdgeInsets.only(top: 4),
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          color: Colors.grey.shade100,
                                          border:
                                              Border.all(color: Colors.black12),
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      child: Obx(
                                        () => controller
                                                        .selectedItemGroups
                                                        .value
                                                        .customerAccountName ==
                                                    '' ||
                                                controller
                                                        .selectedItemGroups
                                                        .value
                                                        .customerAccountName ==
                                                    null
                                            ? Text('')
                                            : Text(
                                                '${controller.selectedItemGroups.value.customerAccountName}',
                                                style: const TextStyle(
                                                    fontSize: 14),
                                              ),
                                      ),
                                    )
                                  : Container(
                                      width: double.infinity,
                                      margin: const EdgeInsets.only(top: 4),
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          color: Colors.grey.shade100,
                                          border:
                                              Border.all(color: Colors.black12),
                                          borderRadius: BorderRadius.circular(12)
                            ),
                            child: Obx(
                                  () =>
                              controller.selectedItemGroups.value.taxName ==
                                  '' ||
                                  controller.selectedItemGroups.value.taxName ==
                                      null ?
                              Text('')
                                            : Text(
                                                '${controller.selectedItemGroups.value.taxName}',
                                                style: const TextStyle(
                                                    fontSize: 14),
                                              ),
                                      ),
                                    ),
                          const SizedBox(
                            height: 10,
                          ),
                          controller.salesCustomerGroups.value == true
                              ? Text(
                                  LocaleKeys.supplierAccount.tr,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              : Container(),
                          (controller.addStateinProductGroupsTree.value ==
                                      true ||
                                  controller
                                          .editStateinProductGroupsTree.value ==
                                      true)
                              ? controller.salesCustomerGroups.value == true
                                  ? Container(
                                      width: double.infinity,
                                      margin: const EdgeInsets.only(top: 4),
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          color: Colors.grey.shade100,
                                          border:
                                              Border.all(color: Colors.black12),
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      child: Text(
                                        '',
                                        style: const TextStyle(fontSize: 14),
                                      ),
                                    )
                                  : Container()
                              : controller.salesCustomerGroups.value == true
                                  ? Container(
                                      width: double.infinity,
                                      margin: const EdgeInsets.only(top: 4),
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          color: Colors.grey.shade100,
                                          border:
                                              Border.all(color: Colors.black12),
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      child: Obx(
                                        () => controller
                                                        .selectedItemGroups
                                                        .value
                                                        .supplierAccountName ==
                                                    '' ||
                                                controller
                                                        .selectedItemGroups
                                                        .value
                                                        .supplierAccountName ==
                                                    null
                                            ? Text('')
                                            : Text(
                                                '${controller.selectedItemGroups.value.supplierAccountName}',
                                                style: const TextStyle(
                                                    fontSize: 14),
                                              ),
                                      ),
                                    )
                                  : Container(),
                          const SizedBox(
                            height: 10,
                          ),
                          (controller.addStateinProductGroupsTree.value ==
                                      true ||
                                  controller
                                          .editStateinProductGroupsTree.value ==
                                      true)
                              ? Row(
                                  children: [
                                    Checkbox(
                                      value: controller.hasChildrenTree.value,
                                      // activeColor: controller.hasChildrenTree.value == true ? CupertinoColors.activeBlue : Colors.grey,
                                      onChanged: controller.changeHasChildrenTree,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(LocaleKeys.hasChildren.tr, style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),),
                            ],
                          )
                              :
                          controller.selectedItemGroups.value.hasChildren == true ?
                          Row(
                            children: [
                              Checkbox(
                                  value: controller.selectedItemGroups.value.hasChildren,
                                  onChanged: (c){},
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                                        Text(
                                          LocaleKeys.hasChildren.tr,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    )
                                  : Container(),
                          const SizedBox(
                            height: 10,
                          ),
                          controller.salesCustomerGroups.value == true
                              ? Container()
                              : Text(
                                  LocaleKeys.codeStartWith.tr,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                          controller.salesCustomerGroups.value == true
                              ? Container()
                              : (controller.addStateinProductGroupsTree.value ==
                                          true ||
                                      controller.editStateinProductGroupsTree
                                              .value ==
                                          true)
                                  ? SizedBox(
                                      height: 38,
                                      child: CustomTextFormField(
                                        color: Colors.grey.shade100,
                                        radius: 12,
                                        controller: controller
                                            .codeStartWithProductGroups,
                                        textAlign: Get.find<
                                                        LanguageController>()
                                                    .isArabic ||
                                                Get.find<LanguageController>()
                                                    .isUrdo ||
                                                Get.find<LanguageController>().isHindi ? TextAlign.right :TextAlign.left,
                            ),
                          )
                              :
                          Container(
                            width: double.infinity,
                            margin: const EdgeInsets.only(top: 4),
                            padding: const EdgeInsets.all(8),

                            decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                border: Border.all(
                                    color: Colors.black12
                                ),
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      child: Obx(
                                        () => controller.selectedItemGroups
                                                    .value.codePrefix ==
                                                null
                                            ? const Text('')
                                            : Text(
                                                '${controller.selectedItemGroups.value.codePrefix}',
                                                style: const TextStyle(
                                                    fontSize: 14),
                                              ),
                                      ),
                                    ),
                          controller.salesCustomerGroups.value == true
                              ? Container()
                              : const SizedBox(
                                  height: 10,
                                ),
                          Text(
                            LocaleKeys.note.tr,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          (controller.addStateinProductGroupsTree.value ==
                                      true ||
                                  controller
                                          .editStateinProductGroupsTree.value ==
                                      true)
                              ? SizedBox(
                            height: 38,
                            child: CustomTextFormField(
                              color: Colors.grey.shade100,
                              radius: 12,
                              controller: controller.notesProductGroups,
                              textAlign: Get.find<LanguageController>().isArabic ||
                                  Get.find<LanguageController>().isUrdo ||
                                  Get.find<LanguageController>().isHindi ? TextAlign.right :TextAlign.left,
                            ),
                          )
                              : Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(8),
                            margin: const EdgeInsets.only(top: 4),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                border: Border.all(
                                    color: Colors.black12
                                ),
                                borderRadius: BorderRadius.circular(12)
                            ),
                            child: Obx(
                                  ()=> Text('${controller.selectedItemGroups.value.notes}', style: const TextStyle(
                                  fontSize: 14
                              ),),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
              ),

              Container(
                decoration: BoxDecoration(
                    color: Colors.blueGrey.shade50,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    )
                ),
                height: 40,

                child: (controller.addStateinProductGroupsTree.value == true
                || controller.editStateinProductGroupsTree.value == true) ?

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    SizedBox(
                        width: 40,
                        height: 40,
                        child: InkWell(
                          onTap: () async {

                            if(controller.addStateinProductGroupsTree.value == true
                                && controller.editStateinProductGroupsTree.value == false) {
                              log('add execute ................');

                                    if (controller.salesCustomerGroups.value ==
                                        true) {
                                      log('add customer groups execute----------');

                                      DataProductGroups data =
                                          DataProductGroups(
                                        id: 0,
                                        parentId: controller
                                                .itemGroupListField.text.isEmpty
                                            ? 0
                                            : controller
                                                .selectedItemGroups.value.id,
                                        code: controller.codeProductGroups.text,
                                        nameA:
                                            controller.nameArProductGroups.text,
                                        nameE:
                                            controller.nameEnProductGroups.text,
                                        hasChildren:
                                            controller.hasChildrenTree.value,
                                        notes:
                                            controller.notesProductGroups.text,
                                      );


                                      controller.load.value = false;
                                      (controller.load == false)
                                          ? showLoadingDialog(
                                              context, LocaleKeys.loadAdd.tr)
                                          : null;
                                      await controller
                                          .addCustomersGroups(
                                              context, () {}, data)
                                          .then((value) {
                                        controller.load.value = true;
                                        Get.back();
                                      });
                                    } else {
                                      DataProductGroups data =
                                          DataProductGroups(
                                        id: 0,
                                        parentId: controller
                                                .itemGroupListField.text.isEmpty
                                            ? 0
                                            : controller
                                                .selectedItemGroups.value.id,
                                        code: controller.codeProductGroups.text,
                                        nameA:
                                            controller.nameArProductGroups.text,
                                        nameE:
                                            controller.nameEnProductGroups.text,
                                        hasChildren:
                                            controller.hasChildrenTree.value,
                                        notes:
                                            controller.notesProductGroups.text,
                                        codePrefix: controller
                                            .codeStartWithProductGroups.text,
                                        supplierId: controller
                                                .selectedRetailSuppliersList
                                                .value
                                                .id ??
                                            0,
                                        taxId: controller
                                                .selectedTaxSuppliersList
                                                .value
                                                .id ??
                                            0,
                                        // taxId: ,
                                      );
                                      controller.load.value = false;
                                      (controller.load == false)
                                          ? showLoadingDialog(
                                              context, LocaleKeys.loadAdd.tr)
                                          : null;
                                      await controller
                                          .addProductGroups(
                                              context, () {}, data)
                                          .then((value) {
                                        controller.load.value = true;
                                        Get.back();
                                      });
                                    }
                                  }
                            else {
                                    log('edit execute ................');

                                    if (controller.salesCustomerGroups.value ==
                                        true) {
                                      DataProductGroups data =
                                          DataProductGroups(
                                        id: controller
                                            .selectedItemGroups.value.id,
                                        parentId: controller
                                                .itemGroupListField.text.isEmpty
                                            ? 0
                                            : controller.selectedItemGroups
                                                .value.parentId,
                                        code: controller.codeProductGroups.text,
                                        nameA:
                                            controller.nameArProductGroups.text,
                                        nameE:
                                            controller.nameEnProductGroups.text,
                                        hasChildren:
                                            controller.hasChildrenTree.value,
                                        notes:
                                            controller.notesProductGroups.text,
                                      );
                                      controller.load.value = false;
                                      (controller.load == false)
                                          ? showLoadingDialog(
                                              context, LocaleKeys.loadEdit.tr)
                                          : null;
                                      await controller
                                          .addCustomersGroups(
                                              context, () {}, data)
                                          .then((value) {
                                        controller.load.value = true;
                                        Get.back();
                                      });
                                    }
                                    else {
                                      DataProductGroups data =
                                          DataProductGroups(
                                        id: controller
                                            .selectedItemGroups.value.id,
                                        parentId: controller
                                                .itemGroupListField.text.isEmpty
                                            ? 0
                                            : controller.selectedItemGroups
                                                .value.parentId,
                                        code: controller.codeProductGroups.text,
                                        nameA:
                                            controller.nameArProductGroups.text,
                                        nameE:
                                            controller.nameEnProductGroups.text,
                                        hasChildren:
                                            controller.hasChildrenTree.value,
                                        notes:
                                            controller.notesProductGroups.text,
                                        codePrefix: controller
                                            .codeStartWithProductGroups.text,
                                        supplierId: controller
                                                .selectedRetailSuppliersList
                                                .value
                                                .id ??
                                            0,
                                        taxId: controller
                                                .selectedTaxSuppliersList
                                                .value
                                                .id ??
                                            0,
                                      );
                                      controller.load.value = false;
                                      (controller.load == false)
                                          ? showLoadingDialog(
                                              context, LocaleKeys.loadEdit.tr)
                                          : null;
                                      await controller
                                          .addProductGroups(
                                              context, () {}, data)
                                          .then((value) {
                                        controller.load.value = true;
                                        Get.back();
                                      });
                                    }
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
                            controller.clearProductGroupsTree();
                            controller.addStateinProductGroupsTree.value = false ;
                            controller.editStateinProductGroupsTree.value = false ;

                          },
                          child: Image.asset(
                            'assets/images/close.png',
                            width: 35,
                            height: 35,
                            fit: BoxFit.fill,
                          ),
                        )),
                  ],
                )
                : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(

                      onTap:(){
                        Get.back();

                      },

                        child: Image.asset(
                          'assets/images/back.png',
                          width: 35,
                          height: 35,
                          fit: BoxFit.fill,
                        ),),
                    InkWell(

                      onTap:(){

                        controller.addStateinProductGroupsTree.value = true ;
                        controller.editStateinProductGroupsTree.value = false ;

                      },

                        child: Image.asset(
                          'assets/images/add.png',
                          width: 35,
                          height: 35,
                          fit: BoxFit.fill,
                        ),),
                    InkWell(

                      onTap: () {
                        RetailSuppliersList supplier = RetailSuppliersList(

                          id: controller.selectedItemGroups.value.supplierId,
                        );

                        RetailTaxList tax = RetailTaxList(
                            id: controller.selectedItemGroups.value.taxId
                        );
                        controller.selectedSupplierListField(supplier);
                        controller.selectedTaxListField(tax);
                        controller.codeProductGroups.text =
                            controller.selectedItemGroups.value.code ?? '';
                        controller.nameArProductGroups.text =
                            controller.selectedItemGroups.value.nameA ?? '';
                        controller.nameEnProductGroups.text =
                            controller.selectedItemGroups.value.nameE ?? '';
                        controller.supplierProductGroups.text =
                            controller.selectedItemGroups.value.supplierName ??
                                '';
                        controller.taxProductGroups.text =
                            controller.selectedItemGroups.value.taxName ?? '';
                        controller.hasChildrenTree.value = controller
                                        .selectedItemGroups.value.hasChildren ??
                                    false;
                                controller.codeStartWithProductGroups.text =
                                    controller.selectedItemGroups.value
                                            .codePrefix ??
                                        '';
                                controller.notesProductGroups.text =
                                    controller.selectedItemGroups.value.notes ??
                                        '';
                                controller.addStateinProductGroupsTree.value =
                                    false;
                                controller.editStateinProductGroupsTree.value =
                                    true;
                              },
                              child: const Icon(
                                Icons.mode_edit_outline_outlined,
                                color: Colors.green,
                                size: 35,
                              )),
                          InkWell(
                              onTap: () async {
                                if (controller.addStateinProductGroupsTree
                                            .value ==
                                        false &&
                                    controller.editStateinProductGroupsTree
                                            .value ==
                                        false) {
                                  QuickAlert.show(
                                    context: context,
                                    title: '',
                                    type: QuickAlertType.warning,
                              barrierDismissible: false,
                              text: ' ${LocaleKeys.makeDelete.tr}',
                              headerBackgroundColor: Colors.orange,
                              confirmBtnColor: Colors.green,
                              // cancelBtnColor: Colors.red.shade700,
                              showConfirmBtn: true,
                              cancelBtnTextStyle: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                              confirmBtnText: LocaleKeys.ok.tr,
                              cancelBtnText: LocaleKeys.cancel.tr,
                              showCancelBtn: true,
                              onConfirmBtnTap: () async {
                                Get.back();
                                controller.load.value = false;
                                (controller.load == false)
                                    ? showLoadingDialog(
                                    context, LocaleKeys.loadDele.tr)
                                    : null;
                                await controller.deleteProductGroups(
                                    context, () {},
                                    controller.selectedItemGroups.value.id ?? 0)
                                    .then((value) {
                                  controller.load.value = true;
                                  Get.back();
                                });
                              },
                              onCancelBtnTap: () => Get.back(),
                            );
                          }

                        },
                        child: const Icon(Icons.delete_outline_outlined, color: Colors.red,size: 35,)),
                    const Icon(Icons.search, color: Colors.grey,size: 35,),

                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
}