// import 'dart:developer';
//
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:month_picker_dialog/month_picker_dialog.dart';
//
// import '../../../../../../../generated/locales.g.dart';
// import '../../../../../../../global/controllers/language_controller.dart';
// import '../../../../../../../global/global_widget/custom_text_form_field.dart';
// import '../../../../../../../global/global_widget/list_text_field.dart';
// import '../../../../../login/controllers/login_controller.dart';
// import '../../../../controllers/home_controller.dart';
// import '../../transport/dialog_loading.dart';
//
// class CustomAddItemsGroupsSales extends GetView<HomeController> {
//   @override
//   Widget build(BuildContext context) {
//     final login = Get.put(LoginController());
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       textDirection: Get.find<LanguageController>().isArabic
//           ? TextDirection.rtl
//           : Get.find<LanguageController>().isUrdo
//               ? TextDirection.rtl
//               : Get.find<LanguageController>().isHindi
//                   ? TextDirection.rtl
//                   : TextDirection.ltr,
//       children: [
//         Row(
//           children: [
//             const Spacer(),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 8.0),
//               child: Row(
//                 children: [
//                   SizedBox(
//                       width: 40,
//                       height: 40,
//                       child: InkWell(
//                           onTap: () async {
//                             if (controller.editItemsGroupsSales.value == true) {
//
//                               log('hhhhhhhhhhhhhhhhhhhhhhhhhh');
//                               log('hhhhhhhhhhhhhhhhhhhhhhhhhh');
//
//                               controller.load.value = false;
//                               (controller.load == false)
//                                   ? showLoadingDialog(
//                                       context, LocaleKeys.loadEdit.tr)
//                                   : null;
//
//
//                               await controller.editRequstLoan(context, () {
//                                 login.loginPinCodeController.clear();
//                               },
//                                   Get.find<LanguageController>()
//                                           .selectedLanguage
//                                           ?.id ??
//                                       2,
//                                   controller
//                                           .allEmployeesLoansReq
//                                           .value
//                                           .data?[controller.indexLoan.value]
//                                           .id ??
//                                       0).then((value) {
//                                 Get.back();
//                                 controller.load.value = true;
//                               });
//                             }
//                             else {
//                           }
//                         },
//                         child: Image.asset(
//                           'assets/images/accept.png',
//                           width: 35,
//                           height: 35,
//                           fit: BoxFit.fill,
//                         ),
//                       )),
//                   const SizedBox(
//                     width: 20,
//                   ),
//                   SizedBox(
//                       width: 40,
//                       height: 40,
//                       child: InkWell(
//                         onTap: () {
//                           controller.clearItemsAddItemsGroup();
//                           controller.addItemsGroupsSales.value = false;
//                           controller.editItemsGroupsSales.value = false;
//                           controller.salesItemsGroup.value = true;
//                           controller.expandedItemsGroupsRequest.value = true;
//                         },
//                         child: Image.asset(
//                           'assets/images/close.png',
//                           width: 35,
//                           height: 35,
//                           fit: BoxFit.fill,
//                         ),
//                       )),
//                 ],
//               ),
//             )
//           ],
//         ),
//         kIsWeb
//             ? controller.isSmallScreen(context)
//                 ? Container(
//                     color: Colors.white,
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 12.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         textDirection: Get.find<LanguageController>().isArabic
//                             ? TextDirection.rtl
//                             : Get.find<LanguageController>().isUrdo
//                                 ? TextDirection.rtl
//                                 : Get.find<LanguageController>().isHindi
//                                     ? TextDirection.rtl
//                                     : TextDirection.ltr,
//                         children: [
//                           SizedBox(height: 5),
//                           // Text(
//                           //   LocaleKeys.solfaType.tr,
//                           //   style: const TextStyle(
//                           //       fontWeight: FontWeight.bold, fontSize: 14),
//                           //   textAlign: TextAlign.start,
//                           // ),
//                           // ListLoanTypeTextField(
//                           //   action: () {
//                           //     controller.hrLoanTypes.clear();
//                           //   },
//                           //   suggetionCallBack: (pattern) async {
//                           //     final suggestions = controller
//                           //         .allEmployeesLoans.value
//                           //         .getHrLoanTypesBySearchKey(pattern);
//                           //     if (kDebugMode) {
//                           //       print(suggestions);
//                           //     }
//                           //     return suggestions;
//                           //   },
//                           //   onSuggetionSelected: (hrLeaves) async {
//                           //     controller.setSelectedHrLoanTypes(hrLeaves);
//                           //
//                           //     log('id = ${hrLeaves.id}');
//                           //   },
//                           //   controller: controller.hrLoanTypes,
//                           // ),
//                           // const SizedBox(
//                           //   height: 10,
//                           // ),
//                           Text(
//                             LocaleKeys.solfaValue.tr,
//                             style: const TextStyle(
//                                 fontWeight: FontWeight.bold, fontSize: 14),
//                             textAlign: TextAlign.start,
//                           ),
//                           kIsWeb
//                               ? SizedBox(
//                                   height: 50,
//                                   width: double.infinity,
//                                   child: CustomTextFormField(
//                                     controller: controller.loanValue,
//                                     type: TextInputType.number,
//                                     color: Colors.white,
//                                     radius: 14,
//                                   ),
//                                 )
//                               : CustomTextFormField(
//                                   controller: controller.loanValue,
//                                   type: TextInputType.number,
//                                   color: Colors.white,
//                                   radius: 14,
//                                 ),
//                           const SizedBox(
//                             height: 10,
//                           ),
//                           Text(
//                             LocaleKeys.monthNo.tr,
//                             style: const TextStyle(
//                                 fontWeight: FontWeight.bold, fontSize: 14),
//                             textAlign: TextAlign.start,
//                           ),
//                           kIsWeb
//                               ? SizedBox(
//                                   height: 50,
//                                   width: double.infinity,
//                                   child: CustomTextFormField(
//                                     controller: controller.nofMonths,
//                                     type: TextInputType.number,
//                                     color: Colors.white,
//                                     radius: 14,
//                                     onChanged: (v) {
//                                       if (controller
//                                               .loanValue.text.isNotEmpty &&
//                                           controller
//                                               .nofMonths.text.isNotEmpty) {
//                                         var res = double.parse(
//                                                 controller.loanValue.text) ~/
//                                             double.parse(
//                                                 controller.nofMonths.text);
//
//                                         controller.monthEst.value =
//                                             res.toString();
//
//                                         log('est = ${controller.monthEst.value}');
//                                       }
//                                     },
//                                   ),
//                                 )
//                               : CustomTextFormField(
//                                   controller: controller.nofMonths,
//                                   type: TextInputType.number,
//                                   color: Colors.white,
//                                   radius: 14,
//                                   onChanged: (v) {
//                                     if (controller.loanValue.text.isNotEmpty &&
//                                         controller.nofMonths.text.isNotEmpty) {
//                                       var res = double.parse(
//                                               controller.loanValue.text) ~/
//                                           double.parse(
//                                               controller.nofMonths.text);
//
//                                       controller.monthEst.value =
//                                           res.toString();
//
//                                       log('est = ${controller.monthEst.value}');
//                                     }
//                                   },
//                                 ),
//                           const SizedBox(
//                             height: 10,
//                           ),
//                           Text(
//                             LocaleKeys.monthEst.tr,
//                             style: const TextStyle(
//                                 fontWeight: FontWeight.bold, fontSize: 12),
//                             textAlign: TextAlign.start,
//                           ),
//                           Obx(
//                             () => Container(
//                               width: double.infinity,
//                               height: 47,
//                               decoration: BoxDecoration(
//                                   borderRadius: const BorderRadius.all(
//                                       Radius.circular(14)),
//                                   color: Colors.white,
//                                   border:
//                                       Border.all(color: Colors.grey.shade600)),
//                               child: Padding(
//                                 padding: EdgeInsets.all(8.0),
//                                 child: Text(controller.monthEst.value,
//                                     style:
//                                         TextStyle(fontWeight: FontWeight.bold),
//                                     textAlign: TextAlign.center),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 10,
//                           ),
//                           Text(
//                             LocaleKeys.startMonth.tr,
//                             style: const TextStyle(
//                                 fontWeight: FontWeight.bold, fontSize: 14),
//                             textAlign: TextAlign.start,
//                           ),
//                           Obx(
//                             () => InkWell(
//                               onTap: () async {
//                                 final pickedDate = await showMonthPicker(
//                                   context: context,
//                                   firstDate: DateTime(1900),
//                                   lastDate: DateTime(2100),
//                                   initialDate:
//                                       controller.startMonthsLoans.value,
//                                   monthStylePredicate: (month) {
//                                     if (month ==
//                                         controller
//                                             .startMonthsLoans.value.month) {
//                                       return ButtonStyle(
//                                           backgroundColor:
//                                               MaterialStateProperty.all(
//                                                   Colors.blue),
//                                           foregroundColor:
//                                               MaterialStateProperty.all(
//                                                   Colors.white));
//                                     } else {
//                                       return ButtonStyle(
//                                           backgroundColor:
//                                               MaterialStateProperty.all(
//                                                   Colors.grey.shade200),
//                                           foregroundColor:
//                                               MaterialStateProperty.all(
//                                                   Colors.black));
//                                     }
//                                   },
//                                   yearStylePredicate: (year) {
//                                     if (year ==
//                                         controller
//                                             .startMonthsLoans.value.year) {
//                                       return ButtonStyle(
//                                           backgroundColor:
//                                               MaterialStateProperty.all(
//                                                   Colors.blue),
//                                           foregroundColor:
//                                               MaterialStateProperty.all(
//                                                   Colors.white));
//                                     } else {
//                                       return ButtonStyle(
//                                           backgroundColor:
//                                               MaterialStateProperty.all(
//                                                   Colors.grey.shade200),
//                                           foregroundColor:
//                                               MaterialStateProperty.all(
//                                                   Colors.black));
//                                     }
//                                   },
//                                 );
//
//                                 if (pickedDate != null) {
//                                   controller
//                                       .updateSelectedMonthDate(pickedDate);
//                                 }
//                               },
//                               child: Container(
//                                 width: double.infinity,
//                                 height: 47,
//                                 decoration: BoxDecoration(
//                                     borderRadius: const BorderRadius.all(
//                                         Radius.circular(14)),
//                                     color: Colors.white,
//                                     border: Border.all(
//                                         color: Colors.grey.shade600)),
//                                 child: Padding(
//                                   padding: EdgeInsets.all(8.0),
//                                   child: Get.find<LanguageController>()
//                                               .isArabic ||
//                                           Get.find<LanguageController>()
//                                               .isUrdo ||
//                                           Get.find<LanguageController>().isHindi
//                                       ? Text(
//                                           '${controller.startMonthsLoans.value.year}/${controller.startMonthsLoans.value.month}',
//                                           style: TextStyle(
//                                               fontWeight: FontWeight.bold),
//                                           textAlign: TextAlign.center)
//                                       : Text(
//                                           '${controller.startMonthsLoans.value.month}/${controller.startMonthsLoans.value.year}',
//                                           style: TextStyle(
//                                               fontWeight: FontWeight.bold),
//                                           textAlign: TextAlign.center),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 10,
//                           ),
//                           Text(
//                             LocaleKeys.reason.tr,
//                             style: const TextStyle(
//                                 fontWeight: FontWeight.bold, fontSize: 14),
//                             textAlign: TextAlign.start,
//                           ),
//                           CustomTextFormField(
//                             controller: controller.reasonLoans,
//                             type: TextInputType.text,
//                             color: Colors.white,
//                             maxLines: kIsWeb ? 1 : 3,
//                             minLines: kIsWeb ? 1 : 3,
//                             radius: 14,
//                           ),
//                           const SizedBox(
//                             height: 10,
//                           ),
//                         ],
//                       ),
//                     ),
//                   )
//                 : controller.isMediumScreen(context)
//                     ? Container(
//                         color: Colors.white,
//                         child: Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 12.0),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             textDirection:
//                                 Get.find<LanguageController>().isArabic
//                                     ? TextDirection.rtl
//                                     : Get.find<LanguageController>().isUrdo
//                                         ? TextDirection.rtl
//                                         : Get.find<LanguageController>().isHindi
//                                             ? TextDirection.rtl
//                                             : TextDirection.ltr,
//                             children: [
//                               SizedBox(height: 5),
//                               Row(
//                                 children: [
//                                   Expanded(
//                                     child: Text(
//                                       LocaleKeys.solfaType.tr,
//                                       style: const TextStyle(
//                                           fontWeight: FontWeight.bold,
//                                           fontSize: 14),
//                                       textAlign: TextAlign.start,
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     width: 20,
//                                   ),
//                                   Expanded(
//                                     child: Text(
//                                       LocaleKeys.solfaValue.tr,
//                                       style: const TextStyle(
//                                           fontWeight: FontWeight.bold,
//                                           fontSize: 14),
//                                       textAlign: TextAlign.start,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               Row(
//                                 children: [
//                                   Expanded(
//                                     child: ListLoanTypeTextField(
//                                       action: () {
//                                         controller.hrLoanTypes.clear();
//                                       },
//                                       suggetionCallBack: (pattern) async {
//                                         final suggestions = controller
//                                             .allEmployeesLoans.value
//                                             .getHrLoanTypesBySearchKey(pattern);
//                                         if (kDebugMode) {
//                                           print(suggestions);
//                                         }
//                                         return suggestions;
//                                       },
//                                       onSuggetionSelected: (hrLeaves) async {
//                                         controller
//                                             .setSelectedHrLoanTypes(hrLeaves);
//
//                                         log('id = ${hrLeaves.id}');
//                                       },
//                                       controller: controller.hrLoanTypes,
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     width: 20,
//                                   ),
//                                   Expanded(
//                                     child: SizedBox(
//                                       height: 50,
//                                       width: double.infinity,
//                                       child: CustomTextFormField(
//                                         controller: controller.loanValue,
//                                         type: TextInputType.number,
//                                         color: Colors.white,
//                                         radius: 14,
//                                       ),
//                                     ),
//                                   )
//                                 ],
//                               ),
//                               const SizedBox(
//                                 height: 10,
//                               ),
//                               Row(
//                                 children: [
//                                   Expanded(
//                                     child: Text(
//                                       LocaleKeys.monthNo.tr,
//                                       style: const TextStyle(
//                                           fontWeight: FontWeight.bold,
//                                           fontSize: 14),
//                                       textAlign: TextAlign.start,
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     width: 20,
//                                   ),
//                                   Expanded(
//                                     child: Text(
//                                       LocaleKeys.monthEst.tr,
//                                       style: const TextStyle(
//                                           fontWeight: FontWeight.bold,
//                                           fontSize: 12),
//                                       textAlign: TextAlign.start,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               const SizedBox(
//                                 height: 10,
//                               ),
//                               Row(
//                                 children: [
//                                   Expanded(
//                                     child: SizedBox(
//                                       height: 50,
//                                       width: double.infinity,
//                                       child: CustomTextFormField(
//                                         controller: controller.nofMonths,
//                                         type: TextInputType.number,
//                                         color: Colors.white,
//                                         radius: 14,
//                                         onChanged: (v) {
//                                           if (controller
//                                                   .loanValue.text.isNotEmpty &&
//                                               controller
//                                                   .nofMonths.text.isNotEmpty) {
//                                             var res = double.parse(controller
//                                                     .loanValue.text) ~/
//                                                 double.parse(
//                                                     controller.nofMonths.text);
//
//                                             controller.monthEst.value =
//                                                 res.toString();
//
//                                             log('est = ${controller.monthEst.value}');
//                                           }
//                                         },
//                                       ),
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     width: 20,
//                                   ),
//                                   Expanded(
//                                     child: Obx(
//                                       () => Container(
//                                         width: double.infinity,
//                                         height: 47,
//                                         decoration: BoxDecoration(
//                                             borderRadius:
//                                                 const BorderRadius.all(
//                                                     Radius.circular(14)),
//                                             color: Colors.white,
//                                             border: Border.all(
//                                                 color: Colors.grey.shade600)),
//                                         child: Padding(
//                                           padding: EdgeInsets.all(8.0),
//                                           child: Text(controller.monthEst.value,
//                                               style: TextStyle(
//                                                   fontWeight: FontWeight.bold),
//                                               textAlign: TextAlign.center),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               SizedBox(
//                                 height: 10,
//                               ),
//                               Row(
//                                 children: [
//                                   Expanded(
//                                     child: Text(
//                                       LocaleKeys.startMonth.tr,
//                                       style: const TextStyle(
//                                           fontWeight: FontWeight.bold,
//                                           fontSize: 14),
//                                       textAlign: TextAlign.start,
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     width: 20,
//                                   ),
//                                   Expanded(
//                                     child: Text(
//                                       LocaleKeys.reason.tr,
//                                       style: const TextStyle(
//                                           fontWeight: FontWeight.bold,
//                                           fontSize: 14),
//                                       textAlign: TextAlign.start,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Expanded(
//                                     child: Obx(
//                                       () => InkWell(
//                                         onTap: () async {
//                                           final pickedDate =
//                                               await showMonthPicker(
//                                             context: context,
//                                             firstDate: DateTime(1900),
//                                             lastDate: DateTime(2100),
//                                             initialDate: controller
//                                                 .startMonthsLoans.value,
//                                             monthStylePredicate: (month) {
//                                               if (month ==
//                                                   controller.startMonthsLoans
//                                                       .value.month) {
//                                                 return ButtonStyle(
//                                                     backgroundColor:
//                                                         MaterialStateProperty
//                                                             .all(Colors.blue),
//                                                     foregroundColor:
//                                                         MaterialStateProperty
//                                                             .all(Colors.white));
//                                               } else {
//                                                 return ButtonStyle(
//                                                     backgroundColor:
//                                                         MaterialStateProperty
//                                                             .all(Colors
//                                                                 .grey.shade200),
//                                                     foregroundColor:
//                                                         MaterialStateProperty
//                                                             .all(Colors.black));
//                                               }
//                                             },
//                                             yearStylePredicate: (year) {
//                                               if (year ==
//                                                   controller.startMonthsLoans
//                                                       .value.year) {
//                                                 return ButtonStyle(
//                                                     backgroundColor:
//                                                         MaterialStateProperty
//                                                             .all(Colors.blue),
//                                                     foregroundColor:
//                                                         MaterialStateProperty
//                                                             .all(Colors.white));
//                                               } else {
//                                                 return ButtonStyle(
//                                                     backgroundColor:
//                                                         MaterialStateProperty
//                                                             .all(Colors
//                                                                 .grey.shade200),
//                                                     foregroundColor:
//                                                         MaterialStateProperty
//                                                             .all(Colors.black));
//                                               }
//                                             },
//                                           );
//
//                                           if (pickedDate != null) {
//                                             controller.updateSelectedMonthDate(
//                                                 pickedDate);
//                                           }
//                                         },
//                                         child: Container(
//                                           width: double.infinity,
//                                           height: 47,
//                                           decoration: BoxDecoration(
//                                               borderRadius:
//                                                   const BorderRadius.all(
//                                                       Radius.circular(14)),
//                                               color: Colors.white,
//                                               border: Border.all(
//                                                   color: Colors.grey.shade600)),
//                                           child: Padding(
//                                             padding: EdgeInsets.all(8.0),
//                                             child: Get.find<LanguageController>()
//                                                         .isArabic ||
//                                                     Get.find<
//                                                             LanguageController>()
//                                                         .isUrdo ||
//                                                     Get.find<
//                                                             LanguageController>()
//                                                         .isHindi
//                                                 ? Text(
//                                                     '${controller.startMonthsLoans.value.year}/${controller.startMonthsLoans.value.month}',
//                                                     style: TextStyle(
//                                                         fontWeight: FontWeight
//                                                             .bold),
//                                                     textAlign: TextAlign.center)
//                                                 : Text(
//                                                     '${controller.startMonthsLoans.value.month}/${controller.startMonthsLoans.value.year}',
//                                                     style: TextStyle(
//                                                         fontWeight:
//                                                             FontWeight.bold),
//                                                     textAlign:
//                                                         TextAlign.center),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     width: 20,
//                                   ),
//                                   Expanded(
//                                     child: CustomTextFormField(
//                                       controller: controller.reasonLoans,
//                                       type: TextInputType.text,
//                                       color: Colors.white,
//                                       maxLines: kIsWeb ? 1 : 3,
//                                       minLines: kIsWeb ? 1 : 3,
//                                       radius: 14,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               const SizedBox(
//                                 height: 10,
//                               ),
//                             ],
//                           ),
//                         ),
//                       )
//                     : Container(
//                         color: Colors.white,
//                         child: Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 12.0),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             textDirection:
//                                 Get.find<LanguageController>().isArabic
//                                     ? TextDirection.rtl
//                                     : Get.find<LanguageController>().isUrdo
//                                         ? TextDirection.rtl
//                                         : Get.find<LanguageController>().isHindi
//                                             ? TextDirection.rtl
//                                             : TextDirection.ltr,
//                             children: [
//                               SizedBox(height: 5),
//                               Row(
//                                 children: [
//                                   Expanded(
//                                     child: Text(
//                                       LocaleKeys.solfaType.tr,
//                                       style: const TextStyle(
//                                           fontWeight: FontWeight.bold,
//                                           fontSize: 14),
//                                       textAlign: TextAlign.start,
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     width: 20,
//                                   ),
//                                   Expanded(
//                                     child: Text(
//                                       LocaleKeys.solfaValue.tr,
//                                       style: const TextStyle(
//                                           fontWeight: FontWeight.bold,
//                                           fontSize: 14),
//                                       textAlign: TextAlign.start,
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     width: 20,
//                                   ),
//                                   Expanded(
//                                     child: Text(
//                                       LocaleKeys.monthNo.tr,
//                                       style: const TextStyle(
//                                           fontWeight: FontWeight.bold,
//                                           fontSize: 14),
//                                       textAlign: TextAlign.start,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               Row(
//                                 children: [
//                                   Expanded(
//                                     child: ListLoanTypeTextField(
//                                       action: () {
//                                         controller.hrLoanTypes.clear();
//                                       },
//                                       suggetionCallBack: (pattern) async {
//                                         final suggestions = controller
//                                             .allEmployeesLoans.value
//                                             .getHrLoanTypesBySearchKey(pattern);
//                                         if (kDebugMode) {
//                                           print(suggestions);
//                                         }
//                                         return suggestions;
//                                       },
//                                       onSuggetionSelected: (hrLeaves) async {
//                                         controller
//                                             .setSelectedHrLoanTypes(hrLeaves);
//
//                                         log('id = ${hrLeaves.id}');
//                                       },
//                                       controller: controller.hrLoanTypes,
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     width: 20,
//                                   ),
//                                   Expanded(
//                                     child: SizedBox(
//                                       height: 50,
//                                       width: double.infinity,
//                                       child: CustomTextFormField(
//                                         controller: controller.loanValue,
//                                         type: TextInputType.number,
//                                         color: Colors.white,
//                                         radius: 14,
//                                       ),
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     width: 20,
//                                   ),
//                                   Expanded(
//                                     child: SizedBox(
//                                       height: 50,
//                                       width: double.infinity,
//                                       child: CustomTextFormField(
//                                         controller: controller.nofMonths,
//                                         type: TextInputType.number,
//                                         color: Colors.white,
//                                         radius: 14,
//                                         onChanged: (v) {
//                                           if (controller
//                                                   .loanValue.text.isNotEmpty &&
//                                               controller
//                                                   .nofMonths.text.isNotEmpty) {
//                                             var res = double.parse(controller
//                                                     .loanValue.text) ~/
//                                                 double.parse(
//                                                     controller.nofMonths.text);
//
//                                             controller.monthEst.value =
//                                                 res.toString();
//
//                                             log('est = ${controller.monthEst.value}');
//                                           }
//                                         },
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               const SizedBox(
//                                 height: 10,
//                               ),
//                               Row(
//                                 children: [
//                                   Expanded(
//                                     child: Text(
//                                       LocaleKeys.monthEst.tr,
//                                       style: const TextStyle(
//                                           fontWeight: FontWeight.bold,
//                                           fontSize: 12),
//                                       textAlign: TextAlign.start,
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     width: 20,
//                                   ),
//                                   Expanded(
//                                     child: Text(
//                                       LocaleKeys.startMonth.tr,
//                                       style: const TextStyle(
//                                           fontWeight: FontWeight.bold,
//                                           fontSize: 14),
//                                       textAlign: TextAlign.start,
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     width: 20,
//                                   ),
//                                   Expanded(
//                                     child: Text(
//                                       LocaleKeys.reason.tr,
//                                       style: const TextStyle(
//                                           fontWeight: FontWeight.bold,
//                                           fontSize: 14),
//                                       textAlign: TextAlign.start,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               const SizedBox(
//                                 height: 10,
//                               ),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Expanded(
//                                     child: Obx(
//                                       () => Container(
//                                         width: double.infinity,
//                                         height: 47,
//                                         decoration: BoxDecoration(
//                                             borderRadius:
//                                                 const BorderRadius.all(
//                                                     Radius.circular(14)),
//                                             color: Colors.white,
//                                             border: Border.all(
//                                                 color: Colors.grey.shade600)),
//                                         child: Padding(
//                                           padding: EdgeInsets.all(8.0),
//                                           child: Text(controller.monthEst.value,
//                                               style: TextStyle(
//                                                   fontWeight: FontWeight.bold),
//                                               textAlign: TextAlign.center),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     width: 20,
//                                   ),
//                                   Expanded(
//                                     child: Obx(
//                                       () => InkWell(
//                                         onTap: () async {
//                                           final pickedDate =
//                                               await showMonthPicker(
//                                             context: context,
//                                             firstDate: DateTime(1900),
//                                             lastDate: DateTime(2100),
//                                             initialDate: controller
//                                                 .startMonthsLoans.value,
//                                             monthStylePredicate: (month) {
//                                               if (month ==
//                                                   controller.startMonthsLoans
//                                                       .value.month) {
//                                                 return ButtonStyle(
//                                                     backgroundColor:
//                                                         MaterialStateProperty
//                                                             .all(Colors.blue),
//                                                     foregroundColor:
//                                                         MaterialStateProperty
//                                                             .all(Colors.white));
//                                               } else {
//                                                 return ButtonStyle(
//                                                     backgroundColor:
//                                                         MaterialStateProperty
//                                                             .all(Colors
//                                                                 .grey.shade200),
//                                                     foregroundColor:
//                                                         MaterialStateProperty
//                                                             .all(Colors.black));
//                                               }
//                                             },
//                                             yearStylePredicate: (year) {
//                                               if (year ==
//                                                   controller.startMonthsLoans
//                                                       .value.year) {
//                                                 return ButtonStyle(
//                                                     backgroundColor:
//                                                         MaterialStateProperty
//                                                             .all(Colors.blue),
//                                                     foregroundColor:
//                                                         MaterialStateProperty
//                                                             .all(Colors.white));
//                                               } else {
//                                                 return ButtonStyle(
//                                                     backgroundColor:
//                                                         MaterialStateProperty
//                                                             .all(Colors
//                                                                 .grey.shade200),
//                                                     foregroundColor:
//                                                         MaterialStateProperty
//                                                             .all(Colors.black));
//                                               }
//                                             },
//                                           );
//
//                                           if (pickedDate != null) {
//                                             controller.updateSelectedMonthDate(
//                                                 pickedDate);
//                                           }
//                                         },
//                                         child: Container(
//                                           width: double.infinity,
//                                           height: 47,
//                                           decoration: BoxDecoration(
//                                               borderRadius:
//                                                   const BorderRadius.all(
//                                                       Radius.circular(14)),
//                                               color: Colors.white,
//                                               border: Border.all(
//                                                   color: Colors.grey.shade600)),
//                                           child: Padding(
//                                             padding: EdgeInsets.all(8.0),
//                                             child: Get.find<LanguageController>()
//                                                         .isArabic ||
//                                                     Get.find<
//                                                             LanguageController>()
//                                                         .isUrdo ||
//                                                     Get.find<
//                                                             LanguageController>()
//                                                         .isHindi
//                                                 ? Text(
//                                                     '${controller.startMonthsLoans.value.year}/${controller.startMonthsLoans.value.month}',
//                                                     style: TextStyle(
//                                                         fontWeight: FontWeight
//                                                             .bold),
//                                                     textAlign: TextAlign.center)
//                                                 : Text(
//                                                     '${controller.startMonthsLoans.value.month}/${controller.startMonthsLoans.value.year}',
//                                                     style: TextStyle(
//                                                         fontWeight:
//                                                             FontWeight.bold),
//                                                     textAlign:
//                                                         TextAlign.center),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     width: 20,
//                                   ),
//                                   Expanded(
//                                     child: CustomTextFormField(
//                                       controller: controller.reasonLoans,
//                                       type: TextInputType.text,
//                                       color: Colors.white,
//                                       maxLines: kIsWeb ? 1 : 3,
//                                       minLines: kIsWeb ? 1 : 3,
//                                       radius: 14,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               const SizedBox(
//                                 height: 10,
//                               ),
//                             ],
//                           ),
//                         ),
//                       )
//             : Container(
//                 color: Colors.white,
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 12.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     textDirection: Get.find<LanguageController>().isArabic
//                         ? TextDirection.rtl
//                         : Get.find<LanguageController>().isUrdo
//                             ? TextDirection.rtl
//                             : Get.find<LanguageController>().isHindi
//                                 ? TextDirection.rtl
//                                 : TextDirection.ltr,
//                     children: [
//                       SizedBox(height: 5),
//                       Text(
//                         LocaleKeys.code.tr,
//                         style: const TextStyle(
//                             fontWeight: FontWeight.bold, fontSize: 14),
//                         textAlign: TextAlign.start,
//                       ),
//                       CustomTextFormField(
//                         controller: controller.codeaItemsGroupSales,
//                         type: TextInputType.text,
//                         color: Colors.white,
//                         radius: 14,
//                         textAlign: TextAlign.center,
//                         onChanged: (v) {},
//                       ),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       Text(
//                         LocaleKeys.enName.tr,
//                         style: const TextStyle(
//                             fontWeight: FontWeight.bold, fontSize: 14),
//                         textAlign: TextAlign.start,
//                       ),
//                       CustomTextFormField(
//                         controller: controller.enNameItemsGroupSales,
//                         type: TextInputType.name,
//                         color: Colors.white,
//                         radius: 14,
//                         onChanged: (v) {},
//                       ),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       Text(
//                         LocaleKeys.arName.tr,
//                         style: const TextStyle(
//                             fontWeight: FontWeight.bold, fontSize: 14),
//                         textAlign: TextAlign.start,
//                       ),
//                       CustomTextFormField(
//                         controller: controller.arNameItemsGroupSales,
//                         type: TextInputType.name,
//                         color: Colors.white,
//                         radius: 14,
//                         onChanged: (v) {},
//                       ),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//       ],
//     );
//   }
// }
