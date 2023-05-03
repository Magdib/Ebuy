class BrandsModel {
  String? brandId;
  String? brandName;
  String? brandNameAr;

  BrandsModel({this.brandId, this.brandName, this.brandNameAr});

  BrandsModel.fromJson(Map<String, dynamic> json) {
    brandId = json['brand_id'];
    brandName = json['brand_name'];
    brandNameAr = json['brand_name_ar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['brand_id'] = this.brandId;
    data['brand_name'] = this.brandName;
    data['brand_name_ar'] = this.brandNameAr;
    return data;
  }
}
