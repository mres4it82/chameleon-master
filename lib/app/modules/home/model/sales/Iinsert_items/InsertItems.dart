import 'StockProductsUnits.dart';
import 'StockProductsSuppliers.dart';
import 'StockProductsPricing.dart';
import 'StockProductsAlternative.dart';
import 'StockProductsParent.dart';
import 'StockProductsSpCollection.dart';
import 'StockProductsDefaultStorageLocation.dart';
import 'StockProductsAttachments.dart';
import 'StockProductsSpecifications.dart';
import 'QsRCooking.dart';
import 'QsRPreparation.dart';
import 'QsRPresentation.dart';
import 'QsRStorage.dart';

class InsertItems {
  InsertItems({
      this.id, 
      this.memberShipId, 
      this.companyId, 
      this.groupId, 
      this.code, 
      this.nameA, 
      this.nameE, 
      this.itemType, 
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
      this.brandId, 
      this.brandName, 
      this.warranty, 
      this.customerLeadTime, 
      this.active, 
      this.deactivate, 
      this.width, 
      this.height, 
      this.depth, 
      this.image, 
      this.notes, 
      this.parentCostCenterId, 
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
      this.stockProductsUnits, 
      this.stockProductsSuppliers, 
      this.stockProductsPricing, 
      this.stockProductsAlternative, 
      this.stockProductsParent, 
      this.stockProductsSPCollection, 
      this.stockProductsDefaultStorageLocation, 
      this.stockProductsAttachments, 
      this.stockProductsSpecifications, 
      this.qsRCooking, 
      this.qsRPreparation, 
      this.qsRPresentation, 
      this.qsRStorage,});

