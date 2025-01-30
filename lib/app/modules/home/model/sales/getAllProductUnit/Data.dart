class ProductUnitList {
  ProductUnitList({
    this.id,
    this.companyId,
    this.code,
    this.unitNameWithCode,
    this.unitName,
    this.nameA,
    this.nameE,
    this.notes,
    this.post,
    this.deleted,
    this.electronicInvoiceUnitId,
  });

  ProductUnitList.fromJson(dynamic json) {
    id = json['id'];
    companyId = json['companyId'];
    code = json['code'];
    unitNameWithCode = json['unitNameWithCode'];
    unitName = json['unitName'];
    nameA = json['nameA'];
    nameE = json['nameE'];
    notes = json['notes'];
    post = json['post'];
    deleted = json['deleted'];
    electronicInvoiceUnitId = json['electronicInvoiceUnitId'];
  }

  int? id;
  int? companyId;
  String? code;
  String? unitNameWithCode;
  String? unitName;
  String? nameA;
  String? nameE;
  String? notes;
  dynamic post;
  dynamic deleted;
  dynamic electronicInvoiceUnitId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['companyId'] = companyId;
    map['code'] = code;
    map['unitNameWithCode'] = unitNameWithCode;
    map['unitName'] = unitName;
    map['nameA'] = nameA;
    map['nameE'] = nameE;
    map['notes'] = notes;
    map['post'] = post;
    map['deleted'] = deleted;
    map['electronicInvoiceUnitId'] = electronicInvoiceUnitId;
    return map;
  }
}
