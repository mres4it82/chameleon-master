import 'Units.dart';

class Data {
  Data({
      this.id, 
      this.memberShipId, 
      this.companyId, 
      this.groupId, 
      this.groupName, 
      this.groupNameWithCode, 
      this.code, 
      this.productName, 
      this.productNameWithCode, 
      this.nameA, 
      this.nameE, 
      this.typeName, 
      this.itemType, 
      this.costName, 
      this.costType, 
      this.kitchenDisplayName, 
      this.posDisplayNameA, 
      this.posDisplayNameE, 
      this.visible, 
      this.hasValidDate, 
      this.hasColor, 
      this.hasSerial, 
      this.serialNeedInReciept, 
      this.serialNeedInDeliver, 
      this.maxLimit, 
      this.requireLimit, 
      this.reOrderQuantity, 
      this.minLimit, 
      this.slumpRate, 
      this.brandName, 
      this.brandNameWithCode, 
      this.brandId, 
      this.warranty, 
      this.customerLeadTime, 
      this.active, 
      this.deactivate, 
      this.width, 
      this.height, 
      this.depth, 
      this.image, 
      this.notes, 
      this.parentCostCenterName, 
      this.parentCostCenterNameWithCode, 
      this.parentCostCenterId, 
      this.attributeName, 
      this.attributeNameWithCode, 
      this.attributeId, 
      this.onlineStoreProductId, 
      this.onlineStoreVariantId, 
      this.onlineStoreInventoryItemId, 
      this.onlineStoreSKU, 
      this.onlineStoreProductName, 
      this.mappingCreateDate, 
      this.mappingCreateUserId, 
      this.mappingWriteDate, 
      this.mappingWriteUserId, 
      this.electronicInvoiceProductId, 
      this.electronicInvoiceCodeType, 
      this.electronicInvoiceProductCode, 
      this.electronicInvoiceProductName, 
      this.electronicInvoiceProductNameA, 
      this.post, 
      this.deleted, 
      this.units,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    memberShipId = json['memberShipId'];
    companyId = json['companyId'];
    groupId = json['groupId'];
    groupName = json['groupName'];
    groupNameWithCode = json['groupNameWithCode'];
    code = json['code'];
    productName = json['productName'];
    productNameWithCode = json['productNameWithCode'];
    nameA = json['nameA'];
    nameE = json['nameE'];
    typeName = json['typeName'];
    itemType = json['itemType'];
    costName = json['costName'];
    costType = json['costType'];
    kitchenDisplayName = json['kitchenDisplayName'];
    posDisplayNameA = json['posDisplayNameA'];
    posDisplayNameE = json['posDisplayNameE'];
    visible = json['visible'];
    hasValidDate = json['hasValidDate'];
    hasColor = json['hasColor'];
    hasSerial = json['hasSerial'];
    serialNeedInReciept = json['serialNeedInReciept'];
    serialNeedInDeliver = json['serialNeedInDeliver'];
    maxLimit = json['maxLimit'];
    requireLimit = json['requireLimit'];
    reOrderQuantity = json['reOrderQuantity'];
    minLimit = json['minLimit'];
    slumpRate = json['slumpRate'];
    brandName = json['brandName'];
    brandNameWithCode = json['brandNameWithCode'];
    brandId = json['brandId'];
    warranty = json['warranty'];
    customerLeadTime = json['customerLeadTime'];
    active = json['active'];
    deactivate = json['deactivate'];
    width = json['width'];
    height = json['height'];
    depth = json['depth'];
    image = json['image'];
    notes = json['notes'];
    parentCostCenterName = json['parentCostCenterName'];
    parentCostCenterNameWithCode = json['parentCostCenterNameWithCode'];
    parentCostCenterId = json['parentCostCenterId'];
    attributeName = json['attributeName'];
    attributeNameWithCode = json['attributeNameWithCode'];
    attributeId = json['attributeId'];
    onlineStoreProductId = json['onlineStoreProductId'];
    onlineStoreVariantId = json['onlineStoreVariantId'];
    onlineStoreInventoryItemId = json['onlineStoreInventoryItemId'];
    onlineStoreSKU = json['onlineStoreSKU'];
    onlineStoreProductName = json['onlineStoreProductName'];
    mappingCreateDate = json['mappingCreateDate'];
    mappingCreateUserId = json['mappingCreateUserId'];
    mappingWriteDate = json['mappingWriteDate'];
    mappingWriteUserId = json['mappingWriteUserId'];
    electronicInvoiceProductId = json['electronicInvoiceProductId'];
    electronicInvoiceCodeType = json['electronicInvoiceCodeType'];
    electronicInvoiceProductCode = json['electronicInvoiceProductCode'];
    electronicInvoiceProductName = json['electronicInvoiceProductName'];
    electronicInvoiceProductNameA = json['electronicInvoiceProductNameA'];
    post = json['post'];
    deleted = json['deleted'];
    if (json['units'] != null) {
      units = [];
      json['units'].forEach((v) {
        units?.add(Units.fromJson(v));
      });
    }
  }
  int? id;
  int? memberShipId;
  int? companyId;
  int? groupId;
  String? groupName;
  String? groupNameWithCode;
  String? code;
  String? productName;
  String? productNameWithCode;
  String? nameA;
  String? nameE;
  String? typeName;
  int? itemType;
  String? costName;
  int? costType;
  dynamic kitchenDisplayName;
  dynamic posDisplayNameA;
  dynamic posDisplayNameE;
  dynamic visible;
  bool? hasValidDate;
  bool? hasColor;
  bool? hasSerial;
  bool? serialNeedInReciept;
  bool? serialNeedInDeliver;
  double? maxLimit;
  double? requireLimit;
  dynamic reOrderQuantity;
  double? minLimit;
  double? slumpRate;
  dynamic brandName;
  String? brandNameWithCode;
  dynamic brandId;
  int? warranty;
  int? customerLeadTime;
  bool? active;
  bool? deactivate;
  int? width;
  int? height;
  int? depth;
  dynamic image;
  String? notes;
  dynamic parentCostCenterName;
  String? parentCostCenterNameWithCode;
  dynamic parentCostCenterId;
  dynamic attributeName;
  String? attributeNameWithCode;
  dynamic attributeId;
  dynamic onlineStoreProductId;
  dynamic onlineStoreVariantId;
  dynamic onlineStoreInventoryItemId;
  dynamic onlineStoreSKU;
  dynamic onlineStoreProductName;
  dynamic mappingCreateDate;
  dynamic mappingCreateUserId;
  dynamic mappingWriteDate;
  dynamic mappingWriteUserId;
  dynamic electronicInvoiceProductId;
  dynamic electronicInvoiceCodeType;
  dynamic electronicInvoiceProductCode;
  dynamic electronicInvoiceProductName;
  dynamic electronicInvoiceProductNameA;
  dynamic post;
  dynamic deleted;
  List<Units>? units;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['memberShipId'] = memberShipId;
    map['companyId'] = companyId;
    map['groupId'] = groupId;
    map['groupName'] = groupName;
    map['groupNameWithCode'] = groupNameWithCode;
    map['code'] = code;
    map['productName'] = productName;
    map['productNameWithCode'] = productNameWithCode;
    map['nameA'] = nameA;
    map['nameE'] = nameE;
    map['typeName'] = typeName;
    map['itemType'] = itemType;
    map['costName'] = costName;
    map['costType'] = costType;
    map['kitchenDisplayName'] = kitchenDisplayName;
    map['posDisplayNameA'] = posDisplayNameA;
    map['posDisplayNameE'] = posDisplayNameE;
    map['visible'] = visible;
    map['hasValidDate'] = hasValidDate;
    map['hasColor'] = hasColor;
    map['hasSerial'] = hasSerial;
    map['serialNeedInReciept'] = serialNeedInReciept;
    map['serialNeedInDeliver'] = serialNeedInDeliver;
    map['maxLimit'] = maxLimit;
    map['requireLimit'] = requireLimit;
    map['reOrderQuantity'] = reOrderQuantity;
    map['minLimit'] = minLimit;
    map['slumpRate'] = slumpRate;
    map['brandName'] = brandName;
    map['brandNameWithCode'] = brandNameWithCode;
    map['brandId'] = brandId;
    map['warranty'] = warranty;
    map['customerLeadTime'] = customerLeadTime;
    map['active'] = active;
    map['deactivate'] = deactivate;
    map['width'] = width;
    map['height'] = height;
    map['depth'] = depth;
    map['image'] = image;
    map['notes'] = notes;
    map['parentCostCenterName'] = parentCostCenterName;
    map['parentCostCenterNameWithCode'] = parentCostCenterNameWithCode;
    map['parentCostCenterId'] = parentCostCenterId;
    map['attributeName'] = attributeName;
    map['attributeNameWithCode'] = attributeNameWithCode;
    map['attributeId'] = attributeId;
    map['onlineStoreProductId'] = onlineStoreProductId;
    map['onlineStoreVariantId'] = onlineStoreVariantId;
    map['onlineStoreInventoryItemId'] = onlineStoreInventoryItemId;
    map['onlineStoreSKU'] = onlineStoreSKU;
    map['onlineStoreProductName'] = onlineStoreProductName;
    map['mappingCreateDate'] = mappingCreateDate;
    map['mappingCreateUserId'] = mappingCreateUserId;
    map['mappingWriteDate'] = mappingWriteDate;
    map['mappingWriteUserId'] = mappingWriteUserId;
    map['electronicInvoiceProductId'] = electronicInvoiceProductId;
    map['electronicInvoiceCodeType'] = electronicInvoiceCodeType;
    map['electronicInvoiceProductCode'] = electronicInvoiceProductCode;
    map['electronicInvoiceProductName'] = electronicInvoiceProductName;
    map['electronicInvoiceProductNameA'] = electronicInvoiceProductNameA;
    map['post'] = post;
    map['deleted'] = deleted;
    if (units != null) {
      map['units'] = units?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}