
import 'package:chameleon/app/modules/home/controllers/customclearance/customclearance_controller.dart';
import 'package:chameleon/app/modules/home/model/customclearance/JobModel.dart';
import 'package:chameleon/app/modules/home/views/widget/customclearance/JobOperations/JobDetails.dart';
import 'package:chameleon/app/modules/home/views/widget/customclearance/JobOperations/JobOperationPage.dart';
import 'package:chameleon/app/modules/home/views/widget/customclearance/JobOperations/ccjob_operations.dart';
import 'package:chameleon/generated/locales.g.dart';
import 'package:chameleon/global/constants/constants.dart';
import 'package:chameleon/global/controllers/helper_methods.dart';
import 'package:chameleon/global/controllers/language_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controllers/home_controller.dart';

class JobViews extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    final customClearanceController = Get.put(CustomClearanceController());
    final TextEditingController _txtController = TextEditingController();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GetBuilder<LanguageController>(
            builder: (languageController) {
              return Column(
                crossAxisAlignment: LanguageUtils.getCrossAxisAlignment(),
                textDirection: LanguageUtils.getTextDirection(),
                children: [
                  TextField(
                    controller: _txtController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: LocaleKeys.search.tr,
                      prefixIcon: InkWell(
                        onTap: () async {
                          await customClearanceController.fetchJobWithLastOperation(_txtController.text);
                        },
                        child: Icon(Icons.search),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onChanged: (value) {},
                    onSubmitted: (value) async {
                      await customClearanceController.fetchJobWithLastOperation(value);
                    },
                  ),
                ],
              );
            },
          ),
        ),

        // GridView and handling onTap with scroll action
        Obx(() => Container(
          color: Colors.white,
         // height: (customClearanceController.jobWithLastOperationModel.length / 3).ceil() * 60.0,
          padding: EdgeInsets.all(7),
          child: GridView.count(
            crossAxisCount: 3,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            children: List.generate(
              customClearanceController.jobWithLastOperationModel.length,
                  (index) => InkWell(
                onTap: () async {


                  String jobCode =  customClearanceController.jobWithLastOperationModel[index].code.toString();
                  customClearanceController.jobCodeSelected.value = jobCode;

                  int jobId = customClearanceController.jobWithLastOperationModel[index].id;
                  await customClearanceController.getCCJobById(jobId);
                  customClearanceController.jobSelected.value = new JobModel
                    (id: customClearanceController.jobWithLastOperationModel[index].id,
                      companyId: customClearanceController.jobWithLastOperationModel[index].companyId,
                      branchId: customClearanceController.jobWithLastOperationModel[index].branchId,
                      financialYearId: customClearanceController.jobWithLastOperationModel[index].financialYearId,
                      jobTypeId: customClearanceController.jobWithLastOperationModel[index].jobTypeId,
                      code: customClearanceController.jobWithLastOperationModel[index].code,
                      transactDateGregi: customClearanceController.jobWithLastOperationModel[index].transactDateGregi,
                      customerId: customClearanceController.jobWithLastOperationModel[index].customerId,
                      customerReference: customClearanceController.jobWithLastOperationModel[index].customerReference??'',
                      masterBlno: customClearanceController.jobWithLastOperationModel[index].masterBlno??'',
                      customerNameE: customClearanceController.jobWithLastOperationModel[index].customerNameE,
                      customerNameA: customClearanceController.jobWithLastOperationModel[index].customerNameA);

                  controller.jobViews.value = false;
                  controller.jobOperations.value = true;

                },
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: ColorFromHex.colorFromHex(customClearanceController.jobWithLastOperationModel[index].operationColor.toString()),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          customClearanceController.jobWithLastOperationModel[index].code,
                          style: const TextStyle(fontSize: 10, color: Colors.black, fontWeight: FontWeight.w800),
                        ),
                        Text(
                          LanguageUtils.isRtl()
                              ? customClearanceController.jobWithLastOperationModel[index].customerNameA
                              : customClearanceController.jobWithLastOperationModel[index].customerNameE,
                          style: const TextStyle(fontSize: 10, color: Colors.black, fontWeight: FontWeight.w800),
                        ),
                        Text(
                           customClearanceController.jobWithLastOperationModel[index].transactDateGregi.toString(),
                          style: const TextStyle(fontSize: 10, color: Colors.black, fontWeight: FontWeight.w800),
                        ),
                        Text(
                          customClearanceController.jobWithLastOperationModel[index].operationNameA.toString() != '' ?
                          LanguageUtils.isRtl() ?
                              customClearanceController.jobWithLastOperationModel[index].operationNameA.toString():
                              customClearanceController.jobWithLastOperationModel[index].operationNameE.toString()
                            :LocaleKeys.noOperations.tr,
                          style: const TextStyle(fontSize: 10, color: Colors.black, fontWeight: FontWeight.w800),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        )),




      ],
    );
  }
}