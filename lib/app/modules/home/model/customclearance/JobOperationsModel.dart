class JobOperationsModel {
  int id;
  int jobId;
  int operationId;
  String transactDateGregi;
  String? transactDateHijri;
  String? deliveryOrBayanNo;
  String? notes;
  int?createUid;
  String? createDate;
  String? createdDate;
  dynamic roadNo;
  Job job;
  Operation operation;

  JobOperationsModel({
    required this.id,
    required this.jobId,
    required this.operationId,
    required this.transactDateGregi,
    this.transactDateHijri,
    this.deliveryOrBayanNo,
    this.notes,
    this.createUid,
    this.createDate,
    this.createdDate,
    this.roadNo,
    required this.job,
    required this.operation,
  });

  factory JobOperationsModel.fromJson(Map<String, dynamic> json) {
    return JobOperationsModel(
      id: json['id'],
      jobId: json['jobId'],
      operationId: json['operationId'],
      transactDateGregi: json['transactDateGregi'],
      transactDateHijri: json['transactDateHijri'],
      deliveryOrBayanNo: json['deliveryOrBayanNo']??'',
      notes: json['notes']??'',
      createUid: json['createUid'],
      createDate: json['createDate'],
      roadNo: json['roadNo'],
      job: Job.fromJson(json['job']),
      operation: Operation.fromJson(json['operation']),
      createdDate: json['createdDate'],
    );
  }
}

class Job {
  int id;
  int companyId;
  int branchId;
  int financialYearId;
  int jobTypeId;
  String code;
  String transactDateGregi;
  String transactDateHijri;
  int customerId;
  dynamic chargePortId;
  dynamic arrivalPortId;
  String customerReference;
  String masterBlno;
  String houseBlno;
  String? customerNameE;
  String? customerNameA;

  Job({
    required this.id,
    required this.companyId,
    required this.branchId,
    required this.financialYearId,
    required this.jobTypeId,
    required this.code,
    required this.transactDateGregi,
    required this.transactDateHijri,
    required this.customerId,
    this.chargePortId,
    this.arrivalPortId,
    required this.customerReference,
    required this.masterBlno,
    required this.houseBlno,
    this.customerNameE,
    this.customerNameA,
  });

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      id: json['id'],
      companyId: json['companyId'],
      branchId: json['branchId'],
      financialYearId: json['financialYearId'],
      jobTypeId: json['jobTypeId'],
      code: json['code'],
      transactDateGregi: json['transactDateGregi'],
      transactDateHijri: json['transactDateHijri'],
      customerId: json['customerId'],
      chargePortId: json['chargePortId'],
      arrivalPortId: json['arrivalPortId'],
      customerReference: json['customerReference'],
      masterBlno: json['masterBlno'],
      houseBlno: json['houseBlno'],
      customerNameE: json['customerNameE'],
      customerNameA: json['customerNameA'],
    );
  }
}

class Operation {
  int id;
  int companyId;
  String code;
  String nameA;
  String nameE;
  bool isInternal;
  dynamic notes;
  dynamic createUid;
  dynamic createDate;
  String color;
  int? sequenceNo;


  Operation({
    required this.id,
    required this.companyId,
    required this.code,
    required this.nameA,
    required this.nameE,
    required this.isInternal,
    this.notes,
    this.createUid,
    this.createDate,
    required this.color,
    this.sequenceNo,
  });

  factory Operation.fromJson(Map<String, dynamic> json) {
    return Operation(
      id: json['id'] ?? 0,
      companyId: json['companyId'] ?? 0,
      code: json['code']?.toString() ?? '',
      nameA: json['nameA']?.toString() ?? '',
      nameE: json['nameE']?.toString() ?? '',
      isInternal: json['isInternal'] ?? false,
      notes: json['notes'],
      createUid: json['createUid'],
      createDate: json['createDate'],
      color: json['color']?.toString() ?? '',
      sequenceNo: json['sequenceNo'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "companyId": companyId,
      "code": code,
      "nameA": nameA,
      "nameE": nameE,
      "isInternal": isInternal,
      "notes": notes,
      "createUid": createUid,
      "createDate": createDate,
      "color": color,
      "sequenceNo": sequenceNo,
    };
  }
}

// Insert Job Operations

class InsertJobOperationsDTO {
  int companyId;
  int branchId;
  int jobId;
  int operationId;
  int dayId;
  String? deliveryOrBayanNo;
  String? notes;
  int createUid;

  // Constructor
  InsertJobOperationsDTO({
    required this.companyId,
    required this.branchId,
    required this.jobId,
    required this.operationId,
    required this.dayId,
    required this.createUid,
    this.notes,
    this.deliveryOrBayanNo
  }) ;


  // Factory constructor لتحويل الـ JSON إلى كائن DTO
  factory InsertJobOperationsDTO.fromJson(Map<String, dynamic> json) {
    return InsertJobOperationsDTO(
      companyId: json['companyId'],
      branchId: json['branchId'],
      jobId: json['jobId'],
      operationId: json['operationId'],
      dayId: json['dayId'],
      createUid: json['createUid'],
      notes: json['notes'],
      deliveryOrBayanNo: json['deliveryOrBayanNo'],
    );
  }

  // تحويل الـ DTO إلى JSON
  Map<String, dynamic> toJson() {
    return {
      'companyId': companyId,
      'branchId': branchId,
      'jobId': jobId,
      'operationId': operationId,
      'dayId': dayId,
      'createUid': createUid,
      'notes': notes,
      'deliveryOrBayanNo': deliveryOrBayanNo,
    };
  }
}

