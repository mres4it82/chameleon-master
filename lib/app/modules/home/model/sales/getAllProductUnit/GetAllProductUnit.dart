import 'Data.dart';

class GetAllProductUnit {
  GetAllProductUnit({
    this.token,
    this.data,
    this.status,
    this.message,
    this.isSuccess,
  });

  List<ProductUnitList> getAllProductUnit(String searchKey) {
    return data?.where(
          (element) {
            return element.unitNameWithCode
                    ?.toLowerCase()
                    .contains(searchKey.toLowerCase()) ??
                false;
          },
        ).toList() ??
        [];
  }

  GetAllProductUnit.fromJson(dynamic json) {
    token = json['token'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(ProductUnitList.fromJson(v));
      });
    }
    status = json['status'];
    message = json['message'];
    isSuccess = json['isSuccess'];
  }

  dynamic token;
  List<ProductUnitList>? data;
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
