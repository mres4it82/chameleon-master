class HrTransactionType {
  HrTransactionType({
    this.id,
    this.isSelected = false,
    this.name,
    this.nameA,
    this.nameE,
    this.nameU,
    this.nameH,
    this.nameF,
  });

  HrTransactionType.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    nameA = json['nameA'];
    nameE = json['nameE'];
    nameU = json['nameU'];
    nameH = json['nameH'];
    nameF = json['nameF'];
  }

  int? id;
  bool? isSelected;

  String? name;
  String? nameA;
  String? nameE;
  String? nameU;
  String? nameH;
  String? nameF;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['nameA'] = nameA;
    map['nameE'] = nameE;
    map['nameU'] = nameU;
    map['nameH'] = nameH;
    map['nameF'] = nameF;
    return map;
  }
}
