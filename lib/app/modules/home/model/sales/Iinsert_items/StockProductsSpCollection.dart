class StockProductsSpCollection {
  StockProductsSpCollection({
      this.id, 
      this.productId, 
      this.spId, 
      this.spName, 
      this.unitId, 
      this.unitName, 
      this.quantity, 
      this.notes,});

  StockProductsSpCollection.fromJson(dynamic json) {
    id = json['id'];
    productId = json['productId'];
    spId = json['spId'];
    spName = json['spName'];
    unitId = json['unitId'];
    unitName = json['unitName'];
    quantity = json['quantity'];
    notes = json['notes'];
  }
  num? id;
  num? productId;
  num? spId;
  String? spName;
  num? unitId;
  String? unitName;
  num? quantity;
  String? notes;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['productId'] = productId;
    map['spId'] = spId;
    map['spName'] = spName;
    map['unitId'] = unitId;
    map['unitName'] = unitName;
    map['quantity'] = quantity;
    map['notes'] = notes;
    return map;
  }

}