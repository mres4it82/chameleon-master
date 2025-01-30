import 'package:chameleon/app/modules/home/controllers/customclearance/customclearance_controller.dart';
import 'package:chameleon/app/modules/home/model/customclearance/JobModel.dart';
import 'package:chameleon/app/modules/home/model/customclearance/JobOperationsModel.dart';
import 'package:chameleon/app/modules/login/controllers/login_controller.dart';
import 'package:chameleon/generated/locales.g.dart';
import 'package:chameleon/global/constants/constants.dart';
import 'package:chameleon/global/controllers/helper_methods.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class JobOperationPage extends StatelessWidget  {
  final JobModel job;


  JobOperationPage({super.key, required this.job});  // تمرير ScrollController من الـ Constructor


  @override
  Widget build(BuildContext context) {
    final CustomClearanceController customClearanceController = Get.put(CustomClearanceController());
    customClearanceController.getOperationRelatedJob(job.id);

    return Obx(() {
      return Container(
        color: Colors.white,
        child: Stack(
          children: [
            customClearanceController.JobOperations.isEmpty
                ? ConstrainedBox(
              constraints: BoxConstraints(minHeight: 200),
              child: FutureBuilder(
                future: Future.delayed(Duration(seconds: 1), () => LocaleKeys.noOperations.tr),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasData) {
                    return Center(
                      child: Text(
                        snapshot.data!,
                        style: TextStyle(fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                    );
                  } else {
                    return Center(
                      child: Text(
                        "Error loading data",
                        style: TextStyle(fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                    );
                  }
                },
              ),
            )
                : SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: [
                  DataColumn(label: Text("")),
                  DataColumn(label: SizedBox(width: 3)),
                  DataColumn(label: SizedBox(width: 3)),
                  DataColumn(label: SizedBox(width: 3)),
                ],
                rows: List.generate(
                  customClearanceController.JobOperations.length,
                      (index) => DataRow(
                    cells: [
                      DataCell(Text(
                        LanguageUtils.isRtl()
                            ? customClearanceController.JobOperations[index].operation.nameA
                            : customClearanceController.JobOperations[index].operation.nameE,
                      )),
                      DataCell(Text(customClearanceController.JobOperations[index].deliveryOrBayanNo.toString())),
                      DataCell(Text(customClearanceController.JobOperations[index].createdDate.toString())),
                      DataCell(
                        InkWell(
                          onTap: () {
                            JobOperationsModel jobOperation = customClearanceController.JobOperations[index];
                            Get.dialog(JobOperationDialog(jobOperation: jobOperation));
                          },
                          child: Icon(Icons.delete_outline_sharp, size: 30, color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: LanguageUtils.isRtl() ? Alignment.topLeft : Alignment.topRight,
              child: InkWell(
                onTap: () async {
                  await customClearanceController.getAllOperations();
                  _addOperationDialog(job.id);
                },
                child: Container(
                  padding: EdgeInsets.all(8),
                  width: 50,
                  height: 50,
                  alignment: Alignment.center,
                  child: Icon(Icons.add, size: 35, color: iconColor),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }


  void _addOperationDialog(int jobId) {
    final CustomClearanceController customClearanceController = Get.find<CustomClearanceController>();
    final TextEditingController _noteController = TextEditingController();
    final TextEditingController _bayanController = TextEditingController();
    final Rx<int?> operationIdSelected = Rx<int?>(null);
    final login = Get.put(LoginController());

    List<Map<String, dynamic>> data = [];

    data = customClearanceController.operations
        .map((operation) => operation.toMap())
        .toList();


    showModalBottomSheet(
      context: Get.context!,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        return Center(
          child: Container(
            height: 370,
            width: MediaQuery.of(context).size.width * 0.9,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),

            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  LocaleKeys.addOperation.tr,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
              Autocomplete<Map<String, dynamic>>(
                optionsBuilder: (TextEditingValue textEditingValue) {
                  return data.where((element) =>
                  element["nameE"]
                      .toString()
                      .toLowerCase()
                      .contains(textEditingValue.text.toLowerCase()) ||
                      element["nameA"]
                          .toString()
                          .toLowerCase()
                          .contains(textEditingValue.text.toLowerCase()));
                },
                displayStringForOption: (Map<String, dynamic> option) =>
                LanguageUtils.isRtl() ? option["nameA"] : option["nameE"],
                onSelected: (Map<String, dynamic> selection) {
                  operationIdSelected.value = selection["id"];
                  print("Selected ID: $operationIdSelected");
                },
                fieldViewBuilder: (BuildContext context, TextEditingController textEditingController,
                    FocusNode focusNode, VoidCallback onFieldSubmitted) {
                  return Obx(() =>
                      Stack(
                        alignment: LanguageUtils.isRtl() ? Alignment.centerLeft : Alignment.centerRight,
                        children: [
                          TextField(
                            textDirection: LanguageUtils.getTextDirection(),
                            controller: textEditingController,
                            focusNode: focusNode,
                            decoration: InputDecoration(
                              hintText: LocaleKeys.operations.tr,
                              hintStyle: TextStyle(color: Colors.grey),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: BorderSide(
                                  color: Colors.white54,
                                  width: 2.0,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: BorderSide(
                                  color: Colors.black12,
                                  width: 2.0,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: BorderSide(
                                  color: iconColor,
                                  width: 2.0,
                                ),
                              ),
                              contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                            ),
                          ),
                          if (textEditingController.text.isNotEmpty || operationIdSelected.value != null)
                            Positioned(
                              right: LanguageUtils.isRtl() ? null : 10.0,
                              left: LanguageUtils.isRtl() ? 10.0 : null,
                              top: 0,
                              bottom: 0,
                              child: IconButton(
                                icon: Icon(Icons.clear),
                                onPressed: () {
                                  textEditingController.clear();
                                  operationIdSelected.value = null; // Reset selected value if needed
                                },
                              ),
                            ),
                        ],
                      ),
                  );
                },
                optionsViewBuilder: (BuildContext context, AutocompleteOnSelected<Map<String, dynamic>> onSelected,
                    Iterable<Map<String, dynamic>> options) {
                  return Align(
                    alignment: Alignment.topLeft,
                    child: Material(
                      elevation: 4.0,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxHeight: 200, // تحديد ارتفاع القائمة
                          maxWidth: MediaQuery.of(context).size.width * 0.8, // تحديد العرض بالنسبة للصندوق
                        ),
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: options.length,
                          itemBuilder: (BuildContext context, int index) {
                            final Map<String, dynamic> option = options.elementAt(index);
                            return ListTile(
                              title: Text(LanguageUtils.isRtl() ? option["nameA"] : option["nameE"]),
                              onTap: () {
                                onSelected(option);
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  );
                },
              ),

                // Obx(() {
                //   return DropdownButton<int>(
                //     isExpanded: true,
                //     value: customClearanceController.selectedDayId.value == 0
                //         ? null
                //         : customClearanceController.selectedDayId.value,
                //     hint: Text("Select a Day"),
                //     onChanged: (int? newId) {
                //       if (newId != null) {
                //         // تحديث selectedDayId وقيمة selectedDay بناءً على id المختار
                //         customClearanceController.selectedDayId.value = newId;
                //         customClearanceController.selectedDay.value =
                //         customClearanceController.days.firstWhere((day) => int.parse(day['id']!) == newId)['name_en']!;
                //         print("Selected Day: ${customClearanceController.selectedDay.value}");
                //         print("Selected Day ID: ${customClearanceController.selectedDayId.value}");
                //       }
                //     },
                //     items: customClearanceController.days.map((day) {
                //       return DropdownMenuItem<int>(
                //         value: int.parse(day['id']!), // استخدام id كقيمة
                //         child: Text("${day['name_en']} - ${day['name_ar']}"), // عرض الاسم باللغتين
                //       );
                //     }).toList(),
                //   );
                // }),

                SizedBox(height: 20),
                TextField(
                  controller: _bayanController,
                  decoration: InputDecoration(
                    hintText: LocaleKeys.customBayan.tr,
                    hintStyle: TextStyle(color: Colors.grey), // لون النص عند وضع المؤشر
                    filled: true,
                    fillColor: Colors.white, // تحديد لون الخلفية
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0), // جعل الحواف مستديرة أكثر
                      borderSide: BorderSide(
                        color: Colors.white54 , // لون الحد الخارجي
                        width: 2.0, // سمك الحدود
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(
                        color: Colors.black12, // لون الحد عند التفاعل مع النص
                        width: 2.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(
                        color: Colors.black12, // لون الحد عند التركيز على النص
                        width: 2.0,
                      ),
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0), // تحسين المسافات داخل الـ TextField
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: _noteController,
                  decoration: InputDecoration(
                    hintText: LocaleKeys.note.tr,
                    hintStyle: TextStyle(color: Colors.grey), // لون النص عند وضع المؤشر
                    filled: true,
                    fillColor: Colors.white, // تحديد لون الخلفية
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0), // جعل الحواف مستديرة أكثر
                      borderSide: BorderSide(
                        color: Colors.white54 , // لون الحد الخارجي
                        width: 2.0, // سمك الحدود
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(
                        color: Colors.black12, // لون الحد عند التفاعل مع النص
                        width: 2.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(
                        color: Colors.black12, // لون الحد عند التركيز على النص
                        width: 2.0,
                      ),
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0), // تحسين المسافات داخل الـ TextField
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: ()async{
                        var data = {
                          "jobId": jobId,
                          "operationId": operationIdSelected.value,
                          "dayId":0,
                          "deliveryOrBayanNo": _bayanController.text,
                          "notes": _noteController.text,
                          "createUid": login.user.data!.userId?.toInt(),
                          "companyId":0,
                          "branchId":0
                        };

                        InsertJobOperationsDTO insertOperationDto =
                        InsertJobOperationsDTO.fromJson(data);
                        Get.back();
                        await customClearanceController.insertJobOperations(insertOperationDto);

                      },
                      child: Icon(Icons.check_circle,color: Colors.green,size: 50,),

                    ),
                    InkWell(
                      onTap: (){
                        Get.back();
                      },
                      child: Icon(Icons.cancel, color: Colors.red,size: 50,), // أيقونة خطأ

                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

}



class JobOperationDialog extends StatelessWidget {
  final JobOperationsModel jobOperation;
  final CustomClearanceController customClearanceController = Get.put(CustomClearanceController());

  JobOperationDialog({super.key, required this.jobOperation});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(

      title: Text(LocaleKeys.operations.tr),
      content:Container(
        height: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("JobCode: ${jobOperation.job.code}",style: TextStyle(color: Colors.blueAccent),),
            SizedBox(height: 15,),
            Text(LanguageUtils.isRtl()
                ?" ${jobOperation.operation.nameA}"
                :" ${jobOperation.operation.nameE}"),
            SizedBox(height: 15,),
            Text("created : ${jobOperation.createdDate}"),
          ],
        ),
      ),
      actions: [
        Container(
          child: Row(

            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                style: TextButton.styleFrom(backgroundColor:Colors.red),
                onPressed: () {
                  _confirmDialog(jobOperation.jobId,jobOperation.operationId);
                },
                child: Text(LocaleKeys.delete.tr),
              ),
              TextButton(
                onPressed: () => Get.back(),
                child: Text(LocaleKeys.close.tr,style: TextStyle(color: Colors.white),),
              ),
            ],
          ),
        ),


      ],
    );


  }

  void _confirmDialog(int jobId,int operationId){
    Get.defaultDialog(
        title: "Are you sure remove this operation?",
        actions: [
          TextButton(
            style: TextButton.styleFrom(backgroundColor:Colors.red),
            onPressed: () async {

              int countDialogs=2;
              while ((Get.isDialogOpen ?? false)  && countDialogs > 0) {
                Get.back();
                countDialogs--;
              }
              await customClearanceController.removeOperation(jobId, operationId);

            },
            child: Text(LocaleKeys.ok.tr),
          ),
          TextButton(
            onPressed: () => Get.back(),
            child: Text(LocaleKeys.cancel.tr,style: TextStyle(color: Colors.white),),
          ),
        ]
    );
  }



}