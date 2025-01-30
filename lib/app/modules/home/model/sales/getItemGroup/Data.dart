
class DataProductGroups {
  DataProductGroups({
    this.id,
    this.memberShipId,
    this.companyId,
    this.parentId,
    this.code,
    this.nameA,
    this.taxName,
    this.supplierName,
    this.supplierAccountName,
    this.customerAccountName,
    this.customerAccountId,
    this.mainAccountId,
    this.mainAccountName,
    this.parentName,
    this.groupNameWithCode,
    this.nameE,
    this.notes,
    this.hasChildren,
    this.levels,
    this.createUid,
    this.createDate,
    this.writeUid,
    this.writeDate,
    this.post,
      this.postUid, 
      this.postDate, 
      this.deleted, 
      this.deleteUid, 
      this.deleteDate, 
      this.stockProductGroupsId, 
      this.parentCostCenterId, 
      this.menuCategory, 
      this.image, 
      this.supplierId, 
      this.taxId, 
      this.codePrefix, 
      this.company, 
      this.inverseStockProductGroups, 
      this.parentCostCenter, 
      this.qsrPrintersKitchenAndBars, 
      this.stockProductGroups, 
      this.stockProducts, 
      this.stockSettingAccounts, 
      this.stockStocktakingHdrs, 
      this.supplier, 
      this.tax,});

  DataProductGroups.fromJson(dynamic json) {
    id = json['id'];
    memberShipId = json['memberShipId'];
    companyId = json['companyId'];
    parentId = json['parentId'];
    code = json['code'];
    nameA = json['nameA'];
    taxName = json['taxName'];
    supplierName = json['supplierName'];
    supplierAccountName = json['supplierAccountName'];
    customerAccountId = json['customerAccountId'];
    customerAccountName = json['customerAccountName'];
    mainAccountId = json['mainAccountId'];
    mainAccountName = json['mainAccountName'];
    parentName = json['parentName'];
    groupNameWithCode = json['groupNameWithCode'];
    nameE = json['nameE'];
    notes = json['notes'];
    hasChildren = json['hasChildren'];
    levels = json['levels'];
    createUid = json['createUid'];
    createDate = json['createDate'];
    writeUid = json['writeUid'];
    writeDate = json['writeDate'];
    post = json['post'];
    postUid = json['postUid'];
    postDate = json['postDate'];
    deleted = json['deleted'];
    deleteUid = json['deleteUid'];
    deleteDate = json['deleteDate'];
    stockProductGroupsId = json['stockProductGroupsId'];
    parentCostCenterId = json['parentCostCenterId'];
    menuCategory = json['menuCategory'];
    image = json['image'];
    supplierId = json['supplierId'];
    taxId = json['taxId'];
    codePrefix = json['codePrefix'];
    company = json['company'];
    if (json['inverseStockProductGroups'] != null) {
      inverseStockProductGroups = [];
      // json['inverseStockProductGroups'].forEach((v) {
      //   inverseStockProductGroups?.add(Dynamic.fromJson(v));
      // });
    }
    parentCostCenter = json['parentCostCenter'];
    if (json['qsrPrintersKitchenAndBars'] != null) {
      qsrPrintersKitchenAndBars = [];
      // json['qsrPrintersKitchenAndBars'].forEach((v) {
      //   qsrPrintersKitchenAndBars?.add(Dynamic.fromJson(v));
      // });
    }
    stockProductGroups = json['stockProductGroups'];
    if (json['stockProducts'] != null) {
      stockProducts = [];
      // json['stockProducts'].forEach((v) {
      //   stockProducts?.add(Dynamic.fromJson(v));
      // });
    }
    if (json['stockSettingAccounts'] != null) {
      stockSettingAccounts = [];
      // json['stockSettingAccounts'].forEach((v) {
      //   stockSettingAccounts?.add(Dynamic.fromJson(v));
      // });
    }
    if (json['stockStocktakingHdrs'] != null) {
      stockStocktakingHdrs = [];
      // json['stockStocktakingHdrs'].forEach((v) {
      //   stockStocktakingHdrs?.add(Dynamic.fromJson(v));
      // });
    }
    supplier = json['supplier'];
    tax = json['tax'];
  }

