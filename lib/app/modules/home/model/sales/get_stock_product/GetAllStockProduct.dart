
import 'Data.dart';

class GetAllStockProduct {
  GetAllStockProduct({
      this.token, 
      this.data, 
      this.status, 
      this.message, 
      this.isSuccess,});

  GetAllStockProduct.fromJson(dynamic json) {
    token = json['token'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(StockProductList.fromJson(v));
      });
    }
    status = json['status'];
    message = json['message'];
    isSuccess = json['isSuccess'];
  }
  dynamic token;
  List<StockProductList>? data;
  num? status;
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