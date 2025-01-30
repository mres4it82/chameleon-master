class RetailTaxList {
  RetailTaxList({
    this.id,
    this.companyId,
    this.code,
    this.taxNameWithCode,
    this.taxName,
    this.nameA,
    this.nameE,
    this.applyFromDateGregi,
    this.applyFromDateHijri,
    this.exemptAfter,
    this.type,
    this.value,
    this.sourceType,
    this.isActive,
    this.applyBeforDiscount,
    this.notes,
    this.taxAcountId,
    this.post,
    this.deleted,
    this.hide,
    this.electronicInvoiceTaxId,
    this.electronicInvoiceSubTaxId,
    this.taxCategoryId,
    this.taxSubCategoryId,});

  RetailTaxList.fromJson(dynamic json) {
    id = json['id'];
    companyId = json['companyId'];
    code = json['code'];
    taxNameWithCode = json['taxNameWithCode'];
    taxName = json['taxName'];
    nameA = json['nameA'];
    nameE = json['nameE'];
    applyFromDateGregi = json['applyFromDateGregi'];
    applyFromDateHijri = json['applyFromDateHijri'];
    exemptAfter = json['exemptAfter'];
    type = json['type'];
    value = json['value'];
    sourceType = json['sourceType'];
    isActive = json['isActive'];
    applyBeforDiscount = json['applyBeforDiscount'];
    notes = json['notes'];
    taxAcountId = json['taxAcountId'];
    post = json['post'];
    deleted = json['deleted'];
    hide = json['hide'];
    electronicInvoiceTaxId = json['electronicInvoiceTaxId'];
    electronicInvoiceSubTaxId = json['electronicInvoiceSubTaxId'];
    taxCategoryId = json['taxCategoryId'];
    taxSubCategoryId = json['taxSubCategoryId'];
  }

  int? id;
  int? companyId;
  String? code;
  String? taxNameWithCode;
  String? taxName;
  String? nameA;
  String? nameE;
  String? applyFromDateGregi;
  String? applyFromDateHijri;
  int? exemptAfter;
  int? type;
  double? value;
  int? sourceType;
  bool? isActive;
  bool? applyBeforDiscount;
  dynamic notes;
  int? taxAcountId;
  dynamic post;
  dynamic deleted;
  bool? hide;
  dynamic electronicInvoiceTaxId;
  dynamic electronicInvoiceSubTaxId;
  dynamic taxCategoryId;
  dynamic taxSubCategoryId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['companyId'] = companyId;
    map['code'] = code;
    map['taxNameWithCode'] = taxNameWithCode;
    map['taxName'] = taxName;
    map['nameA'] = nameA;
    map['nameE'] = nameE;
    map['applyFromDateGregi'] = applyFromDateGregi;
    map['applyFromDateHijri'] = applyFromDateHijri;
    map['exemptAfter'] = exemptAfter;
    map['type'] = type;
    map['value'] = value;
    map['sourceType'] = sourceType;
    map['isActive'] = isActive;
    map['applyBeforDiscount'] = applyBeforDiscount;
    map['notes'] = notes;
    map['taxAcountId'] = taxAcountId;
    map['post'] = post;
    map['deleted'] = deleted;
    map['hide'] = hide;
    map['electronicInvoiceTaxId'] = electronicInvoiceTaxId;
    map['electronicInvoiceSubTaxId'] = electronicInvoiceSubTaxId;
    map['taxCategoryId'] = taxCategoryId;
    map['taxSubCategoryId'] = taxSubCategoryId;
    return map;
  }

}