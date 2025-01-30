class StockProductsAttachments {
  StockProductsAttachments({
      this.id, 
      this.productId, 
      this.attachmentTypeId, 
      this.attachmentTypeName, 
      this.fileName, 
      this.notes,});

  StockProductsAttachments.fromJson(dynamic json) {
    id = json['id'];
    productId = json['productId'];
    attachmentTypeId = json['attachmentTypeId'];
    attachmentTypeName = json['attachmentTypeName'];
    fileName = json['fileName'];
    notes = json['notes'];
  }
  num? id;
  num? productId;
  num? attachmentTypeId;
  String? attachmentTypeName;
  String? fileName;
  String? notes;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['productId'] = productId;
    map['attachmentTypeId'] = attachmentTypeId;
    map['attachmentTypeName'] = attachmentTypeName;
    map['fileName'] = fileName;
    map['notes'] = notes;
    return map;
  }

}