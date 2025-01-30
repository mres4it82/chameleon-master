import 'Data.dart';

class GetAllDiscountType {
  GetAllDiscountType({
    this.token,
    this.data,
    this.status,
    this.message,
    this.isSuccess,
  });

  List<DiscountTypeList> getAllDiscountType(String searchKey) {
    return data?.where(
          (element) {
            return element.discountTypeNameWithCode
                    ?.toLowerCase()
                    .contains(searchKey.toLowerCase()) ??
                false;
          },
        ).toList() ??
        [];
  }

  GetAllDiscountType.fromJson(dynamic json) {
    token = json['token'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(DiscountTypeList.fromJson(v));
      });
    }
    status = json['status'];
    message = json['message'];
    isSuccess = json['isSuccess'];
  }

  dynamic token;
  List<DiscountTypeList>? data;
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