  InsertItems.fromJson(dynamic json) {
    id = json['id'];
    memberShipId = json['memberShipId'];
    companyId = json['companyId'];
    groupId = json['groupId'];
    code = json['code'];
    nameA = json['nameA'];
    nameE = json['nameE'];
    itemType = json['itemType'];
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
    brandId = json['brandId'];
    brandName = json['brandName'];
    warranty = json['warranty'];
    customerLeadTime = json['customerLeadTime'];
    active = json['active'];
    deactivate = json['deactivate'];
    width = json['width'];
    height = json['height'];
    depth = json['depth'];
    image = json['image'];
    notes = json['notes'];
    parentCostCenterId = json['parentCostCenterId'];
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
    createUid = json['create_Uid'];
    createDate = json['create_Date'];
    writeUid = json['write_Uid'];
    writeDate = json['write_Date'];
    post = json['post'];
    postUid = json['post_Uid'];
    postDate = json['post_Date'];
    deleted = json['deleted'];
    deleteUid = json['delete_Uid'];
    deleteDate = json['delete_Date'];
    if (json['stock_Products_Units'] != null) {
      stockProductsUnits = [];
      json['stock_Products_Units'].forEach((v) {
        stockProductsUnits?.add(StockProductsUnits.fromJson(v));
      });
    }
    if (json['stock_Products_Suppliers'] != null) {
      stockProductsSuppliers = [];
      json['stock_Products_Suppliers'].forEach((v) {
        stockProductsSuppliers?.add(StockProductsSuppliers.fromJson(v));
      });
    }
    if (json['stock_Products_Pricing'] != null) {
      stockProductsPricing = [];
      json['stock_Products_Pricing'].forEach((v) {
        stockProductsPricing?.add(StockProductsPricing.fromJson(v));
      });
    }
    if (json['stock_Products_Alternative'] != null) {
      stockProductsAlternative = [];
      json['stock_Products_Alternative'].forEach((v) {
        stockProductsAlternative?.add(StockProductsAlternative.fromJson(v));
      });
    }
    if (json['stock_Products_Parent'] != null) {
      stockProductsParent = [];
      json['stock_Products_Parent'].forEach((v) {
        stockProductsParent?.add(StockProductsParent.fromJson(v));
      });
    }
    if (json['stock_Products_SPCollection'] != null) {
      stockProductsSPCollection = [];
      json['stock_Products_SPCollection'].forEach((v) {
        stockProductsSPCollection?.add(StockProductsSpCollection.fromJson(v));
      });
    }
    if (json['stock_Products_DefaultStorageLocation'] != null) {
      stockProductsDefaultStorageLocation = [];
      json['stock_Products_DefaultStorageLocation'].forEach((v) {
        stockProductsDefaultStorageLocation?.add(StockProductsDefaultStorageLocation.fromJson(v));
      });
    }
    if (json['stock_Products_Attachments'] != null) {
      stockProductsAttachments = [];
      json['stock_Products_Attachments'].forEach((v) {
        stockProductsAttachments?.add(StockProductsAttachments.fromJson(v));
      });
    }
    if (json['stock_Products_Specifications'] != null) {
      stockProductsSpecifications = [];
      json['stock_Products_Specifications'].forEach((v) {
        stockProductsSpecifications?.add(StockProductsSpecifications.fromJson(v));
      });
    }
    if (json['qsR_Cooking'] != null) {
      qsRCooking = [];
      json['qsR_Cooking'].forEach((v) {
        qsRCooking?.add(QsRCooking.fromJson(v));
      });
    }
    if (json['qsR_Preparation'] != null) {
      qsRPreparation = [];
      json['qsR_Preparation'].forEach((v) {
        qsRPreparation?.add(QsRPreparation.fromJson(v));
      });
    }
    if (json['qsR_Presentation'] != null) {
      qsRPresentation = [];
      json['qsR_Presentation'].forEach((v) {
        qsRPresentation?.add(QsRPresentation.fromJson(v));
      });
    }
    if (json['qsR_Storage'] != null) {
      qsRStorage = [];
      json['qsR_Storage'].forEach((v) {
        qsRStorage?.add(QsRStorage.fromJson(v));
      });
    }
  }
  num? id;
  num? memberShipId;
  num? companyId;
  num? groupId;
  String? code;
  String? nameA;
  String? nameE;
  num? itemType;
  num? costType;
  String? kitchenDisplayName;
  String? posDisplayNameA;
  String? posDisplayNameE;
  bool? visible;
  bool? hasValidDate;
  bool? hasColor;
  bool? hasSerial;
  bool? serialNeedInReciept;
  bool? serialNeedInDeliver;
  num? maxLimit;
  num? requireLimit;
  num? reOrderQuantity;
  num? minLimit;
  num? slumpRate;
  num? brandId;
  String? brandName;
  num? warranty;
  num? customerLeadTime;
  bool? active;
  bool? deactivate;
  num? width;
  num? height;
  num? depth;
  String? image;
  String? notes;
  num? parentCostCenterId;
  num? attributeId;
  num? onlineStoreProductId;
  num? onlineStoreVariantId;
  num? onlineStoreInventoryItemId;
  String? onlineStoreSKU;
  String? onlineStoreProductName;
  String? mappingCreateDate;
  num? mappingCreateUserId;
  String? mappingWriteDate;
  num? mappingWriteUserId;
  num? electronicInvoiceProductId;
  String? electronicInvoiceCodeType;
  String? electronicInvoiceProductCode;
  String? electronicInvoiceProductName;
  String? electronicInvoiceProductNameA;
  num? createUid;
  String? createDate;
  num? writeUid;
  String? writeDate;
  bool? post;
  num? postUid;
  String? postDate;
  bool? deleted;
  num? deleteUid;
  String? deleteDate;
  List<StockProductsUnits>? stockProductsUnits;
  List<StockProductsSuppliers>? stockProductsSuppliers;
  List<StockProductsPricing>? stockProductsPricing;
  List<StockProductsAlternative>? stockProductsAlternative;
  List<StockProductsParent>? stockProductsParent;
  List<StockProductsSpCollection>? stockProductsSPCollection;
  List<StockProductsDefaultStorageLocation>? stockProductsDefaultStorageLocation;
  List<StockProductsAttachments>? stockProductsAttachments;
  List<StockProductsSpecifications>? stockProductsSpecifications;
  List<QsRCooking>? qsRCooking;
  List<QsRPreparation>? qsRPreparation;
  List<QsRPresentation>? qsRPresentation;
  List<QsRStorage>? qsRStorage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['memberShipId'] = memberShipId;
    map['companyId'] = companyId;
    map['groupId'] = groupId;
    map['code'] = code;
    map['nameA'] = nameA;
    map['nameE'] = nameE;
    map['itemType'] = itemType;
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
    map['brandId'] = brandId;
    map['brandName'] = brandName;
    map['warranty'] = warranty;
    map['customerLeadTime'] = customerLeadTime;
    map['active'] = active;
    map['deactivate'] = deactivate;
    map['width'] = width;
    map['height'] = height;
    map['depth'] = depth;
    map['image'] = image;
    map['notes'] = notes;
    map['parentCostCenterId'] = parentCostCenterId;
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
    map['create_Uid'] = createUid;
    map['create_Date'] = createDate;
    map['write_Uid'] = writeUid;
    map['write_Date'] = writeDate;
    map['post'] = post;
    map['post_Uid'] = postUid;
    map['post_Date'] = postDate;
    map['deleted'] = deleted;
    map['delete_Uid'] = deleteUid;
    map['delete_Date'] = deleteDate;
    if (stockProductsUnits != null) {
      map['stock_Products_Units'] = stockProductsUnits?.map((v) => v.toJson()).toList();
    }
    if (stockProductsSuppliers != null) {
      map['stock_Products_Suppliers'] = stockProductsSuppliers?.map((v) => v.toJson()).toList();
    }
    if (stockProductsPricing != null) {
      map['stock_Products_Pricing'] = stockProductsPricing?.map((v) => v.toJson()).toList();
    }
    if (stockProductsAlternative != null) {
      map['stock_Products_Alternative'] = stockProductsAlternative?.map((v) => v.toJson()).toList();
    }
    if (stockProductsParent != null) {
      map['stock_Products_Parent'] = stockProductsParent?.map((v) => v.toJson()).toList();
    }
    if (stockProductsSPCollection != null) {
      map['stock_Products_SPCollection'] = stockProductsSPCollection?.map((v) => v.toJson()).toList();
    }
    if (stockProductsDefaultStorageLocation != null) {
      map['stock_Products_DefaultStorageLocation'] = stockProductsDefaultStorageLocation?.map((v) => v.toJson()).toList();
    }
    if (stockProductsAttachments != null) {
      map['stock_Products_Attachments'] = stockProductsAttachments?.map((v) => v.toJson()).toList();
    }
    if (stockProductsSpecifications != null) {
      map['stock_Products_Specifications'] = stockProductsSpecifications?.map((v) => v.toJson()).toList();
    }
    if (qsRCooking != null) {
      map['qsR_Cooking'] = qsRCooking?.map((v) => v.toJson()).toList();
    }
    if (qsRPreparation != null) {
      map['qsR_Preparation'] = qsRPreparation?.map((v) => v.toJson()).toList();
    }
    if (qsRPresentation != null) {
      map['qsR_Presentation'] = qsRPresentation?.map((v) => v.toJson()).toList();
    }
    if (qsRStorage != null) {
      map['qsR_Storage'] = qsRStorage?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}