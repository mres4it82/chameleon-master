import 'package:flutter/material.dart';

class UnitsStockProduct {
  UnitsStockProduct({
      this.id = 0,
      this.productId = 0,
      this.unitId = 0,
      this.isBaseUnit = false,
      this.isDefault = false,
      this.rate = 0,
      this.barCode = '',
      this.productName = '',
      this.unitName = '',
      this.productNameWithCode = '',
      this.unitNameWithCode = '',}) : unitcontroller = TextEditingController(text: unitNameWithCode);

  UnitsStockProduct.fromJson(dynamic json) {
    id = json['id'];
    productId = json['productId'];
    unitId = json['unitId'];
    isBaseUnit = json['isBaseUnit'];
    isDefault = json['isDefault'];
    rate = json['rate'];
    barCode = json['barCode'];
    productName = json['productName'];
    unitName = json['unitName'];
    productNameWithCode = json['productNameWithCode'];
    unitNameWithCode = json['unitNameWithCode'];
  }
  num? id = 0;
  num? productId = 0;
  num? unitId = 0;
  bool? isBaseUnit = false;
  bool? isDefault = false;
  num? rate = 0;
  String? barCode = '';
  String? productName = '';
  String? unitName = '';
  String? productNameWithCode = '';
  String? unitNameWithCode = '';
  TextEditingController? unitcontroller;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['productId'] = productId;
    map['unitId'] = unitId;
    map['isBaseUnit'] = isBaseUnit;
    map['isDefault'] = isDefault;
    map['rate'] = rate;
    map['barCode'] = barCode;
    map['productName'] = productName;
    map['unitName'] = unitName;
    map['productNameWithCode'] = productNameWithCode;
    map['unitNameWithCode'] = unitNameWithCode;
    return map;
  }

}