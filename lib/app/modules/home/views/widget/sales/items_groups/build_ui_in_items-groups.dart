import 'package:chameleon/app/modules/home/model/sales/getRetailGroups/Data.dart';
import 'package:chameleon/app/modules/home/views/widget/sales/items_groups/custom_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_simple_treeview/flutter_simple_treeview.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../../generated/locales.g.dart';
import '../../../../../../../global/controllers/language_controller.dart';
import '../../../../controllers/home_controller.dart';
import '../../../../model/sales/getItemGroup/Data.dart';
import '../../../../model/sales/tax/Data.dart';

class BuildUiInItemsGroup extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
      children: [

            (controller.noDataGetGroupProduct.value == true)
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Center(
                        child: Text(
                          LocaleKeys.noItemsGroupRequest.tr,
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
                      child: Directionality(
                        textDirection:
                            (Get.find<LanguageController>().isArabic ||
                                    Get.find<LanguageController>().isUrdo ||
                                    Get.find<LanguageController>().isHindi)
                                ? TextDirection.rtl
                                : TextDirection.ltr,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                              minWidth: MediaQuery.of(context).size.width,
                              minHeight: MediaQuery.of(context).size.height,
                            ),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: IntrinsicWidth(
                                child: Column(
                                  children: [
                                    TreeView(
                                      nodes: _buildTreeNodes(
                                          controller.mainNode.value,
                                          controller.allProductGroups.value
                                                  .data ??
                                              [],
                                          context),
                                      treeController:
                                          controller.treeController.value,
                                      indent: 30,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    ));
  }

  List<TreeNode> _buildTreeNodes(List<DataProductGroups> parents,
      List<DataProductGroups> allNodes,
      BuildContext context) {
    return parents.map((parent) {
      final children = controller.fetchChildrenNodes(parent.id ??0, allNodes);
      return TreeNode(
        content: Expanded(
          child: Row(
            children: [
              parent.levels == 1 ?
              const Icon(Icons.group, color: Colors.green,size: 15,)
                  :parent.levels == 2 ?
              const Icon(Icons.account_tree_outlined, color: Colors.red,size: 15,)
                  : parent.levels == 3 ?
              const Icon(Icons.ac_unit, color: Colors.blue,size: 15,)
                  : const Icon(Icons.point_of_sale_sharp, color: Colors.orange,size: 15,),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: Row(
                  children: [
                    Obx(
                      () => InkWell(
                        onTap: () async {
                          await controller
                              .saveSelectedItemTree(parent.groupNameWithCode!)
                              .then((value) {
                            controller.selectedStoreTree.value =
                                controller.getLastSaveSelectedItemTree();
                          });
                          controller.itemGroupListField.text =
                              parent.groupNameWithCode ?? '';
                        },
                        child: Text(
                          '${parent.groupNameWithCode}',
                          style: TextStyle(
                            fontSize: controller.selectedStoreTree.value ==
                                    parent.groupNameWithCode
                                ? 16
                                : 14,
                            fontWeight: controller.selectedStoreTree.value ==
                                    parent.groupNameWithCode
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    controller.selectedStoreTree.value ==
                            parent.groupNameWithCode
                        ? InkWell(
                            onTap: () {
                              controller.addStateinProductGroupsTree.value =
                                  false;
                              controller.editStateinProductGroupsTree.value =
                                  false;
                              controller.clearProductGroupsTree();
                              controller.selectedListField(parent);
                              controller.selectedRetailSuppliersList.value =
                                  RetailSuppliersList();
                              controller.selectedTaxSuppliersList.value =
                                  RetailTaxList();
                              parent.parentId != null
                                  ? controller.FetchMainGroupName(
                                      controller.allProductGroups.value.data ??
                                          [],
                                      parent.parentId)
                              : null;
                          controller.isSelectedTreeNode.value =
                              controller.selectedItemGroups.value
                                  .groupNameWithCode ==
                                  parent.groupNameWithCode;
                          CustomDialog(context);
                        },
                        child: const Icon(Icons.mode_edit_outline_outlined, color: Colors.green,))
                        :Container(),

                  ],
                ),
              ),
            ],
          ),
        ),
        children: _buildTreeNodes(children, allNodes, context),
      );
    }).toList();
  }
}
