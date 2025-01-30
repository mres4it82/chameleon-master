class StockProductsPricing {
  StockProductsPricing({
      this.id, 
      this.productId, 
      this.salesUnitId, 
      this.salesUnitName, 
      this.salesPolicy, 
      this.salesPolicyName, 
      this.sCurrencyId, 
      this.sCurrencyName, 
      this.salesValue, 
      this.dineInPrice, 
      this.deliveryPrice, 
      this.isDefault, 
      this.warranty, 
      this.minimalQuantity, 
      this.includeTax,});

  StockProductsPricing.fromJson(dynamic json) {
    id = json['id'];
    productId = json['productId'];
    salesUnitId = json['salesUnitId'];
    salesUnitName = json['salesUnitName'];
    salesPolicy = json['salesPolicy'];
    salesPolicyName = json['salesPolicyName'];
    sCurrencyId = json['sCurrencyId'];
    sCurrencyName = json['sCurrencyName'];
    salesValue = json['salesValue'];
    dineInPrice = json['dine_InPrice'];
    deliveryPrice = json['delivery_Price'];
    isDefault = json['isDefault'];
    warranty = json['warranty'];
    minimalQuantity = json['minimalQuantity'];
    includeTax = json['includeTax'];
  }
  num? id;
  num? productId;
  num? salesUnitId;
  String? salesUnitName;
  num? salesPolicy;
  String? salesPolicyName;
  num? sCurrencyId;
  String? sCurrencyName;
  num? salesValue;
  num? dineInPrice;
  num? deliveryPrice;
  bool? isDefault;
  num? warranty;
  num? minimalQuantity;
  bool? includeTax;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['productId'] = productId;
    map['salesUnitId'] = salesUnitId;
    map['salesUnitName'] = salesUnitName;
    map['salesPolicy'] = salesPolicy;
    map['salesPolicyName'] = salesPolicyName;
    map['sCurrencyId'] = sCurrencyId;
    map['sCurrencyName'] = sCurrencyName;
    map['salesValue'] = salesValue;
    map['dine_InPrice'] = dineInPrice;
    map['delivery_Price'] = deliveryPrice;
    map['isDefault'] = isDefault;
    map['warranty'] = warranty;
    map['minimalQuantity'] = minimalQuantity;
    map['includeTax'] = includeTax;
    return map;
  }

}