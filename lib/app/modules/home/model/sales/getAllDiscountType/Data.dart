class DiscountTypeList {
  DiscountTypeList({
    this.id,
    this.companyId,
    this.code,
    this.discountTypeNameWithCode,
    this.discountTypeName,
    this.nameA,
    this.nameE,
    this.notes,
    this.post,
    this.deleted,
    this.formType,
    this.type,
    this.value,
    this.maxValue,
  });

  DiscountTypeList.fromJson(dynamic json) {
    id = json['id'];
    companyId = json['companyId'];
    code = json['code'];
    discountTypeNameWithCode = json['discountTypeNameWithCode'];
    discountTypeName = json['discountTypeName'];
    nameA = json['nameA'];
    nameE = json['nameE'];
    notes = json['notes'];
    post = json['post'];
    deleted = json['deleted'];
    formType = json['formType'];
    type = json['type'];
    value = json['value'];
    maxValue = json['maxValue'];
  }

  int? id;
  int? companyId;
  String? code;
  String? discountTypeNameWithCode;
  String? discountTypeName;
  String? nameA;
  String? nameE;
  String? notes;
  dynamic post;
  dynamic deleted;
  int? formType;
  int? type;
  double? value;
  dynamic maxValue;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['companyId'] = companyId;
    map['code'] = code;
    map['discountTypeNameWithCode'] = discountTypeNameWithCode;
    map['discountTypeName'] = discountTypeName;
    map['nameA'] = nameA;
    map['nameE'] = nameE;
    map['notes'] = notes;
    map['post'] = post;
    map['deleted'] = deleted;
    map['formType'] = formType;
    map['type'] = type;
    map['value'] = value;
    map['maxValue'] = maxValue;
    return map;
  }
}
