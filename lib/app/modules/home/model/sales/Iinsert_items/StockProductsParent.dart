class StockProductsParent {
  StockProductsParent({
      this.id, 
      this.productId, 
      this.parentProductId, 
      this.parentProductName, 
      this.isRecomended, 
      this.quantity, 
      this.notes,});

  StockProductsParent.fromJson(dynamic json) {
    id = json['id'];
    productId = json['productId'];
    parentProductId = json['parentProductId'];
    parentProductName = json['parentProductName'];
    isRecomended = json['isRecomended'];
    quantity = json['quantity'];
    notes = json['notes'];
  }
  num? id;
  num? productId;
  num? parentProductId;
  String? parentProductName;
  bool? isRecomended;
  num? quantity;
  String? notes;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['productId'] = productId;
    map['parentProductId'] = parentProductId;
    map['parentProductName'] = parentProductName;
    map['isRecomended'] = isRecomended;
    map['quantity'] = quantity;
    map['notes'] = notes;
    return map;
  }

}