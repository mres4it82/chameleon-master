class QsRPresentation {
  QsRPresentation({
      this.id, 
      this.masterId, 
      this.descriptionA, 
      this.descriptionE,});

  QsRPresentation.fromJson(dynamic json) {
    id = json['id'];
    masterId = json['masterId'];
    descriptionA = json['descriptionA'];
    descriptionE = json['descriptionE'];
  }
  num? id;
  num? masterId;
  String? descriptionA;
  String? descriptionE;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['masterId'] = masterId;
    map['descriptionA'] = descriptionA;
    map['descriptionE'] = descriptionE;
    return map;
  }

}