class StockProductsSuppliers {
  StockProductsSuppliers({
      this.id, 
      this.productId, 
      this.supplierId, 
      this.supplierName, 
      this.productCode, 
      this.purchaseUnitId, 
      this.purchaseUnitName, 
      this.purchasePolicy, 
      this.purchasePolicyName, 
      this.pCurrencyId, 
      this.pCurrencyName, 
      this.purchaseValue, 
      this.isDefault, 
      this.warranty, 
      this.minimalQuantity,});

  StockProductsSuppliers.fromJson(dynamic json) {
    id = json['id'];
    productId = json['productId'];
    supplierId = json['supplierId'];
    supplierName = json['supplierName'];
    productCode = json['productCode'];
    purchaseUnitId = json['purchaseUnitId'];
    purchaseUnitName = json['purchaseUnitName'];
    purchasePolicy = json['purchasePolicy'];
    purchasePolicyName = json['purchasePolicyName'];
    pCurrencyId = json['pCurrencyId'];
    pCurrencyName = json['pCurrencyName'];
    purchaseValue = json['purchaseValue'];
    isDefault = json['isDefault'];
    warranty = json['warranty'];
    minimalQuantity = json['minimalQuantity'];
  }
  num? id;
  num? productId;
  num? supplierId;
  String? supplierName;
  String? productCode;
  num? purchaseUnitId;
  String? purchaseUnitName;
  num? purchasePolicy;
  String? purchasePolicyName;
  num? pCurrencyId;
  String? pCurrencyName;
  num? purchaseValue;
  bool? isDefault;
  num? warranty;
  num? minimalQuantity;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['productId'] = productId;
    map['supplierId'] = supplierId;
    map['supplierName'] = supplierName;
    map['productCode'] = productCode;
    map['purchaseUnitId'] = purchaseUnitId;
    map['purchaseUnitName'] = purchaseUnitName;
    map['purchasePolicy'] = purchasePolicy;
    map['purchasePolicyName'] = purchasePolicyName;
    map['pCurrencyId'] = pCurrencyId;
    map['pCurrencyName'] = pCurrencyName;
    map['purchaseValue'] = purchaseValue;
    map['isDefault'] = isDefault;
    map['warranty'] = warranty;
    map['minimalQuantity'] = minimalQuantity;
    return map;
  }

}