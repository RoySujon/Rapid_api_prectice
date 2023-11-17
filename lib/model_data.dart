class ModelData {
  Food? food;
  List<Measures>? measures;

  ModelData({this.food, this.measures});

  ModelData.fromJson(Map<String, dynamic> json) {
    food = json['food'] != null ? new Food.fromJson(json['food']) : null;
    if (json['measures'] != null) {
      measures = <Measures>[];
      json['measures'].forEach((v) {
        measures!.add(new Measures.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.food != null) {
      data['food'] = this.food!.toJson();
    }
    if (this.measures != null) {
      data['measures'] = this.measures!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Food {
  String? foodId;
  String? uri;
  String? label;
  String? knownAs;
  Nutrients? nutrients;
  String? category;
  String? categoryLabel;
  String? image;

  Food(
      {this.foodId,
      this.uri,
      this.label,
      this.knownAs,
      this.nutrients,
      this.category,
      this.categoryLabel,
      this.image});

  Food.fromJson(Map<String, dynamic> json) {
    foodId = json['foodId'];
    uri = json['uri'];
    label = json['label'];
    knownAs = json['knownAs'];
    nutrients = json['nutrients'] != null
        ? new Nutrients.fromJson(json['nutrients'])
        : null;
    category = json['category'];
    categoryLabel = json['categoryLabel'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['foodId'] = this.foodId;
    data['uri'] = this.uri;
    data['label'] = this.label;
    data['knownAs'] = this.knownAs;
    if (this.nutrients != null) {
      data['nutrients'] = this.nutrients!.toJson();
    }
    data['category'] = this.category;
    data['categoryLabel'] = this.categoryLabel;
    data['image'] = this.image;
    return data;
  }
}

class Nutrients {
  double? eNERCKCAL;
  double? pROCNT;
  double? fAT;
  double? cHOCDF;
  double? fIBTG;

  Nutrients({this.eNERCKCAL, this.pROCNT, this.fAT, this.cHOCDF, this.fIBTG});

  Nutrients.fromJson(Map<String, dynamic> json) {
    eNERCKCAL = json['ENERC_KCAL'];
    pROCNT = json['PROCNT'];
    fAT = json['FAT'];
    cHOCDF = json['CHOCDF'];
    fIBTG = json['FIBTG'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ENERC_KCAL'] = this.eNERCKCAL;
    data['PROCNT'] = this.pROCNT;
    data['FAT'] = this.fAT;
    data['CHOCDF'] = this.cHOCDF;
    data['FIBTG'] = this.fIBTG;
    return data;
  }
}

class Measures {
  String? uri;
  String? label;
  double? weight;

  Measures({this.uri, this.label, this.weight});

  Measures.fromJson(Map<String, dynamic> json) {
    uri = json['uri'];
    label = json['label'];
    weight = json['weight'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uri'] = this.uri;
    data['label'] = this.label;
    data['weight'] = this.weight;
    return data;
  }
}
