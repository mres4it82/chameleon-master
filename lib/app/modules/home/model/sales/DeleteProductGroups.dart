class DeleteProductGroups {
  DeleteProductGroups({
      this.token, 
      this.data, 
      this.status, 
      this.message, 
      this.isSuccess,});

  DeleteProductGroups.fromJson(dynamic json) {
    token = json['token'];
    data = json['data'];
    status = json['status'];
    message = json['message'];
    isSuccess = json['isSuccess'];
  }
  dynamic token;
  dynamic data;
  int? status;
  String? message;
  bool? isSuccess;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = token;
    map['data'] = data;
    map['status'] = status;
    map['message'] = message;
    map['isSuccess'] = isSuccess;
    return map;
  }

}