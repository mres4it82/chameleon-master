class Units {
  Units({
      this.id, 
      this.productId, 
      this.unitId, 
      this.isBaseUnit, 
      this.isDefault, 
      this.rate, 
      this.barCode, 
      this.productName, 
      this.unitName, 
      this.productNameWithCode, 
      this.unitNameWithCode,});

  Units.fromJson(dynamic json) {
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
  int? id;
  int? productId;
  int? unitId;
  bool? isBaseUnit;
  bool? isDefault;
  double? rate;
  String? barCode;
  String? productName;
  String? unitName;
  String? productNameWithCode;
  String? unitNameWithCode;

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