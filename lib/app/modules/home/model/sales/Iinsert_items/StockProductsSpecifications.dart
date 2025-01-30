class StockProductsSpecifications {
  StockProductsSpecifications({
      this.id, 
      this.productId, 
      this.specificationsId, 
      this.specificationsName, 
      this.valueE, 
      this.valueA,});

  StockProductsSpecifications.fromJson(dynamic json) {
    id = json['id'];
    productId = json['productId'];
    specificationsId = json['specificationsId'];
    specificationsName = json['specificationsName'];
    valueE = json['valueE'];
    valueA = json['valueA'];
  }
  num? id;
  num? productId;
  num? specificationsId;
  String? specificationsName;
  String? valueE;
  String? valueA;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['productId'] = productId;
    map['specificationsId'] = specificationsId;
    map['specificationsName'] = specificationsName;
    map['valueE'] = valueE;
    map['valueA'] = valueA;
    return map;
  }

}