  int? id;
  int? memberShipId;
  int? companyId;
  dynamic parentId;
  String? code;
  String? nameA;
  String? taxName;
  String? supplierName;
  String? supplierAccountName;
  String? customerAccountName;
  int? mainAccountId;
  int? customerAccountId;
  String? mainAccountName;
  String? parentName;
  String? groupNameWithCode;
  String? nameE;
  String? notes;
  bool? hasChildren;
  int? levels;
  int? createUid;
  String? createDate;
  int? writeUid;
  String? writeDate;
  dynamic post;
  dynamic postUid;
  dynamic postDate;
  dynamic deleted;
  dynamic deleteUid;
  dynamic deleteDate;
  dynamic stockProductGroupsId;
  dynamic parentCostCenterId;
  bool? menuCategory;
  dynamic image;
  dynamic supplierId;
  int? taxId;
  String? codePrefix;
  dynamic company;
  List<dynamic>? inverseStockProductGroups;
  dynamic parentCostCenter;
  List<dynamic>? qsrPrintersKitchenAndBars;
  dynamic stockProductGroups;
  List<dynamic>? stockProducts;
  List<dynamic>? stockSettingAccounts;
  List<dynamic>? stockStocktakingHdrs;
  dynamic supplier;
  dynamic tax;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['memberShipId'] = memberShipId;
    map['companyId'] = companyId;
    map['parentId'] = parentId;
    map['code'] = code;
    map['nameA'] = nameA;
    map['taxName'] = taxName;
    map['supplierName'] = supplierName;
    map['supplierAccountName'] = supplierAccountName;
    map['customerAccountId'] = customerAccountId;
    map['customerAccountName'] = customerAccountName;
    map['mainAccountId'] = mainAccountId;
    map['mainAccountName'] = mainAccountName;
    map['parentName'] = parentName;
    map['groupNameWithCode'] = groupNameWithCode;
    map['nameE'] = nameE;
    map['notes'] = notes;
    map['hasChildren'] = hasChildren;
    map['levels'] = levels;
    map['createUid'] = createUid;
    map['createDate'] = createDate;
    map['writeUid'] = writeUid;
    map['writeDate'] = writeDate;
    map['post'] = post;
    map['postUid'] = postUid;
    map['postDate'] = postDate;
    map['deleted'] = deleted;
    map['deleteUid'] = deleteUid;
    map['deleteDate'] = deleteDate;
    map['stockProductGroupsId'] = stockProductGroupsId;
    map['parentCostCenterId'] = parentCostCenterId;
    map['menuCategory'] = menuCategory;
    map['image'] = image;
    map['supplierId'] = supplierId;
    map['taxId'] = taxId;
    map['codePrefix'] = codePrefix;
    map['company'] = company;
    if (inverseStockProductGroups != null) {
      map['inverseStockProductGroups'] = inverseStockProductGroups?.map((v) => v.toJson()).toList();
    }
    map['parentCostCenter'] = parentCostCenter;
    if (qsrPrintersKitchenAndBars != null) {
      map['qsrPrintersKitchenAndBars'] = qsrPrintersKitchenAndBars?.map((v) => v.toJson()).toList();
    }
    map['stockProductGroups'] = stockProductGroups;
    if (stockProducts != null) {
      map['stockProducts'] = stockProducts?.map((v) => v.toJson()).toList();
    }
    if (stockSettingAccounts != null) {
      map['stockSettingAccounts'] = stockSettingAccounts?.map((v) => v.toJson()).toList();
    }
    if (stockStocktakingHdrs != null) {
      map['stockStocktakingHdrs'] = stockStocktakingHdrs?.map((v) => v.toJson()).toList();
    }
    map['supplier'] = supplier;
    map['tax'] = tax;
    return map;
  }

}