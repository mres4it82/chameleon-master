class StockProductsAlternative {
  StockProductsAlternative({
      this.id, 
      this.productId, 
      this.alternateId, 
      this.alternateName, 
      this.alternateCode, 
      this.notes,});

  StockProductsAlternative.fromJson(dynamic json) {
    id = json['id'];
    productId = json['productId'];
    alternateId = json['alternateId'];
    alternateName = json['alternateName'];
    alternateCode = json['alternateCode'];
    notes = json['notes'];
  }
  num? id;
  num? productId;
  num? alternateId;
  String? alternateName;
  String? alternateCode;
  String? notes;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['productId'] = productId;
    map['alternateId'] = alternateId;
    map['alternateName'] = alternateName;
    map['alternateCode'] = alternateCode;
    map['notes'] = notes;
    return map;
  }

}