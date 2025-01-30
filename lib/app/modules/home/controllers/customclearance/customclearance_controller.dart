import 'dart:async';
import 'package:chameleon/app/modules/home/model/customclearance/JobModel.dart';
import 'package:chameleon/app/modules/home/model/customclearance/JobOperationsModel.dart';
import 'package:chameleon/global/constants/constants.dart' as urlPath;
import 'package:chameleon/global/controllers/helper_methods.dart';
import 'package:chameleon/global/controllers/helper_storage.dart';
import 'package:chameleon/global/networking/dio_helper.dart';
import 'package:get/get.dart';

class CustomClearanceController extends GetxController {
  DioHelper dio = DioHelper();
  RxList<JobModel> jobs = <JobModel>[].obs;
  RxList<JobWithLastOperationModel> jobWithLastOperationModel = <JobWithLastOperationModel>[].obs;
  Rx<String> jobCodeSelected = "".obs;

  Rx<JobModel> jobSelected =
      JobModel(id: 0, companyId: 0, branchId: 0,
          customerId: 0, financialYearId: 0,
          code: '', jobTypeId: 0, transactDateGregi: '',
          customerReference: '', masterBlno: ''
          , customerNameE: '', customerNameA: '').obs;

  RxList<JobOperationsModel> JobOperations = <JobOperationsModel>[].obs;
  RxList<Operation> operations = <Operation>[].obs;
  final userDataManager =  DataStorage();
  int companyId = 0;
  int branchId = 0;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    final data = userDataManager.getCompanyAndBranch();
    if (data != null) {
      companyId = data['companyId'] as int;
      branchId = data['branchId'] as int;
    }
    checkIfCompanyHasJobs(companyId);
    fetchJobWithLastOperation("");

  }


  // Api Requests
  Future<List<JobModel>> fetchJobs(String Code) async {
    try {
      var data = {
        'companyId': companyId,
        'branchId': branchId,
        'code': Code,
      };

      var response = await dio.postDataLogin(urlPath.getCCJobs, data);

      if (response != null && response.statusCode == 200 && response.data != null) {
        print("API Response: ${response.data}"); // طباعة الاستجابة للتحقق منها

        List<JobModel> jobModels = (response.data as List)
            .map((job) => JobModel.fromJson(job))
            .toList();
        jobs.clear();
        jobs.addAll(jobModels);
        return jobModels;
      } else {
        throw Exception('Failed to load jobs');
      }
    } catch (e) {
      print("Error fetching jobs: $e");
      throw Exception('Error fetching jobs: $e');
    }
  }


  // fetch Jobs with the last operation related with it
  Future<List<JobWithLastOperationModel>> fetchJobWithLastOperation(String code) async {
    try {
      var data = {
        'companyId': companyId,
        'branchId': branchId,
        'code': code,
      };



      var response = await dio.postDataLogin(
          "${urlPath.getJobWithLastOperation}?size=70",  data);

      if (response != null &&
          response.statusCode == 200 &&
          response.data != null) {
        print("API Response: ${response.data}");

        List<JobWithLastOperationModel> result = (response.data as List)
            .map((job) => JobWithLastOperationModel.fromJson(job))
            .toList();

        jobWithLastOperationModel.clear();
        jobWithLastOperationModel.addAll(result
            .where((idx) => idx.operationId != null && (idx.operationId ?? 0) > 0)
            .toList());


        return jobWithLastOperationModel;
      } else {
        throw Exception('Failed to load jobs');
      }
    } catch (e) {
      print("Error fetching jobs: $e");
      throw Exception('Error fetching jobs: $e');
    }
  }


  Future<void> getOperationRelatedJob(int jobId) async{
    print("jobId:  ${jobId}");
    try {
      var parms = {'jobId':jobId};
      var response = await dio.getData(urlPath.getOperationsByJobId, parms);
      if (response != null && response.statusCode == 200 && response.data != null) {
        List<JobOperationsModel> operations = (response.data as List)
            .map((operation) => JobOperationsModel.fromJson(operation))
            .toList();
        JobOperations.clear();
        JobOperations.addAll(operations);
      }
    }catch(e){
      print("Error fetching jobs: $e");
      throw Exception('Error fetching jobs: $e');
    }
  }


  Future<void> removeOperation(int jobId, int operationId) async {
    try {
      print("jobId: $jobId opera: $operationId");
      var parms = {'jobId': jobId, 'operationId': operationId};
      var response = await dio.getData(urlPath.removeOperation, parms);
      if (response != null && response.statusCode == 200 && response.data != null) {
        print("API Response: ${response.data}"); // طباعة الاستجابة للتحقق منها


        String textMessage = LanguageUtils.isRtl()
            ? 'تم حذف الاجراء بنجاح'
            :'Operation deleted successfully!';
        ShowMessage.showSuccessBottomSheet(MessageType.Success.index,textMessage);
        await getOperationRelatedJob(jobId);


      } else {
        String textMessage = LanguageUtils.isRtl()
            ? 'خطأ لم يتم حذف الاجراء'
            :'Failed to delete operation.';
        ShowMessage.showSuccessBottomSheet(MessageType.Failed.index,textMessage);
      }
    } catch (err) {
      print("Error fetching jobs: $err");

      ShowMessage.showSuccessBottomSheet(MessageType.Failed.index,'Error occurred: $err');
    }
  }


  Future<void> insertJobOperations(InsertJobOperationsDTO insertJobOperationsDTO) async {
    try {
      insertJobOperationsDTO.companyId = companyId;
      insertJobOperationsDTO.branchId = branchId;

      Map<String, dynamic> parms = insertJobOperationsDTO.toJson();

      var response = await dio.postDataLogin(urlPath.insertJobOperations, parms);
      if (response != null && response.statusCode == 200 ) {
        print("API Response: ${response}");



        String textMessage = LanguageUtils.isRtl()
            ? 'تم حفظ الإجراء'
            : 'Operation Inserted successfully!';
        ShowMessage.showSuccessBottomSheet(MessageType.Success.index,textMessage);

        await getOperationRelatedJob(insertJobOperationsDTO.jobId);



      } else {
        String textMessage = LanguageUtils.isRtl()
            ? 'خطأ في حفظ الاجراء'
            :'Failed to insert operation.';
        ShowMessage.showSuccessBottomSheet(MessageType.Failed.index,textMessage);
      }
    } catch (err) {
      ShowMessage.showSuccessBottomSheet(MessageType.Failed.index,"Error fetching jobs: $err");
    }
  }


  Future<void> getAllOperations() async{
    if(operations.length == 0) {
      try {
        var parms = {'companyId': companyId};
        var response = await dio.getData(urlPath.getAllOperations, parms);
        if (response != null && response.statusCode == 200 &&
            response.data != null) {


          operations.value  = (response.data as List)
              .map((item) => Operation.fromJson(item))
              .toList();


        }
      } catch (err) {
        print("Error during parsing operations: $err");

      }
    }
    Timer(Duration(seconds: 30),() { operations.clear();});
  }


  Future<JobModel> getCCJobById(int jobId) async{
    try {
      var parms = {'id':jobId};
      var response = await dio.getData(urlPath.getCCJobById, parms);

      var jobModel = JobModel.fromJson(response.data);

      print("................. ${jobModel.id}");
      jobs.clear();
      jobs.add(jobModel);
      return jobModel;
    }catch(e){
      print("Error fetching jobs: $e");
      throw Exception('Error fetching jobs: $e');
    }
  }

  Future<void> checkIfCompanyHasJobs(int id) async{
    try {
      print("object");
      var parms = {'id':id};
      var response = await dio.getData(urlPath.checkIfCompanyHasJobs, parms);

      var data = response.data;

    }catch(e){
      print("Error: $e");
      throw Exception('Error : $e');
    }
  }

// final List<Map<String, String>> days = [
//   {"id": "1", "name_en": "Sunday", "name_ar": "الأحد"},
//   {"id": "2", "name_en": "Monday", "name_ar": "الإثنين"},
//   {"id": "3", "name_en": "Tuesday", "name_ar": "الثلاثاء"},
//   {"id": "4", "name_en": "Wednesday", "name_ar": "الأربعاء"},
//   {"id": "5", "name_en": "Thursday", "name_ar": "الخميس"},
//   {"id": "6", "name_en": "Friday", "name_ar": "الجمعة"},
//   {"id": "7", "name_en": "Saturday", "name_ar": "السبت"},
// ];
//
// RxString selectedDay = "".obs;
// RxInt selectedDayId = 0.obs;
}