import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../generated/locales.g.dart';
import '../../../../controllers/home_controller.dart';
import 'build_ui_in_items-groups.dart';
import 'custom_list_text_field_with_search.dart';

class CustomSalesItemsGroup extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {

    return Obx(
      () => Column(
        children: [

          const SizedBox(
          height:10
      ),
          Container(

            color: Colors.white,
            padding: const EdgeInsets.all(12),
            child: Column (
              children:[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Text(
                      controller.salesCustomerGroups.value == true
                          ? LocaleKeys.customerGroups.tr
                          : LocaleKeys.itemGroups.tr,
                      style:
                      const TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 15),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: GroupsListTextField(
                        suggetionCallBack: (pattern) async {
                          final suggestions = controller.allProductGroups.value
                              .getItemGroupsWithHasChildren(pattern);

                          return suggestions;
                        },
                        onSuggetionSelected: (p) async {
                          controller.selectedListField(p);
                          await controller
                              .saveSelectedItemTree(p.groupNameWithCode!)
                              .then((value) {
                            controller.selectedStoreTree.value =
                                controller.getLastSaveSelectedItemTree();
                          });
                          if (p.parentId != null) {
                            controller.FetchMainGroupName(
                                controller.allProductGroups.value.data ?? [],
                                p.parentId);
                          }
                        },
                        controller: controller.itemGroupListField,
                        hintText: controller.salesCustomerGroups.value == true
                            ? LocaleKeys.customerGroups.tr
                            : LocaleKeys.itemGroups.tr,
                        executeClose: () {
                          controller.selectedStoreTree.value = '';
                        },
                      ),
                    ),

                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                BuildUiInItemsGroup()
              ]
          )
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
