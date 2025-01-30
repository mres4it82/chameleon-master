class OperationModel{
  final int id;
  final int jobId;
  final int operationId;
  final String transactDateGregi;
  final String? transactDateHijri;
  final int? createUid;
  final String createDate;
  final String? notes;

  OperationModel({
    required this.id,
    required this.jobId,
    required this.operationId,
    required this.transactDateGregi,
    this.transactDateHijri,
    this.createUid,
    required this.createDate,
    this.notes
  });

  // من أجل تحويل Map إلى JobModel
  factory OperationModel.fromJson(Map<String, dynamic> json) {
    return OperationModel(
      id: json['id'] ?? 0,
      jobId: json['jobId'] ?? 0,
      operationId: json['operationId'] ?? 0,
      transactDateGregi: json['transactDateGregi'] ?? '',
      transactDateHijri: json['transactDateHijri'],
      createUid: json['createUid']??0,
      createDate: json['createDate']??'',
      notes: json['notes'],
    );
  }

  // من أجل تحويل JobModel إلى Map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'jobId': jobId,
      'operationId': operationId,
      'transactDateGregi': transactDateGregi,
      'transactDateHijri': transactDateHijri,
      'createUid': createUid,
      'createDate': createDate,
      'notes': notes,
    };
  }
}