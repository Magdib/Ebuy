class ColorsModel {
  String? colorsId;
  String? colorsName;
  String? colorNameAr;
  ColorsModel({this.colorsId, this.colorsName, this.colorNameAr});

  ColorsModel.fromJson(Map<String, dynamic> json) {
    colorsId = json['Colors_id'];
    colorsName = json['Colors_name'];
    colorNameAr = json['Colors_name_ar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Colors_id'] = this.colorsId;
    data['Colors_name'] = this.colorsName;
    data['Colors_name_ar'] = this.colorNameAr;
    return data;
  }
}
