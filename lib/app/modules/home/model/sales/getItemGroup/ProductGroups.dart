import 'Data.dart';

class ProductGroups {
  ProductGroups({
    this.token,
    this.data,
    this.status,
    this.message,
    this.isSuccess,});


  List<DataProductGroups> getItemGroupsWithHasChildren(String searchKey) {
    return data!
        .where(
          (element) => element.groupNameWithCode!
              .toLowerCase()
              .contains(searchKey.toLowerCase()),
        )
        .where((element) => element.hasChildren == true)
        .toList();
  }

  List<DataProductGroups> getCustomersWithHasChildren(String searchKey) {
    return data!
        .where(
          (element) => element.groupNameWithCode!
              .toLowerCase()
              .contains(searchKey.toLowerCase()),
        )
        .toList();
  }

  DataProductGroups getGroupName(int id) {
    return data!.firstWhere((element) => element.id == id);
  }

  ProductGroups.fromJson(dynamic json) {
    token = json['token'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(DataProductGroups.fromJson(v));
      });
    }
    status = json['status'];
    message = json['message'];
    isSuccess = json['isSuccess'];
  }
  dynamic token;
  List<DataProductGroups>? data;
  int? status;
  String? message;
  bool? isSuccess;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = token;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    map['status'] = status;
    map['message'] = message;
    map['isSuccess'] = isSuccess;
    return map;
  }

}