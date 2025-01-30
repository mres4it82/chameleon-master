class RetailSuppliersList {
  RetailSuppliersList({
    this.id,
    this.companyId,
    this.partnerType,
    this.code,
    this.partnerName,
    this.partnerNameWithCode,
    this.nameA,
    this.nameE,
    this.isCustomerSupplier,
    this.partnerGroupId,
    this.activityId,
    this.dealDateGregi,
    this.dealDateHijri,
    this.address,
    this.email,
    this.telephone,
    this.fax,
    this.webSite,
    this.registerNo,
    this.registerEndDateGregi,
    this.registerEndDateHijri,
    this.countryId,
    this.cityId,
    this.zip,
    this.poBox,
    this.accountId,
    this.currencyId,
    this.dayLimit,
    this.moneyLimit,
    this.mainPartnerId,
    this.latitude,
    this.longitude,
    this.stoped,
    this.bankId,
    this.accountNo,
    this.iban,
    this.notes,
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
    this.shippingAddress,
    this.invoicingAddress,
    this.openingBalance,
    this.openingBalanceCurrencyId,
    this.taxFileNo,
    this.userName,
    this.password,
    this.dob,
    this.gender,
    this.customerInbound,
    this.mobiel,
    this.maritalstatus,
    this.workAddress,
    this.identityNumber,
    this.passportNumber,
    this.address2,
    this.tel2,
    this.tel3,
    this.mobiel2,
    this.mobiel3,
    this.email2,
    this.job,
    this.openingBalanceType,
    this.advertismentId,
    this.importanceDegreeId,
    this.paymentType,
    this.buildingNo,
    this.streetName,
    this.district,
    this.onlineCustomerId,
    this.onlineCustomerName,
    this.customerType,
    this.additionalNumber,
    this.shortAddress,
    this.other,
    this.openingBalanceRemain,
    this.mappingCreateDate,
    this.mappingCreateUserId,
    this.mappingWriteDate,
    this.mappingWriteUserId,});

  RetailSuppliersList.fromJson(dynamic json) {
    id = json['id'];
    companyId = json['companyId'];
    partnerType = json['partnerType'];
    code = json['code'];
    partnerName = json['partnerName'];
    partnerNameWithCode = json['partnerNameWithCode'];
    nameA = json['nameA'];
    nameE = json['nameE'];
    isCustomerSupplier = json['isCustomerSupplier'];
    partnerGroupId = json['partnerGroupId'];
    activityId = json['activityId'];
    dealDateGregi = json['dealDateGregi'];
    dealDateHijri = json['dealDateHijri'];
    address = json['address'];
    email = json['email'];
    telephone = json['telephone'];
    fax = json['fax'];
    webSite = json['webSite'];
    registerNo = json['registerNo'];
    registerEndDateGregi = json['registerEndDateGregi'];
    registerEndDateHijri = json['registerEndDateHijri'];
    countryId = json['countryId'];
    cityId = json['cityId'];
    zip = json['zip'];
    poBox = json['poBox'];
    accountId = json['accountId'];
    currencyId = json['currencyId'];
    dayLimit = json['dayLimit'];
    moneyLimit = json['moneyLimit'];
    mainPartnerId = json['mainPartnerId'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    stoped = json['stoped'];
    bankId = json['bankId'];
    accountNo = json['accountNo'];
    iban = json['iban'];
    notes = json['notes'];
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
    shippingAddress = json['shippingAddress'];
    invoicingAddress = json['invoicingAddress'];
    openingBalance = json['openingBalance'];
    openingBalanceCurrencyId = json['openingBalanceCurrencyId'];
    taxFileNo = json['taxFileNo'];
    userName = json['userName'];
    password = json['password'];
    dob = json['dob'];
    gender = json['gender'];
    customerInbound = json['customerInbound'];
    mobiel = json['mobiel'];
    maritalstatus = json['maritalstatus'];
    workAddress = json['workAddress'];
    identityNumber = json['identityNumber'];
    passportNumber = json['passportNumber'];
    address2 = json['address2'];
    tel2 = json['tel2'];
    tel3 = json['tel3'];
    mobiel2 = json['mobiel2'];
    mobiel3 = json['mobiel3'];
    email2 = json['email2'];
    job = json['job'];
    openingBalanceType = json['openingBalanceType'];
    advertismentId = json['advertismentId'];
    importanceDegreeId = json['importanceDegreeId'];
    paymentType = json['paymentType'];
    buildingNo = json['buildingNo'];
    streetName = json['streetName'];
    district = json['district'];
    onlineCustomerId = json['onlineCustomerId'];
    onlineCustomerName = json['onlineCustomerName'];
    customerType = json['customerType'];
    additionalNumber = json['additionalNumber'];
    shortAddress = json['shortAddress'];
    other = json['other'];
    openingBalanceRemain = json['openingBalanceRemain'];
    mappingCreateDate = json['mappingCreateDate'];
    mappingCreateUserId = json['mappingCreateUserId'];
    mappingWriteDate = json['mappingWriteDate'];
    mappingWriteUserId = json['mappingWriteUserId'];
  }

  int? id;
  int? companyId;
  int? partnerType;
  String? code;
  String? partnerName;
  String? partnerNameWithCode;
  String? nameA;
  String? nameE;
  bool? isCustomerSupplier;
  int? partnerGroupId;
  int? activityId;
  String? dealDateGregi;
  String? dealDateHijri;
  String? address;
  String? email;
  String? telephone;
  String? fax;
  String? webSite;
  String? registerNo;
  dynamic registerEndDateGregi;
  String? registerEndDateHijri;
  dynamic countryId;
  dynamic cityId;
  dynamic zip;
  dynamic poBox;
  int? accountId;
  dynamic currencyId;
  dynamic dayLimit;
  dynamic moneyLimit;
  dynamic mainPartnerId;
  String? latitude;
  String? longitude;
  bool? stoped;
  dynamic bankId;
  String? accountNo;
  String? iban;
  String? notes;
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
  dynamic shippingAddress;
  dynamic invoicingAddress;
  dynamic openingBalance;
  dynamic openingBalanceCurrencyId;
  String? taxFileNo;
  String? userName;
  String? password;
  dynamic dob;
  dynamic gender;
  dynamic customerInbound;
  dynamic mobiel;
  dynamic maritalstatus;
  dynamic workAddress;
  dynamic identityNumber;
  dynamic passportNumber;
  dynamic address2;
  dynamic tel2;
  dynamic tel3;
  dynamic mobiel2;
  dynamic mobiel3;
  dynamic email2;
  dynamic job;
  dynamic openingBalanceType;
  dynamic advertismentId;
  dynamic importanceDegreeId;
  dynamic paymentType;
  dynamic buildingNo;
  dynamic streetName;
  dynamic district;
  dynamic onlineCustomerId;
  dynamic onlineCustomerName;
  dynamic customerType;
  String? additionalNumber;
  String? shortAddress;
  String? other;
  dynamic openingBalanceRemain;
  dynamic mappingCreateDate;
  dynamic mappingCreateUserId;
  dynamic mappingWriteDate;
  dynamic mappingWriteUserId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['companyId'] = companyId;
    map['partnerType'] = partnerType;
    map['code'] = code;
    map['partnerName'] = partnerName;
    map['partnerNameWithCode'] = partnerNameWithCode;
    map['nameA'] = nameA;
    map['nameE'] = nameE;
    map['isCustomerSupplier'] = isCustomerSupplier;
    map['partnerGroupId'] = partnerGroupId;
    map['activityId'] = activityId;
    map['dealDateGregi'] = dealDateGregi;
    map['dealDateHijri'] = dealDateHijri;
    map['address'] = address;
    map['email'] = email;
    map['telephone'] = telephone;
    map['fax'] = fax;
    map['webSite'] = webSite;
    map['registerNo'] = registerNo;
    map['registerEndDateGregi'] = registerEndDateGregi;
    map['registerEndDateHijri'] = registerEndDateHijri;
    map['countryId'] = countryId;
    map['cityId'] = cityId;
    map['zip'] = zip;
    map['poBox'] = poBox;
    map['accountId'] = accountId;
    map['currencyId'] = currencyId;
    map['dayLimit'] = dayLimit;
    map['moneyLimit'] = moneyLimit;
    map['mainPartnerId'] = mainPartnerId;
    map['latitude'] = latitude;
    map['longitude'] = longitude;
    map['stoped'] = stoped;
    map['bankId'] = bankId;
    map['accountNo'] = accountNo;
    map['iban'] = iban;
    map['notes'] = notes;
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
    map['shippingAddress'] = shippingAddress;
    map['invoicingAddress'] = invoicingAddress;
    map['openingBalance'] = openingBalance;
    map['openingBalanceCurrencyId'] = openingBalanceCurrencyId;
    map['taxFileNo'] = taxFileNo;
    map['userName'] = userName;
    map['password'] = password;
    map['dob'] = dob;
    map['gender'] = gender;
    map['customerInbound'] = customerInbound;
    map['mobiel'] = mobiel;
    map['maritalstatus'] = maritalstatus;
    map['workAddress'] = workAddress;
    map['identityNumber'] = identityNumber;
    map['passportNumber'] = passportNumber;
    map['address2'] = address2;
    map['tel2'] = tel2;
    map['tel3'] = tel3;
    map['mobiel2'] = mobiel2;
    map['mobiel3'] = mobiel3;
    map['email2'] = email2;
    map['job'] = job;
    map['openingBalanceType'] = openingBalanceType;
    map['advertismentId'] = advertismentId;
    map['importanceDegreeId'] = importanceDegreeId;
    map['paymentType'] = paymentType;
    map['buildingNo'] = buildingNo;
    map['streetName'] = streetName;
    map['district'] = district;
    map['onlineCustomerId'] = onlineCustomerId;
    map['onlineCustomerName'] = onlineCustomerName;
    map['customerType'] = customerType;
    map['additionalNumber'] = additionalNumber;
    map['shortAddress'] = shortAddress;
    map['other'] = other;
    map['openingBalanceRemain'] = openingBalanceRemain;
    map['mappingCreateDate'] = mappingCreateDate;
    map['mappingCreateUserId'] = mappingCreateUserId;
    map['mappingWriteDate'] = mappingWriteDate;
    map['mappingWriteUserId'] = mappingWriteUserId;
    return map;
  }

}