class StockProductsUnits {
  StockProductsUnits({
      this.id, 
      this.productId, 
      this.unitId, 
      this.unitName, 
      this.isBaseUnit, 
      this.isDefault, 
      this.rate, 
      this.barCode,});

  StockProductsUnits.fromJson(dynamic json) {
    id = json['id'];
    productId = json['productId'];
    unitId = json['unitId'];
    unitName = json['unitName'];
    isBaseUnit = json['isBaseUnit'];
    isDefault = json['isDefault'];
    rate = json['rate'];
    barCode = json['barCode'];
  }
  num? id;
  num? productId;
  num? unitId;
  String? unitName;
  bool? isBaseUnit;
  bool? isDefault;
  num? rate;
  String? barCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['productId'] = productId;
    map['unitId'] = unitId;
    map['unitName'] = unitName;
    map['isBaseUnit'] = isBaseUnit;
    map['isDefault'] = isDefault;
    map['rate'] = rate;
    map['barCode'] = barCode;
    return map;
  }

}