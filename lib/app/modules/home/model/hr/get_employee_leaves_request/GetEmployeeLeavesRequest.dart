import 'Data.dart';

class GetEmployeeLeavesRequest {
  GetEmployeeLeavesRequest({
    this.data,
    this.status,
    this.message,
    this.endUserMessage,
    this.isSuccess,
    this.token,
  });

  GetEmployeeLeavesRequest.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(EmployeeLeavesRequest.fromJson(v));
      });
    }
    status = json['status'];
    message = json['message'];
    endUserMessage = json['endUserMessage'];
    isSuccess = json['isSuccess'];
    token = json['token'];
  }

  List<EmployeeLeavesRequest>? data;
  int? status;
  String? message;
  String? endUserMessage;
  bool? isSuccess;
  dynamic token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    map['status'] = status;
    map['message'] = message;
    map['endUserMessage'] = endUserMessage;
    map['isSuccess'] = isSuccess;
    map['token'] = token;
    return map;
  }
}
