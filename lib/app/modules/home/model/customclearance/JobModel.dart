class JobModel {
  final int id;
  final int companyId;
  final int branchId;
  final int financialYearId;
  final int jobTypeId;
  final String code;
  final String transactDateGregi;
  final String? transactDate;
  final String? transactDateHijri;
  final int customerId;
  final int? chargePortId;
  final int? arrivalPortId;
  final String customerReference;
  final String masterBlno;
  final String? houseBlno;
  final String customerNameE;
  final String customerNameA;

  // Constructor
  JobModel({
    required this.id,
    required this.companyId,
    required this.branchId,
    required this.financialYearId,
    required this.jobTypeId,
    required this.code,
    required this.transactDateGregi,
    this.transactDate,
    this.transactDateHijri,
    required this.customerId,
    this.chargePortId,
    this.arrivalPortId,
    required this.customerReference,
    required this.masterBlno,
    this.houseBlno,
    required this.customerNameE,
    required this.customerNameA,
  });

  // من أجل تحويل Map إلى JobModel
  factory JobModel.fromJson(Map<String, dynamic> json) {
    return JobModel(
      id: json['id'] ?? 0,
      companyId: json['companyId'] ?? 0,
      branchId: json['branchId'] ?? 0,
      financialYearId: json['financialYearId'] ?? 0,
      jobTypeId: json['jobTypeId'] ?? 0,
      code: json['code'] ?? '',
      transactDateGregi: json['transactDateGregi'] ?? '',
      transactDate: json['transactDate'] ?? '',
      transactDateHijri: json['transactDateHijri'],
      customerId: json['customerId'] ?? 0,
      chargePortId: json['chargePortId'],
      arrivalPortId: json['arrivalPortId'],
      customerReference: json['customerReference'] ?? '',
      masterBlno: json['masterBlno'] ?? '',
      houseBlno: json['houseBlno'],
      customerNameE: json['customerNameE'] ?? '',
      customerNameA: json['customerNameA'] ?? '',
    );
  }

  // من أجل تحويل JobModel إلى Map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'companyId': companyId,
      'branchId': branchId,
      'financialYearId': financialYearId,
      'jobTypeId': jobTypeId,
      'code': code,
      'transactDateGregi': transactDateGregi,
      'transactDate': transactDate,
      'transactDateHijri': transactDateHijri,
      'customerId': customerId,
      'chargePortId': chargePortId,
      'arrivalPortId': arrivalPortId,
      'customerReference': customerReference,
      'masterBlno': masterBlno,
      'houseBlno': houseBlno,
      'customerNameE': customerNameE,
      'customerNameA': customerNameA,
    };
  }
}

class JobWithLastOperationModel{
  final int id;
  final int companyId;
  final int branchId;
  final int financialYearId;
  final int? operationId;
  final String? operationNameA;
  final String? operationNameE;
  final String? operationColor;
  final int jobTypeId;
  final String jobTypeNameE;
  final String jobTypeNameA;
  final String code;
  final String transactDateGregi;
  final String? transactDateHijri;
  final int customerId;
  final int? chargePortId;
  final int? arrivalPortId;
  final String? customerReference;
  final String? masterBlno;
  final String? houseBlno;
  final String customerNameE;
  final String customerNameA;

    JobWithLastOperationModel({
      required this.id,
      required this.companyId,
      required this.branchId,
      required this.financialYearId,
      this.operationId,
      this.operationNameA,
      this.operationNameE,
      this.operationColor,
      required this.jobTypeId,
      required this.jobTypeNameE,
      required this.jobTypeNameA,
      required this.code,
      required this.transactDateGregi,
      this.transactDateHijri,
      required this.customerId,
      this.chargePortId,
      this.arrivalPortId,
      this.customerReference,
      this.masterBlno,
      this.houseBlno,
      required this.customerNameE,
      required this.customerNameA,
  });

  factory JobWithLastOperationModel.fromJson(Map<String, dynamic> json) {
    return JobWithLastOperationModel(
      id: json['id'] ?? 0,
      companyId: json['companyId'] ?? 0,
      branchId: json['branchId'] ?? 0,
      financialYearId: json['financialYearId'] ?? 0,
      operationId: json['operationId'],
      operationNameA: json['operationNameA'],
      operationNameE: json['operationNameE'],
      operationColor: json['operationColor'],
      jobTypeId: json['jobTypeId']??0,
      jobTypeNameE: json['jobTypeNameE']??'',
      jobTypeNameA: json['jobTypeNameA']??'',
      code: json['code']??'',
      transactDateGregi: json['transactDateGregi']??'',
      transactDateHijri: json['transactDateHijri'],
      customerId: json['customerId']??0,
      chargePortId: json['chargePortId'],
      arrivalPortId: json['arrivalPortId'],
      customerReference: json['customerReference'],
      masterBlno: json['masterBlno'],
      houseBlno: json['houseBlno'],
      customerNameE: json['customerNameE']??'',
      customerNameA: json['customerNameA']??'',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'companyId': companyId,
      'branchId': branchId,
      'financialYearId': financialYearId,
      'jobTypeId': jobTypeId,
      'jobTypeNameE': jobTypeNameE,
      'jobTypeNameA': jobTypeNameA,
      'code': code,
      'transactDateGregi': transactDateGregi,
      'transactDateHijri': transactDateHijri,
      'customerId': customerId,
      'chargePortId': chargePortId,
      'arrivalPortId': arrivalPortId,
      'customerReference': customerReference,
      'masterBlno': masterBlno,
      'houseBlno': houseBlno,
      'customerNameE': customerNameE,
      'customerNameA': customerNameA,
      'operationId': operationId,
      'operationNameA': operationNameA,
      'operationNameE': operationNameE,
      'operationColor': operationColor,
    };
  }
}
