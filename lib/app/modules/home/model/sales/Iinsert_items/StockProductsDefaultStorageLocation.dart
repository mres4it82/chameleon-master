class StockProductsDefaultStorageLocation {
  StockProductsDefaultStorageLocation({
      this.id, 
      this.productId, 
      this.warehouseId, 
      this.warehouseName, 
      this.shelveId, 
      this.shelveName, 
      this.rackId, 
      this.rackName, 
      this.rowId, 
      this.rowName, 
      this.caseId, 
      this.caseName, 
      this.notes,});

  StockProductsDefaultStorageLocation.fromJson(dynamic json) {
    id = json['id'];
    productId = json['productId'];
    warehouseId = json['warehouseId'];
    warehouseName = json['warehouseName'];
    shelveId = json['shelveId'];
    shelveName = json['shelveName'];
    rackId = json['rackId'];
    rackName = json['rackName'];
    rowId = json['rowId'];
    rowName = json['rowName'];
    caseId = json['caseId'];
    caseName = json['caseName'];
    notes = json['notes'];
  }
  num? id;
  num? productId;
  num? warehouseId;
  String? warehouseName;
  num? shelveId;
  String? shelveName;
  num? rackId;
  String? rackName;
  num? rowId;
  String? rowName;
  num? caseId;
  String? caseName;
  String? notes;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['productId'] = productId;
    map['warehouseId'] = warehouseId;
    map['warehouseName'] = warehouseName;
    map['shelveId'] = shelveId;
    map['shelveName'] = shelveName;
    map['rackId'] = rackId;
    map['rackName'] = rackName;
    map['rowId'] = rowId;
    map['rowName'] = rowName;
    map['caseId'] = caseId;
    map['caseName'] = caseName;
    map['notes'] = notes;
    return map;
  }

}