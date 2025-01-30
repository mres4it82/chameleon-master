import 'package:chameleon/app/modules/home/controllers/customclearance/customclearance_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:chameleon/app/modules/home/controllers/home_controller.dart';
import 'package:chameleon/generated/locales.g.dart';

enum CC_Screens{
  JobView_Screen,
  JobOperations_Screen,
}

class CustomClearanceMenu extends GetView<HomeController> {
  const CustomClearanceMenu({super.key});



  @override
  Widget build(BuildContext context) {
    CustomClearanceController _customClearanceController = Get.put(CustomClearanceController());


    // قائمة بيانات الصور والنصوص
    final List<Map<String, String>> ccItems = [
      {
        "image": "assets/images/JobView.png",
        "text": LocaleKeys.jobView.tr,
      },
      {
        "image": "assets/images/Job_Operation.png",
        "text": LocaleKeys.jobOperation.tr,
      },
    ];

    void resetControllerValues() {
      controller.settings.value = false;
      controller.hr.value = false;
      controller.salesInvoice.value = false;
      controller.salesCustomer.value = false;
      controller.salesItemsGroup.value = false;
      controller.salesItems.value = false;
      controller.salesdiscountType.value = false;
      controller.auzonat.value = false;
      controller.checkIn.value = false;
      controller.depayPermission.value = false;
      controller.departurePermission.value = false;
      controller.absentPermission.value = false;
      controller.editRequestForHoliday2.value = false;
      controller.expandedHolidayRequest.value = false;
      controller.expandedChenkInMonth.value = false;
      controller.expandedCheckIn.value = false;
      controller.expandedDelayPermission.value = false;
      controller.expandedabsencePermission.value = false;
      controller.expandedLoanStatment.value = false;
      controller.expandedAccountStatment.value = false;
      controller.expandedLDelayPermission.value = false;
      controller.expandedOrder.value = false;
      controller.expandedEarlyPermission.value = false;
      controller.expandedLEarlyPermission.value = false;
      controller.expandedOrderEPermission.value = false;
      controller.expandedLoanRequest.value = false;
      controller.addRequestForHoliday2.value = false;
      controller.editRequestForSolfa2.value = false;
      controller.addRequestForSolfa2.value = false;
      controller.editRequestForSolfa.value = false;
      controller.editRequestForHoliday.value = false;
      controller.addRequestForHoliday.value = false;
      controller.addRequestForSolfa.value = false;
      controller.showEmployeesLeaves.value = false;
      controller.showEmployeesDelayPermissionReq.value = false;
      controller.showEmployeesDelayPermission.value = false;
      controller.solfaRequest.value = false;
      controller.showAdvanceRequests.value = false;
      controller.showAdvanceDetails.value = false;
      controller.showLeaveRequests.value = false;
      controller.holidayRequest.value = false;
      controller.allHolidays.value = false;
      controller.logsForHoliday.value = false;
      controller.logsForSolfa.value = false;
      controller.accountsKahfForSolfa.value = false;
      controller.depayPermission.value = false;
      controller.checkIn.value = false;
      controller.absentPermission.value = false;
      controller.departurePermission.value = false;
      controller.depayPermission.value = false;
      controller.accountsKahfForSolfa.value = false;
      controller.jobViews.value = false;
      controller.jobOperations.value = false;

      _customClearanceController.jobCodeSelected.value = '';
    }

    return Container(
      height: 150,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: ccItems.length,
        itemBuilder: (context, index) {
          final item = ccItems[index];
          return InkWell(
            onTap: () async {
              resetControllerValues();

              if(CC_Screens.JobView_Screen.index == index)
              {
                await _customClearanceController.fetchJobWithLastOperation("");
                controller.jobViews.value = true;
              }
              else if(CC_Screens.JobOperations_Screen.index == index)
              {

                controller.jobOperations.value = true;
              }

              await _customClearanceController.fetchJobs("");
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Container(
                width: 120,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 250, 250, 250),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Column(
                  children: [
                    const Spacer(flex: 2),
                    SizedBox(
                      width: 70,
                      height: 70,
                      child: Image.asset(
                        item['image']!,
                        fit: BoxFit.fill,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      item['text']!,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                  ],
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(width: 8);
        },
      ),
    );
  }
}
