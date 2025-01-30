import 'package:focused_menu/focused_menu.dart';
import 'dart:developer';

import 'package:chameleon/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:focused_menu/modals.dart';
import 'package:get/get.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import '../../../../../generated/locales.g.dart';
import '../../../../../global/constants/constants.dart';
import '../../../../../global/controllers/language_controller.dart';
import '../../../../routes/app_pages.dart';
import '../../../login/controllers/login_controller.dart';

// ...........

class CustomMenuHome extends GetView<HomeController> {

  @override
  Widget build(BuildContext context) {


    final List<Map<String, dynamic>> _menuItems =
    [
      {
        'text': LocaleKeys.transport.tr,
        'icon': 'assets/images/transport_new.png',
        'value': 'transport',
        'isVisible': Get
            .put(LoginController())
            .user
            .data
            ?.showTransportationCurrentWaybill ==
            true ||
            Get
                .put(LoginController())
                .user
                .data
                ?.showTransportationWaybillLog ==
                true ||
            Get
                .put(LoginController())
                .user
                .data
                ?.showTransportationDriverDues ==
                true
      },
      {
        'text': LocaleKeys.humanResource.tr,
        'icon': 'assets/images/hr.png',
        'value': 'hr',
        'isVisible': Get
            .put(LoginController())
            .user
            .data
            ?.showHumanResourcesHolidayRequest ==
            true ||
            Get
                .put(LoginController())
                .user
                .data
                ?.showHumanResourcesHolidayLog ==
                true ||
            Get
                .put(LoginController())
                .user
                .data
                ?.showHumanResourcesHolidayBalance ==
                true ||
            Get
                .put(LoginController())
                .user
                .data
                ?.showHumanResourcesLoanRequest ==
                true ||
            Get
                .put(LoginController())
                .user
                .data
                ?.showHumanResourcesLoanLog ==
                true ||
            Get.put(LoginController()).user.data?.showHumanResourcesLoanBalance ==
                true ||
            Get.put(LoginController())
                .user
                .data
                ?.showHumanResourcesAttendanceDeparture ==
                true ||
            Get.put(LoginController())
                .user
                .data
                ?.showHumanResourcesDelayPermission ==
                true ||
            Get
                .put(LoginController())
                .user
                .data
                ?.showHumanResourcesDeraturePermission ==
                true ||
            Get.put(LoginController()).user.data?.showHumanResourcesAbsence ==
                true ||
            Get.put(LoginController())
                .user
                .data
                ?.showHumanResourcesEmpStatement ==
                true ||
            Get.put(LoginController())
                .user
                .data
                ?.showHumanResourcesEmpLoanStatement ==
                true
      },
      {
        'text': LocaleKeys.sales.tr,
        'icon': 'assets/images/sales_n.png',
        'value': 'sales',
        'isVisible':(Get
            .put(
            LoginController())
            .user
            .data
            ?.showSalesRetailInvoice ==
            true ||
            Get
                .put(LoginController())
                .user
                .data
                ?.showSalesRetailCustomers ==
                true ||
            Get
                .put(LoginController())
                .user
                .data
                ?.showSalesRetailItemsGroups ==
                true ||
            Get
                .put(LoginController())
                .user
                .data
                ?.showSalesRetailItems == true ||
            Get
                .put(LoginController())
                .user
                .data
                ?.showSalesRetailDiscountTypes ==
                true)
      },
      {
        'text': LocaleKeys.customClearance.tr,
        'icon':  'assets/images/cc.png',
        'value':  'customClearance',
        'isVisible': true
      },
      {'text': LocaleKeys.settings.tr,
        'icon': 'assets/images/setting_new.png',
        'value': 'settings',
        'isVisible': true},
      {
        'text': LocaleKeys.logOff.tr,
        'icon': 'assets/images/logout.png',
        'value': 'logOff',
        'isVisible': true
      },
    ];

    var controller = Get.put(HomeController());
    final login = Get.put(LoginController());
    return Obx(
        ()=> FocusedMenuHolder(
        menuWidth: MediaQuery.of(context).size.width * 0.5,
        blurSize: 0.0,
        menuItemExtent: 40,

        menuBoxDecoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
          //duration: Duration(milliseconds: 100),
        animateMenuItems: true,
        blurBackgroundColor: Colors.black54,
        openWithTap: true,
        onPressed: () {},

        menuItems: _menuItems.where((element) => element['isVisible'] == true).map((item) {
          return FocusedMenuItem(
            title: Row(
              children: [
                Image.asset(
                  item['icon'],
                  fit: BoxFit.fill,
                  width: 25,
                  height: 25,
                  color: controller.selectedItem.value == item['value'] ? Colors.blue : Colors.grey,
                ),
                const SizedBox(
                  width: 25,
                ),
                Text(item['text'], style: const TextStyle(
                  fontSize: 14,
                ),),
              ],
            ),
            backgroundColor: Colors.white,

            onPressed: () {

                controller.selectedItem.value = item['value'];// Update selected item

                log('selected = ${controller.selectedItem.value}');
                log('item = ${item['value']}');

                ////////////////////
                controller.updateIcon(item['icon'], item['text']);
                controller.salesInvoice.value = false;
                controller.salesItems.value = false;
                controller.salesItemsGroup.value = false;
                controller.salesCustomer.value = false;
                controller.salesCustomerGroups.value = false;
                controller.salesProductUnit.value = false;
                controller.salesItems.value = false;
                controller.salesItemsGroup.value = false;
                controller.salesdiscountType.value = false;

                if (item['text'] == LocaleKeys.transport.tr) {

                  //option['isSelected'] = true ;
                  log('transport selected............');
                  controller.onPressSystem();
                  controller.sales.value = false;
                  controller.customClearance.value = false;
                  controller.jobOperations.value = false;
                  controller.jobViews.value = false;
                  controller.indexSystem.value = 0;
                  controller.settings.value = false;
                  controller.transport.value = true;
                  controller.showWayBillDetails.value = false;
                  ////////////////
                  controller.currentNotific.value = false;
                  controller.notificLog.value = false;
                  controller.money.value = false;
                  ///////////////
                  controller.solfa.value = false;
                  controller.holiday.value = false;
                  controller.auzonat.value = false;
                  controller.checkIn.value = false;
                  controller.depayPermission.value = false;
                  controller.departurePermission.value = false;
                  controller.absentPermission.value = false;

                  ////////////
                  controller.addRequestForSolfa.value = false;
                  controller.logsForSolfa.value = false;
                  controller.accountsKahfForSolfa.value = false;

                  ///////////////
                  controller.addRequestForHoliday.value = false;
                  controller.logsForHoliday.value = false;
                  controller.accountsKahfForHoliday.value = false;
                }
                else if (item['text'] == LocaleKeys.humanResource.tr) {
                  //option['isSelected'] = true ;
                  log('humanResource selected............');
                  controller.onPressSystem();

                  controller.transport.value = false;
                  controller.jobOperations.value = false;
                  controller.jobViews.value = false;
                  controller.customClearance.value = false;
                  controller.indexSystem.value = 1;
                  controller.sales.value = false;
                  controller.settings.value = false;
                  controller.hr.value = true;
                  controller.showWayBillDetails.value = false;
                  ///////////
                  controller.currentNotific.value = false;
                  controller.notificLog.value = false;
                  controller.money.value = false;
                  ////////////
                  controller.addRequestForSolfa.value = false;
                  controller.logsForSolfa.value = false;
                  controller.accountsKahfForSolfa.value = false;
                  ////////
                  controller.addRequestForHoliday.value = false;
                  controller.logsForHoliday.value = false;
                  controller.accountsKahfForHoliday.value = false;
                }
                else if (item['text'] == LocaleKeys.sales.tr) {
                  //option['isSelected'] = true ;
                  log('sales selected............');

                  controller.onPressSystem();
                  controller.transport.value = false;
                  controller.jobOperations.value = false;
                  controller.jobViews.value = false;
                  controller.customClearance.value = false;
                  controller.indexSystem.value = 2;
                  controller.hr.value = false;
                  controller.settings.value = false;
                  controller.sales.value = false;
                  controller.showWayBillDetails.value = false;
                  ///////////
                  controller.currentNotific.value = false;
                  controller.notificLog.value = false;
                  controller.money.value = false;
                  ////////////
                  controller.addRequestForSolfa.value = false;
                  controller.logsForSolfa.value = false;
                  controller.accountsKahfForSolfa.value = false;
                  ////////
                  controller.addRequestForHoliday.value = false;
                  controller.logsForHoliday.value = false;
                  controller.accountsKahfForHoliday.value = false;
                  controller.sales.value = true;
                }
                else if (item['text'] == LocaleKeys.customClearance.tr) {
                  log('CC selected............');
                  controller.onPressSystem();
                  controller.sales.value = false;
                  controller.transport.value = false;
                  controller.hr.value = false;
                  controller.indexSystem.value = 0;
                  controller.settings.value = false;
                  controller.transport.value = false;
                  controller.showWayBillDetails.value = false;
                  ////////////////
                  controller.currentNotific.value = false;
                  controller.notificLog.value = false;
                  controller.money.value = false;
                  ///////////////
                  controller.solfa.value = false;
                  controller.holiday.value = false;
                  controller.auzonat.value = false;
                  controller.checkIn.value = false;
                  controller.depayPermission.value = false;
                  controller.departurePermission.value = false;
                  controller.absentPermission.value = false;

                  ////////////
                  controller.addRequestForSolfa.value = false;
                  controller.logsForSolfa.value = false;
                  controller.accountsKahfForSolfa.value = false;

                  ///////////////
                  controller.addRequestForHoliday.value = false;
                  controller.logsForHoliday.value = false;
                  controller.accountsKahfForHoliday.value = false;
                  controller.customClearance.value = true;
                }
                else if (item['text'] == LocaleKeys.settings.tr) {
                  // option['isSelected'] = true ;

                  log('settings selected............');

                  controller.onPressSystem();
                  controller.transport.value = false;
                  controller.jobOperations.value = false;
                  controller.jobViews.value = false;
                  controller.customClearance.value = false;
                  controller.indexSystem.value = 3;
                  controller.hr.value = false;
                  controller.settings.value = true;
                  controller.sales.value = false;
                  controller.showWayBillDetails.value = false;
                  ///////////
                  controller.currentNotific.value = false;
                  controller.notificLog.value = false;
                  controller.money.value = false;
                  ////////////
                  controller.addRequestForSolfa.value = false;
                  controller.logsForSolfa.value = false;
                  controller.accountsKahfForSolfa.value = false;
                  ////////
                  controller.addRequestForHoliday.value = false;
                  controller.logsForHoliday.value = false;
                  controller.accountsKahfForHoliday.value = false;
                  controller.sales.value = false;
                }
                else if (item['text'] == LocaleKeys.logOff.tr) {
                  //option['isSelected'] = true ;
                  log('logOff selected............');

                  controller.onPressSystem();
                  controller.customClearance.value = false;
                  controller.jobViews.value = false;
                  controller.jobOperations.value = false;
                  controller.transport.value = false;
                  controller.hr.value = false;
                  controller.indexSystem.value = 4;
                  controller.settings.value = false;
                  controller.settings.value = false;
                  controller.sales.value = false;
                  controller.showWayBillDetails.value = false;
                  ///////////
                  controller.currentNotific.value = false;
                  controller.notificLog.value = false;
                  controller.money.value = false;
                  ////////////
                  controller.addRequestForSolfa.value = false;
                  controller.logsForSolfa.value = false;
                  controller.accountsKahfForSolfa.value = false;
                  ////////
                  controller.addRequestForHoliday.value = false;
                  controller.logsForHoliday.value = false;
                  controller.accountsKahfForHoliday.value = false;
                  controller.sales.value = false;
                  QuickAlert.show(
                    context: context,
                    title: '',
                    type: QuickAlertType.warning,
                    barrierDismissible: false,
                    text: ' ${LocaleKeys.makeLogOut.tr}',
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
                      login.loginPinCodeController.clear();
                      Get.offAllNamed(Routes.LOGINPIN);

                      bool auth =
                      await login
                          .authenticateWithFingermentWitoutcontext();
                      if (auth) {
                        login.readFile().then((value) {

                          login.loginPINCode(
                              value.userName!,
                              value.password!,
                              value.companyCode!,
                              Get
                                  .find<LanguageController>()
                                  .selectedLanguage
                                  ?.id ??
                                  2);
                        });
                      } else {
                        return;
                      }
                    },
                    onCancelBtnTap: () => Get.back(),
                  );
                }
                },
          );
        }).toList(),
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              controller.icon.value,
              fit: BoxFit.fill,
              width: 25,
              height: 25,
              color: iconColor,
            ),
            const SizedBox(
              width: 5,
            ),
            Obx(
                  () =>
                  Expanded(
                    child: Text(
                      controller.label.value,
                      style:
                      const TextStyle(
                          fontSize: 14, fontWeight: FontWeight
                          .bold),
                    ),
                  ),
            )
          ],
        ),

      ),
    );
  }
}
