
import 'package:chameleon/app/modules/home/controllers/customclearance/customclearance_controller.dart';
import 'package:chameleon/app/modules/home/views/widget/customclearance/JobOperations/JobDetails.dart';
import 'package:chameleon/app/modules/home/views/widget/customclearance/JobOperations/JobOperationPage.dart';
import 'package:chameleon/generated/locales.g.dart';
import 'package:chameleon/global/constants/constants.dart';
import 'package:chameleon/global/controllers/helper_methods.dart';
import 'package:chameleon/global/controllers/language_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controllers/home_controller.dart';

class JobOperations extends GetView<HomeController> {

  @override
  Widget build(BuildContext context) {

    final customClearanceController = Get.put(CustomClearanceController());
    final TextEditingController _txtController = TextEditingController(text: customClearanceController.jobCodeSelected.value);


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
                      hintText:  LocaleKeys.search.tr,
                      prefixIcon: InkWell(
                        onTap: () async {
                          await customClearanceController.fetchJobs(_txtController.text);
                        },
                        child: Icon(Icons.search),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8), // زوايا مستديرة
                      ),
                    ),
                    onChanged: (value) {},
                    onSubmitted: (value) async {
                      await customClearanceController.fetchJobs(value);
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
          height: 270,
          padding: EdgeInsets.all(7),
          child: GridView.count(
            crossAxisCount: 3,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            children: List.generate(
              customClearanceController.jobs.length,
                  (index) => InkWell(
                onTap: () async {
                  customClearanceController.JobOperations.clear();
                  customClearanceController.jobSelected.value = customClearanceController.jobs[index];


                },
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: boxColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          customClearanceController.jobs[index].code,
                          style: const TextStyle(fontSize: 10, color: Colors.black, fontWeight: FontWeight.w800),
                        ),
                        Text(
                          LanguageUtils.isRtl()
                              ? customClearanceController.jobs[index].customerNameA
                              : customClearanceController.jobs[index].customerNameE,
                          style: const TextStyle(fontSize: 10, color: Colors.black, fontWeight: FontWeight.w800),
                        ),
                        Text(
                          customClearanceController.jobs[index].transactDateGregi.toString(),
                          style: const TextStyle(fontSize: 11, color: Colors.black, fontWeight: FontWeight.w800),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        )),

        SizedBox(height: 10,),

        Obx(() =>
        customClearanceController.jobSelected.value != null ?

        JobDetailsPage(job: customClearanceController.jobSelected.value)
            : Container(),
        ),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 4,
                    offset: Offset(2, 2),
                  ),
                ],
              ),
              margin: EdgeInsets.symmetric(horizontal: 6),
              padding: EdgeInsets.all(6),
              child: Text(
                LocaleKeys.operations.tr,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),

        SizedBox(height: 10,),

        // Job operation page
        Obx(() => customClearanceController.jobSelected.value != null
            ? JobOperationPage(job: customClearanceController.jobSelected.value)
            : Container()),
      ],
    );
  }
}